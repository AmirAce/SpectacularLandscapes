// -----JS CODE----- 

//@input Asset.Material Material_Simulate
//@input Asset.Material Material_Feedback
//@input Asset.Material Material_Render
//@input Asset.RenderMesh Render_Mesh
//@input float usingScreenTransform
//@input mat4 screenTransformMat

// Variables set by NGS
var MAT_SIMULATE;
var MAT_RENDER;
var VFX_OBJECT;
var INSTANCE_COUNT = 40;
var TEXEL_COUNT = 4;
var DIMENSIONS = new vec2(160.0, 1.0);
var COPY_ID = 0;
var MAX_COPIES = 32
var DEBUG_PRINT = false;

//////////////////////////////////////////////////////////////
// VFX Manager
//////////////////////////////////////////////////////////////
function VfxObject(simMaterial, renderMaterial, texelCount, instanceCount) {
	this.simMaterial = simMaterial;
	this.simMaterialPass = simMaterial.mainPass;
	this.simMaterialCloned = null;
	this.simMaterialClonedPass = null;	
	this.renderMaterial = renderMaterial;
	this.renderMaterialPass = renderMaterial.mainPass;
	this.texelCount = texelCount;
	this.instanceCount = instanceCount;
	this.passId = 0;
	this.objectId = 0;
	this.runtimeCopy = false;
	this.simMeshVisual = null;
	this.simMeshVisualCloned = null;
	this.renderMeshVisual = null;
	this.renderCamera = null;
	this.renderObject = null;
	this.sceneObjects = new Array(MAX_COPIES).fill(null);
	this.vfxComponents = new Array(MAX_COPIES).fill(null);
	this.transformPositions = new Array(MAX_COPIES).fill(vec3.zero());
	this.transformScales = new Array(MAX_COPIES).fill(vec3.one());
	this.aabbExtent = null;	
	this.copiesAdded = [];
	this.availableCopies = Array.from(Array(MAX_COPIES).keys())	;
	this.getNumCopies = function(){ 
		return MAX_COPIES - this.availableCopies.length - 1; 
	};
	this.getNewCopyId = function() {
		var copyId = this.availableCopies[0];
		var copyIdIndex = this.availableCopies.findIndex((element) => element == copyId);
		this.availableCopies.splice(copyIdIndex, 1);
		return copyId;
	};
	this.returnCopyId = function(copyId) {
		this.availableCopies.push(copyId);
		this.availableCopies.sort((a, b) => a - b);
		this.sceneObjects[copyId] = null;
		this.vfxComponents[copyId] = null;		
	}
}

function VfxPass(cameraObject, camera, layer, currentRT, previousRT, resizePass) {
	this.cameraObject = cameraObject;
	this.camera = camera;
	this.cameraTargets = camera.colorRenderTargets;
	this.layer = layer;
	this.currentRT = currentRT;
	this.previousRT = previousRT;
	this.dimensions = new vec2(1,1);
	this.resizePass = resizePass;
	this.currentOffset = new vec2(0.0, 0.0);
	this.vfxObjects = [];
	this.resizeFrame = 0;
	this.numVfxAdded = 0;
	this.isNew = true;
}

function VfxManager(sceneObject, resizeMaterial, isSpectacles) {
	this.passes = [];
	this.frame = 0;
	this.managerObject = sceneObject;
	this.resizeMaterial = resizeMaterial;
	this.screenQuadMesh = this.createQuadMesh(1.0, -1.0);
	this.particleQuadMesh = this.createQuadMesh(0.5, 0.0);
	this.sceneCameraComponentObjects = null;
	this.newVfxObjects = [];
	this.isSpectacles = isSpectacles;
	
	// Create the first pass
	this.createPass();
	
	if (DEBUG_PRINT) print("Created VFX Manager. Debug print enabled.")
}


//////////////////////////////////////////////////////////////
// Register
//////////////////////////////////////////////////////////////
VfxManager.prototype.register = function(simMaterial, renderMaterial, texelCount, instanceCount, vfxComponent) {
	
	var vfx = null;
	var data = {
		vfxObject : null,
		copyId : null
	}
	
	// Check if the VFX has already been registered
	// If it has, treat it as a batched copy and increase the instance count of the vfx object
	// The instance count is set later on the material after render targets have been resized or defragged 
	for (var i = 0; i < this.newVfxObjects.length; i++) {
		if (simMaterial.isSame(this.newVfxObjects[i].simMaterial)) {
			vfx = this.newVfxObjects[i];
			// @TODO: hack to prevent vfx getting set up twice when created by a script
			// remove this when LOOK-156044 is fixed
			for (var j = 0; j < vfx.vfxComponents.length; j++) {
				if (!isNull(vfx.vfxComponents[j]) && vfx.vfxComponents[j].isSame(vfxComponent)) {
					if (DEBUG_PRINT) print("Same VFX component found, not registering.");
					data.vfxObject = vfx;
					data.copyId = 0;
					return data;
				}
			}
			
			data.vfxObject = vfx;
			data.copyId = vfx.getNewCopyId();
			
			if (data.copyId === undefined) {
				this.printMaxCopiesWarning(vfxComponent.asset.name);
				return data;
			}
			vfx.copiesAdded.push(data.copyId);
			
			vfx.instanceCount = instanceCount * (vfx.getNumCopies() + 1);
			if (DEBUG_PRINT) {
				print("Same vfx found.");
				print("Num copies: " + vfx.getNumCopies());
			}
			return data;
		}
	}
	
	for (var i = 0; i < this.passes.length; i++) {
		var pass = this.passes[i];
		for (var j = 0; j < pass.vfxObjects.length; j++) {
			if (!isNull(pass.vfxObjects[j].simMaterial) && simMaterial.isSame(pass.vfxObjects[j].simMaterial)) {
				vfx = pass.vfxObjects[j];
				
				data.vfxObject = vfx;
				data.copyId = vfx.getNewCopyId();
				
				if (data.copyId === undefined) {
					this.printMaxCopiesWarning(vfxComponent.asset.name);
					continue;
				}
				vfx.copiesAdded.push(data.copyId);
				
				vfx.instanceCount = instanceCount * (vfx.getNumCopies() + 1);
				vfx.runtimeCopy = true;
				if (DEBUG_PRINT) {
					print("Same vfx found.");
					print("Num copies: " + vfx.getNumCopies());
					print("Runtime copy added.");
				}
			}
		}
	}
	
	// Accumulate the new VFX, complete registration in Late Update
	if (isNull(vfx)) {
		vfx = new VfxObject(simMaterial, renderMaterial, texelCount, instanceCount);
		data.vfxObject = vfx;
		data.copyId = vfx.getNewCopyId();
		vfx.copiesAdded.push(data.copyId);
	}
	
	this.newVfxObjects.push(vfx);
	return data;
}



//////////////////////////////////////////////////////////////
// Destroy
////////////////////////////////////////////////////////////// 
VfxManager.prototype.destroy = function(vfxObject, copyId) {
	
	// Can be undefined if the vfx object was an invalid copy
	if (vfxObject === undefined) {
		return;
	}
	
	// Disable these copies
	vfxObject.simMaterialPass["vfxBatchEnable[" + copyId.toString() + "]"] = false;
	vfxObject.renderMaterialPass["vfxBatchEnable[" + copyId.toString() + "]"] = false;
	
	// Make the ID available again
	if (vfxObject.getNumCopies() >= 0) {
		vfxObject.returnCopyId(copyId)
	}
	
	// Remove the VFX object if there are no other copies
	if (vfxObject.getNumCopies() < 0) {
		if (!isNull(vfxObject.simMeshVisual)) vfxObject.simMeshVisual.destroy();
		if (!isNull(vfxObject.renderMeshVisual)) vfxObject.renderMeshVisual.destroy();
		
		var pass = this.passes[vfxObject.passId];
		pass.vfxObjects = pass.vfxObjects.filter(function(obj) {
				return obj.objectId != vfxObject.objectId;
			});
	}
}


//////////////////////////////////////////////////////////////
// Add registered VFX
//////////////////////////////////////////////////////////////                
VfxManager.prototype.addRegisteredVfx = function() {
	
	// This is where we add newly registered VFX to the manager and calculate the new atlas resolution.
	// Called in LateUpdate to accumulate potentially many VFX that were enabled at once,
	// and ensure that the resize pass is only executed once.
	
	if (this.newVfxObjects.length > 0) {
		
		// Update the resolution of the pass
		for (var i = 0; i < this.newVfxObjects.length; i++) {
			var newVfx = this.newVfxObjects[i];
			var pass = this.passes[this.passes.length-1];
			var offsets = this.getNewOffset(pass, newVfx);
			
			if (isNull(newVfx.simMaterial) || isNull(newVfx.renderMaterial)) {
				if (DEBUG_PRINT) print("Materials not ready, not registering.");
				return;
			}
			
			// Create a new pass if the new vfx system makes the current one too big
			// Do not create a new pass if the current one is empty with target dimensions of (1,1)
			if (offsets.newOffset2d.y > 2047 && pass.isNew) {
				pass = this.createPass();
				offsets = this.getNewOffset(pass, newVfx);
			}
			
			// Set the new pass dimension property. wait to resize the RT's
			pass.dimensions = new vec2(2048.0, Math.min(2048.0, Math.max(pass.currentOffset.y + 1, 1.0)));
			
			// Initialize enable flags
			for (var j = 0; j < newVfx.copiesAdded.length; j++) {
				var idx = newVfx.copiesAdded[j];
				if (isNull(newVfx.sceneObjects[idx])) continue;
				newVfx.simMaterialPass["vfxBatchEnable[" + idx.toString() + "]"] = newVfx.sceneObjects[idx].isEnabledInHierarchy;
				newVfx.renderMaterialPass["vfxBatchEnable[" + idx.toString() + "]"] = newVfx.sceneObjects[idx].isEnabledInHierarchy;
			}
			
			// Set the number of copies
			newVfx.simMaterialPass.vfxNumCopies = newVfx.getNumCopies();
			newVfx.renderMaterialPass.vfxNumCopies = newVfx.getNumCopies();
			
			if (!newVfx.runtimeCopy) {
				pass.vfxObjects.push(newVfx);
				this.setupMaterialTextures(newVfx.simMaterial, pass.previousRT);
				this.setupMaterialTextures(newVfx.renderMaterial, pass.currentRT);
				
				newVfx.simMeshVisual = pass.cameraObject.createComponent('RenderMeshVisual');
				newVfx.simMeshVisual.mesh = this.screenQuadMesh;
				newVfx.simMeshVisual.mainMaterial = newVfx.simMaterial;
				newVfx.passId = this.passes.length-1;
				newVfx.objectId = pass.vfxObjects.length-1;
				
				if (pass.isNew) {
					newVfx.simMaterialPass.vfxOffsetInstancesRead = offsets.offsetInstances;
					newVfx.simMaterialPass.vfxOffsetInstancesWrite = offsets.offsetInstances;
					newVfx.simMaterialPass.vfxTargetWidth = offsets.targetWidth;
					
					newVfx.renderMaterialPass.vfxOffsetInstancesRead = offsets.offsetInstances;
					newVfx.renderMaterialPass.vfxOffsetInstancesWrite = offsets.offsetInstances;				
					newVfx.renderMaterialPass.vfxTargetWidth = offsets.targetWidth;
					
					newVfx.simMaterialPass.instanceCount = newVfx.instanceCount;
					newVfx.renderMaterialPass.instanceCount = newVfx.instanceCount;	
					
					newVfx.copiesAdded.length = 0;
				}
				
				if (this.isSpectacles) {
					newVfx.simMaterialCloned = newVfx.simMaterial.clone();
					newVfx.simMaterialClonedPass = newVfx.simMaterialCloned.mainPass;
					this.setupMaterialTextures(newVfx.simMaterialCloned, pass.previousRT);
					
					newVfx.simMeshVisualCloned = pass.cameraObject.createComponent('RenderMeshVisual');
					newVfx.simMeshVisualCloned.mesh = this.screenQuadMesh;
					newVfx.simMeshVisualCloned.mainMaterial = newVfx.simMaterialCloned;
					newVfx.simMeshVisualCloned.enabled = false;
				}
				
				pass.numVfxAdded += 1;
			}
			
			if (DEBUG_PRINT) {
				print("//// NUM " + i.toString());
				print("instance count: " + newVfx.instanceCount);
				print("texel count: " + newVfx.texelCount);
				print("offset instances: " + offsets.offsetInstances);
				print("offset 2d: " + pass.currentOffset);
			}
			
		}//newVfxObjects
		
		
		// Resize render targets
		for (var i = 0; i < this.passes.length; i++) {
			var pass = this.passes[i];
			if (pass.isNew) {
				this.setRenderTargetResolution(pass.currentRT, pass.dimensions);
				this.setRenderTargetResolution(pass.previousRT, pass.dimensions);
				pass.numVfxAdded = 0;
			}
			else {
				// Initiate runtime resize
				pass.resizeFrame = 1;
			}
			
			// Update all materials in the pass with new resolution
			this.setNewResolution(pass);	
			pass.isNew = false;
			if (DEBUG_PRINT) print("Pass " + i.toString() + " res: " + pass.dimensions);
		}
		
		// Empty the temp array
		this.newVfxObjects.length = 0;
	}
	
	return;
	
}    


//////////////////////////////////////////////////////////////
// Get new offset
//////////////////////////////////////////////////////////////     
VfxManager.prototype.getNewOffset = function(pass, newVfx) {
	// Get the splat dimensions of the new vfx
	var particleCount2d = new vec2(Math.floor(2048.0 / newVfx.texelCount), Math.ceil(newVfx.instanceCount * newVfx.texelCount / 2048.0));
	var particleCount1d = newVfx.instanceCount * newVfx.texelCount;
	var targetWidth = particleCount2d.x * newVfx.texelCount;
	
	// Get the current offset
	var offsetPixels = new vec2(pass.currentOffset.x, pass.currentOffset.y);
	var offset1d = offsetPixels.x + (2048.0 * Math.max(offsetPixels.y, 0.0));
	var correctedOffset1d = offset1d;  
	var offsetInstances = 0;
	
	// quantize the current 1d offset to align to the next system's texel count
	if (pass.vfxObjects.length > 0) {
		correctedOffset1d = Math.ceil(offset1d / newVfx.texelCount) * newVfx.texelCount;
		offsetInstances = correctedOffset1d / newVfx.texelCount;
	}
	correctedOffset1d += particleCount1d; 
	
	newOffset2d = new vec2(0,0);
	newOffset2d.x = correctedOffset1d % targetWidth;
	newOffset2d.y = Math.ceil(correctedOffset1d / targetWidth);	
	
	// set pass offset
	pass.currentOffset.x = correctedOffset1d % targetWidth;
	pass.currentOffset.y = Math.floor(correctedOffset1d / targetWidth);		
	
	// offsetInstances	: 1d offset, in # of instances
	// newOffset2d		: offset, in pixels
	// targetWidth		:  the width of the vfx system, in pixels
	return {
		"offsetInstances":offsetInstances,  
		"newOffset2d":newOffset2d,			
		"targetWidth":targetWidth			
	}
}



VfxManager.prototype.setNewResolution = function(pass) {
	for (var i = 0; i < pass.vfxObjects.length; i++) {
		var vfx = pass.vfxObjects[i];
		if (!isNull(pass.vfxObjects[i].renderMaterial)) {
			var simPass = vfx.simMaterial.mainPass;
			var renderPass = vfx.renderMaterial.mainPass;
			var clonedSimPass = vfx.simMaterialClonedPass;
			
			simPass.vfxTargetSizeWrite = pass.dimensions;
			renderPass.vfxTargetSizeWrite = pass.dimensions;
			renderPass.vfxTargetSizeRead = pass.dimensions;
			if (!isNull(clonedSimPass)) clonedSimPass.vfxTargetSizeWrite = pass.dimensions;
			
			if (pass.isNew) {
				// Read and write is the same
				simPass.vfxTargetSizeRead = pass.dimensions;
				renderPass.vfxTargetSizeRead = pass.dimensions;
				if (!isNull(clonedSimPass)) clonedSimPass.vfxTargetSizeRead = pass.dimensions;
			}
		}
	}	
}

//////////////////////////////////////////////////////////////
// Update
//////////////////////////////////////////////////////////////
VfxManager.prototype.update = function() {
	
	this.addRegisteredVfx();
	
	for (var i = 0; i < this.passes.length; i++) {
		var pass = this.passes[i];
		
		this.updateEnable(pass);
		
		// Swap
		[pass.currentRT, pass.previousRT] = [pass.previousRT, pass.currentRT];
		this.updatePassTargets(pass);
		
		this.resize(pass);
	}
	
	this.frame += 1;
}


//////////////////////////////////////////////////////////////
// Resize
//////////////////////////////////////////////////////////////
VfxManager.prototype.resize = function(pass) {
	
	if (pass.resizeFrame == 1) {
		
		pass.currentOffset = new vec2(0.0, 0.0);
		
		// Resize write RT
		this.setRenderTargetResolution(pass.currentRT, pass.dimensions);
		
		for (var i = 0; i < pass.vfxObjects.length; i++) {
			var vfx = pass.vfxObjects[i];
			var simPass = vfx.simMaterialPass;
			var renderPass = vfx.renderMaterialPass;
			
			// Update instance count
			simPass.instanceCount = vfx.instanceCount;
			renderPass.instanceCount = vfx.instanceCount;	
			
			var offsets = this.getNewOffset(pass, vfx);
			
			// Set new write state
			simPass.vfxOffsetInstancesWrite = offsets.offsetInstances;
			simPass.vfxTargetWidth = offsets.targetWidth;
			
			renderPass.vfxOffsetInstancesRead = offsets.offsetInstances;
			renderPass.vfxOffsetInstancesWrite = offsets.offsetInstances;		
			renderPass.vfxTargetWidth = offsets.targetWidth;
			
			// Disable most recently added vfx on first frame
			if (i >= pass.vfxObjects.length - pass.numVfxAdded) {
				vfx.simMeshVisual.enabled = false;
			}
			
			// Disable sim decoding previous frame for one frame on new copies
			for (var j = 0; j < vfx.copiesAdded.length; j++) {
				var idx = vfx.copiesAdded[j];
				if (isNull(vfx.sceneObjects[idx])) continue;
				simPass["vfxBatchEnable[" + idx.toString() + "]"] = false;
				renderPass["vfxBatchEnable[" + idx.toString() + "]"] = false;
			}			
		}
		pass.resizeFrame = 2;
	}
	else if (pass.resizeFrame == 2) {
		
		// Resize write RT
		this.setRenderTargetResolution(pass.currentRT, pass.dimensions);
		
		for (var i = 0; i < pass.vfxObjects.length; i++) {
			var vfx = pass.vfxObjects[i];
			var simPass = vfx.simMaterialPass;
			
			// Set new read state
			simPass.vfxOffsetInstancesRead = simPass.vfxOffsetInstancesWrite;
			simPass.vfxTargetSizeRead = simPass.vfxTargetSizeWrite;
			
			// Enable most recently added vfx on first frame
			if (i >= pass.vfxObjects.length - pass.numVfxAdded) {
				vfx.simMeshVisual.enabled = true;
			}
			
			// Enable sim decoding previous frame for one frame on new copies
			for (var j = 0; j < vfx.copiesAdded.length; j++) {
				var idx = vfx.copiesAdded[j];
				if (isNull(vfx.sceneObjects[idx])) continue;
				simPass["vfxBatchEnable[" + idx.toString() + "]"] = true;
				vfx.renderMaterialPass["vfxBatchEnable[" + idx.toString() + "]"] = true;
			}			
			vfx.copiesAdded.length = 0;	
		}
		
		pass.numVfxAdded = 0;
		pass.resizeFrame = 0;
	}
}


//////////////////////////////////////////////////////////////
// Update Spectacles
//////////////////////////////////////////////////////////////
VfxManager.prototype.updateSpectacles = function() {
	
	this.addRegisteredVfx();
	
	for (var i = 0; i < this.passes.length; i++) {
		var pass = this.passes[i];
		
		this.updateEnable(pass);
		
		for (var j = 0; j < pass.vfxObjects.length; j++) {
			pass.vfxObjects[j].simMeshVisual.enabled = true;
			pass.vfxObjects[j].simMeshVisualCloned.enabled = false;
			this.setCameraTargets(pass.resizePass.cameraTargets, pass.previousRT);  
		}
		
		this.resizeSpectacles(pass);
	}
	
	this.frame += 1;
}


//////////////////////////////////////////////////////////////
// Resize Spectacles
//////////////////////////////////////////////////////////////
VfxManager.prototype.resizeSpectacles = function(pass) {
	if (pass.resizeFrame == 1) {
		
		global.scene.forceRecordFrame();
		
		// Resize write RT's
		this.setRenderTargetResolution(pass.currentRT, pass.dimensions);
		this.setRenderTargetResolution(pass.resizePass.renderTargets, pass.dimensions);
		
		// Set old read RT as input of clone sim material
		for (var i = 0; i < pass.vfxObjects.length; i++) {
			var vfx = pass.vfxObjects[i];
			this.setMaterialTex(vfx.simMaterialCloned, pass.previousRT);
		}
		
		this.setCameraTargets(pass.resizePass.cameraTargets, pass.resizePass.renderTargets);  
		
		// Swap
		[pass.previousRT, pass.resizePass.renderTargets] = [pass.resizePass.renderTargets, pass.previousRT];
		
		pass.currentOffset = new vec2(0.0, 0.0);
		
		for (var i = 0; i < pass.vfxObjects.length; i++) {
			var vfx = pass.vfxObjects[i];
			var simPass = vfx.simMaterialPass;
			var clonedSimPass = vfx.simMaterialClonedPass;
			var renderPass = vfx.renderMaterialPass;
			
			vfx.simMeshVisual.enabled = false;
			vfx.simMeshVisualCloned.enabled = true;
			
			// Set new read RT as input of master sim material
			if (!isNull(vfx.renderMaterial)) {
				this.setMaterialTex(vfx.simMaterial, pass.previousRT);
			}
			
			// Update instance count
			simPass.instanceCount = vfx.instanceCount;
			renderPass.instanceCount = vfx.instanceCount;	
			
			// Copy old state and batching uniforms to cloned sim material
			this.copySimulationUniforms(clonedSimPass, simPass);
			
			var offsets = this.getNewOffset(pass, vfx);
			
			// Set new read and write state
			simPass.vfxOffsetInstancesWrite = offsets.offsetInstances;
			simPass.vfxOffsetInstancesRead = offsets.offsetInstances;
			simPass.vfxTargetWidth = offsets.targetWidth;
			
			// Cloned pass uses new write state only
			clonedSimPass.vfxOffsetInstancesWrite = offsets.offsetInstances;
			clonedSimPass.vfxTargetWidth = offsets.targetWidth;
			
			renderPass.vfxOffsetInstancesRead = offsets.offsetInstances;
			renderPass.vfxOffsetInstancesWrite = offsets.offsetInstances;
			renderPass.vfxTargetWidth = offsets.targetWidth;
			
			// Sync the target size read on the master sim material in preparation for the next frame
			simPass.vfxTargetSizeRead = simPass.vfxTargetSizeWrite;
			
			// Disable most recently added vfx on first frame
			if (i >= pass.vfxObjects.length - pass.numVfxAdded) {
				vfx.simMeshVisualCloned.enabled = false;
			}
			
			// Disable sim decoding previous frame for one frame on new copies
			for (var j = 0; j < vfx.copiesAdded.length; j++) {
				var idx = vfx.copiesAdded[j];
				if (isNull(vfx.sceneObjects[idx])) continue;
				simPass["vfxBatchEnable[" + idx.toString() + "]"] = true;
				clonedSimPass["vfxBatchEnable[" + idx.toString() + "]"] = false;
				renderPass["vfxBatchEnable[" + idx.toString() + "]"] = false;
			}            
			vfx.copiesAdded.length = 0;
		}
		
		pass.numVfxAdded = 0;
		pass.resizeFrame = 0;
	}
}


VfxManager.prototype.copySimulationUniforms = function(clonedSimPass, simPass) {
	clonedSimPass.instanceCount 			= simPass.instanceCount;
	clonedSimPass.vfxNumCopies				= simPass.vfxNumCopies;
	clonedSimPass.vfxOffsetInstancesRead 	= simPass.vfxOffsetInstancesRead;
	clonedSimPass.vfxTargetWidth 			= simPass.vfxTargetWidth;
	clonedSimPass.vfxTargetSizeRead 		= simPass.vfxTargetSizeRead;
	
	for (var i = 0; i < 32; i++) {
		var iStr = i.toString();
		clonedSimPass["vfxBatchEnable[" + iStr + "]"] 						= simPass["vfxBatchEnable[" + iStr + "]"];
		clonedSimPass["vfxModelMatrix[" + iStr + "]"] 						= simPass["vfxModelMatrix[" + iStr + "]"];
		clonedSimPass["vfxModelMatrixInverse[" + iStr + "]"] 				= simPass["vfxModelMatrixInverse[" + iStr + "]"];
		clonedSimPass["vfxModelViewMatrix[" + iStr + "]"] 					= simPass["vfxModelViewMatrix[" + iStr + "]"];
		clonedSimPass["vfxModelViewMatrixInverse[" + iStr + "]"] 			= simPass["vfxModelViewMatrixInverse[" + iStr + "]"];
		clonedSimPass["vfxModelViewProjectionMatrix[" + iStr + "]"] 		= simPass["vfxModelViewProjectionMatrix[" + iStr + "]"];
		clonedSimPass["vfxModelViewProjectionMatrixInverse[" + iStr + "]"]	= simPass["vfxModelViewProjectionMatrixInverse[" + iStr + "]"];
		clonedSimPass["vfxWorldAabbMin[" + iStr + "]"] 						= simPass["vfxWorldAabbMin[" + iStr + "]"];
		clonedSimPass["vfxWorldAabbMax[" + iStr + "]"] 						= simPass["vfxWorldAabbMax[" + iStr + "]"];
	}	
}

VfxManager.prototype.setRenderTargetResolution = function(renderTargets, resolution) {
	for (var i = 0; i < 4; i++) {
		renderTargets[i].control.resolution = resolution;
	}
}


VfxManager.prototype.updatePassTargets = function(pass) {
	
	this.setCameraTargets(pass.cameraTargets, pass.currentRT);  
	
	for (var i = 0; i < pass.vfxObjects.length; i++) {
		if (!isNull(pass.vfxObjects[i].renderMaterial)) {
			this.setMaterialTex(pass.vfxObjects[i].simMaterial, pass.previousRT);
			this.setMaterialTex(pass.vfxObjects[i].renderMaterial, pass.currentRT);
		}
	}
}

VfxManager.prototype.updateEnable = function(pass) {
	for (var i = 0; i < pass.vfxObjects.length; i++) {
		var vfx = pass.vfxObjects[i];
		for (var j = 0; j < vfx.sceneObjects.length; j++) {
			if (isNull(vfx.sceneObjects[j])) continue;
			
			var isInFrustum = true;
			if (!isNull(vfx.aabbExtent)) {
				// Cull local space batches
				var aabbTransform = vfx.transformScales[j].uniformScale(vfx.aabbExtent);
				var aabbExtent = Math.max(aabbTransform.x, Math.max(aabbTransform.y, aabbTransform.z));
				isInFrustum = vfx.renderCamera.isSphereVisible(vfx.transformPositions[j], aabbExtent);
			}
			vfx.renderMaterialPass["vfxBatchEnable[" + j.toString() + "]"] = vfx.sceneObjects[j].isEnabledInHierarchy && isInFrustum;
		}
	}
}

//////////////////////////////////////////////////////////////
// Config Material Textures
//////////////////////////////////////////////////////////////              
VfxManager.prototype.setupMaterialTextures = function( material, renderTargetArray )
{
	this.setMaterialTex(material, renderTargetArray);
	
	var matSamplers = material.mainPass.samplers;
	
	matSamplers.renderTarget0.filtering = FilteringMode.Nearest;
	matSamplers.renderTarget1.filtering = FilteringMode.Nearest;
	matSamplers.renderTarget2.filtering = FilteringMode.Nearest;
	matSamplers.renderTarget3.filtering = FilteringMode.Nearest;
	
	matSamplers.renderTarget0.wrap = WrapMode.ClampToEdge;
	matSamplers.renderTarget1.wrap = WrapMode.ClampToEdge;
	matSamplers.renderTarget2.wrap = WrapMode.ClampToEdge;
	matSamplers.renderTarget3.wrap = WrapMode.ClampToEdge;
}

//////////////////////////////////////////////////////////////
// Set Material Textures
//////////////////////////////////////////////////////////////                              
VfxManager.prototype.setMaterialTex = function( material, renderTargetArray ) {
	var matPass = material.mainPass;
	matPass.renderTarget0 = renderTargetArray[0];
	matPass.renderTarget1 = renderTargetArray[1];
	matPass.renderTarget2 = renderTargetArray[2];
	matPass.renderTarget3 = renderTargetArray[3];	
}


//////////////////////////////////////////////////////////////
// Set Camera Render Targets
//////////////////////////////////////////////////////////////                     
VfxManager.prototype.setCameraTargets = function( cameraTargets, renderTargetArray ) {
	for ( var i = 0; i < 4; i++ ) {
		cameraTargets[i].targetTexture = renderTargetArray[i];
	}	
}


//////////////////////////////////////////////////////////////
// Create Pass
//////////////////////////////////////////////////////////////
VfxManager.prototype.createPass = function() {
	var layer = LayerSet.makeUnique();			
	var cameraObject = global.scene.createSceneObject('_ngsCameraObject');
	cameraObject.setParent(this.managerObject);
	cameraObject.layer = layer;
	
	var cameraComponent = cameraObject.createComponent('Camera');
	
	if ( cameraComponent.supportedColorRenderTargetCount < 4 ) 
	{
		print("VFX is not supported because 4 render targets are not available.");
		return;
	}
	
	var currentRT = [];
	var previousRT = [];
	
	for ( var i = 0; i < 4; i++ ) 
	{
		var targetA = this.createRenderTarget();
		targetA.control.replayCapture = true
		currentRT.push( targetA );
		var targetB = this.createRenderTarget();
		targetB.control.replayCapture = true
		previousRT.push( targetB );
	}
	
	this.setupCamera( cameraComponent, layer, currentRT, -1000 );
	
	var resizePass = this.createResizePass(this.resizeMaterial.clone(), currentRT, previousRT)
	
	var pass = new VfxPass(cameraObject, cameraComponent, layer, currentRT, previousRT, resizePass);
	this.passes.push(pass);
	return pass;
}


//////////////////////////////////////////////////////////////
// Create Resize Pass
//////////////////////////////////////////////////////////////
VfxManager.prototype.createResizePass = function(resizeMaterial, readRT, writeRT) {
	var layer = LayerSet.makeUnique();			
	var resizeSO = global.scene.createSceneObject('_ngsResizeCameraObject');
	resizeSO.setParent(this.managerObject);
	resizeSO.layer = layer;
	
	var cameraComponent = resizeSO.createComponent('Camera');
	var resizeRT = [];
	
	for ( var i = 0; i < 4; i++ ) 
	{
		var targetA = this.createRenderTarget();
		targetA.control.replayCapture = true
		resizeRT.push( targetA );
	}
	
	this.setupCamera( cameraComponent, layer, writeRT, -999 );
	
	var postEffect = resizeSO.createComponent('Component.PostEffectVisual');
	postEffect.mainMaterial = resizeMaterial;
	
	this.setupMaterialTextures(resizeMaterial, readRT);
	
	// Disabled by default
	resizeSO.enabled = this.isSpectacles;
	
	var pass = {
		"resizeObject": resizeSO,
		"camera": cameraComponent,
		"cameraTargets": cameraComponent.colorRenderTargets,
		"renderTargets": resizeRT,
		"material": resizeMaterial,
		"resolution": resizeRT[0].control.resolution
	}
	return pass;
}


//////////////////////////////////////////////////////////////
// Setup Camera
//////////////////////////////////////////////////////////////
VfxManager.prototype.setupCamera = function( camera, layer, renderTargetArray, renderOrder )
{
	camera.enableClearColor = true;
	camera.renderLayer = layer;
	camera.renderOrder = renderOrder;
	camera.depthBufferMode = Camera.DepthBufferMode.Regular;
	camera.devicePropertyUsage = Camera.DeviceProperty.All;
	camera.size = 2.0;
	camera.near = 0.1;
	camera.far  = 100.0;
	camera.type = Camera.Type.Orthographic;
	camera.devicePropertyUsage = Camera.DeviceProperty.None;
	
	var colorRenderTargets = camera.colorRenderTargets;
	var clearColor = new vec4( 0, 0, 0, 0 );
	
	for ( var i = 0; i < 4; i++ )
	{
		if ( renderTargetArray[i] )
		{
			this.checkOrAddColorRenderTarget( colorRenderTargets, i );
			colorRenderTargets[i].targetTexture = renderTargetArray[i];
			colorRenderTargets[i].clearColor = clearColor;
		}
		else
		{
			print( "renderTargetArray[" + i + "] is null" );
			
			if ( colorRenderTargets[i] != null ) colorRenderTargets[i].targetTexture = null;
			else print( "colorRenderTarget[" + i + "] is null" );
		}
	}
	
	camera.colorRenderTargets = colorRenderTargets;
};


VfxManager.prototype.checkOrAddColorRenderTarget = function( colorRenderTargetsArray, colorAttachmentIndex )
{
	if ( colorAttachmentIndex >= colorRenderTargetsArray.length )
	{
		for ( var i = colorRenderTargetsArray.length; i <= colorAttachmentIndex; i++ )
		{
			colorRenderTargetsArray.push( Camera.createColorRenderTarget() );
		}
	}
}


//////////////////////////////////////////////////////////////
// Create Render Target
//////////////////////////////////////////////////////////////
VfxManager.prototype.createRenderTarget = function() {
	
	var renderTarget = global.scene.createRenderTargetTexture();
	var renderTargetControl = renderTarget.control;
	renderTargetControl.useScreenResolution = false;
	renderTargetControl.resolution = new vec2(1,1);
	renderTargetControl.clearColorEnabled = true;
	renderTargetControl.clearDepthEnabled = false;
	renderTargetControl.fxaa = false;
	renderTargetControl.msaa = false;
	
	return renderTarget;
}

//////////////////////////////////////////////////////////////
// Create Quad Mesh
//////////////////////////////////////////////////////////////
VfxManager.prototype.createQuadMesh = function(scale, zPosition) {
	var builder = new MeshBuilder([
			{ name: "position", components: 3 },
			{ name: "normal", components: 3, normalized: true },
			{ name: "texture0", components: 2 },
		]);
	
	builder.topology = MeshTopology.Triangles;
	builder.indexType = MeshIndexType.UInt16;
	
	var left = -scale; 
	var right = scale;
	var top = scale;
	var bottom = -scale;
	
	builder.appendVerticesInterleaved([
			// Position         		Normal      UV       Index
			left, top, zPosition,       0, 0, 1,    0, 1,    // 0
			left, bottom, zPosition,    0, 0, 1,    0, 0,    // 1
			right, bottom, zPosition,   0, 0, 1,    1, 0,    // 2
			right, top, zPosition,      0, 0, 1,    1, 1,    // 3
		]);
	
	builder.appendIndices([ 
			0,1,2, // First Triangle
			2,3,0, // Second Triangle
		]);	
	if( builder.isValid() )
	{
		builder.updateMesh();
		return builder.getMesh();
	}
}

//////////////////////////////////////////////////////////////
// Get cameras in the scene
//////////////////////////////////////////////////////////////
VfxManager.prototype.getCameras = function() {
	var cameraComponentObjects = {arrayKey : []};
	for (var i = 0; i < global.scene.getRootObjectsCount(); i++) 
	{
		var rootObject = global.scene.getRootObject(i);
		componentSearchRecursive(rootObject, "Component.Camera", cameraComponentObjects);
	}
	this.sceneCameraComponentObjects = cameraComponentObjects.arrayKey;	
}

//////////////////////////////////////////////////////////////
// Print warning
//////////////////////////////////////////////////////////////
VfxManager.prototype.printMaxCopiesWarning = function(vfxAssetName) {
	print("[" + vfxAssetName + "] Warning: maximum number of copies reached (" + MAX_COPIES + "). Duplicate this asset to add more copies to the scene.");
}

//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------                				

var isInitialized = false;
var scriptObject = null;
var scriptTransform = null;
var renderObject = null;
var renderMeshVisual = null;
var renderMesh = null;
var renderCamera = null;
var renderCameraTransform = null;
var vfxSceneObject = null;
var vfxComponent = null;
var simulatePass;			
var renderPass;
var aabbMinVec4;
var aabbMaxVec4;
var modelMatrixString;
var modelMatrixInverseString;
var modelViewMatrixString;
var modelViewMatrixInverseString;
var modelViewProjectionMatrixString;
var modelViewProjectionMatrixInverseString;
var worldAabbMinString;
var worldAabbMaxString;

var updateUniforms = function()
{
	/* These are commented out dynamically based on what's needed by the VFX asset */
	/* Get transforms */
	
	// Model
	var modelMatrix = (script.usingScreenTransform) ? script.screenTransformMat : scriptTransform.getWorldTransform();
	// var modelMatrixInv = (script.usingScreenTransform) ? modelMatrix.inverse() : scriptTransform.getInvertedWorldTransform(); 
	
	// View
	
	var viewMatrix = renderCameraTransform.getInvertedWorldTransform();
	// var modelViewMatrix = viewMatrix.mult(modelMatrix);
	
	// Projection
	
	var cameraAspect = renderCamera.aspect;
	var cameraFov = renderCamera.fov;
	var cameraNear = renderCamera.near;
	var cameraFar = renderCamera.far;
	
	var projectionMatrix;
	if (renderCamera.type == Camera.Type.Orthographic) {
		var orthoSize = renderCamera.getOrthographicSize().uniformScale(0.5);
		projectionMatrix = mat4.orthographic(-orthoSize.x, orthoSize.x, -orthoSize.y, orthoSize.y, cameraNear, cameraFar);
	}
	else {
		projectionMatrix = mat4.perspective(cameraFov, cameraAspect, cameraNear, cameraFar);								
	}
	var viewProjection = projectionMatrix.mult(viewMatrix);			
	
	// var modelViewProjection = projectionMatrix.mult(viewMatrix.mult(modelMatrix));		
	
	// AABB
	
	/*
	var worldAabbMinVec4 = modelMatrix.multiplyVector(aabbMinVec4);
	var worldAabbMin = new vec3(worldAabbMinVec4.x, worldAabbMinVec4.y, worldAabbMinVec4.z);
	var worldAabbMaxVec4 = modelMatrix.multiplyVector(aabbMaxVec4);
	var worldAabbMax = new vec3(worldAabbMaxVec4.x, worldAabbMaxVec4.y, worldAabbMaxVec4.z);
	*/
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	/* Set batching uniforms */
	
	// Model
	simulatePass[modelMatrixString] = modelMatrix;
	renderPass[modelMatrixString] 	= modelMatrix;
	
	// VFX_OBJECT.transformPositions[COPY_ID] = scriptTransform.getWorldPosition();
	// VFX_OBJECT.transformScales[COPY_ID] = scriptTransform.getWorldScale();
	
	
	// simulatePass[modelMatrixInverseString] = modelMatrixInv;
	// renderPass[modelMatrixInverseString] = modelMatrixInv;
	
	// Model x View
	
	// simulatePass[modelViewMatrixString] = modelViewMatrix;
	// renderPass[modelViewMatrixString] = modelViewMatrix;
	// simulatePass[modelViewMatrixInverseString] = modelViewMatrix.inverse();
	// renderPass[modelViewMatrixInverseString] = modelViewMatrix.inverse();
	
	// Model x View x Projection
	
	// simulatePass[modelViewProjectionMatrixString] = modelViewProjection;
	// renderPass[modelViewProjectionMatrixString] = modelViewProjection;
	// simulatePass[modelViewProjectionMatrixInverseString] = modelViewProjection.inverse();
	// renderPass[modelViewProjectionMatrixInverseString] = modelViewProjection.inverse();
	
	// AABB
	
	/*
	simulatePass[worldAabbMinString] = worldAabbMin;
	renderPass[worldAabbMinString] = worldAabbMin;
	simulatePass[worldAabbMaxString] = worldAabbMax;
	renderPass[worldAabbMaxString] = worldAabbMax;
	*/
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	/* Set batching-independent uniforms */
	if (COPY_ID > 0) {
		return;
	}
	
	updateRenderMesh(); 
	renderMeshVisual.setRenderOrder(vfxComponent.getRenderOrder());
	renderObject.layer = vfxSceneObject.layer;		
	
	// Camera
	
	simulatePass.vfxCameraAspect = cameraAspect;
	simulatePass.vfxCameraNear = cameraNear;
	simulatePass.vfxCameraFar = cameraFar;
	// simulatePass.vfxCameraUp = renderCameraTransform.up;
	// simulatePass.vfxCameraForward = renderCameraTransform.forward;
	// simulatePass.vfxCameraRight = renderCameraTransform.right;			
	
	// Projection
	
	simulatePass.vfxProjectionMatrix = projectionMatrix;
	// simulatePass.vfxProjectionMatrixInverse = projectionMatrix.inverse();
	
	// View
	
	simulatePass.vfxViewMatrix = viewMatrix;
	// simulatePass.vfxViewMatrixInverse = viewMatrix.inverse();
	
	// View Projection
	
	simulatePass.vfxViewProjectionMatrix = viewProjection;
	// simulatePass.vfxViewProjectionMatrixInverse = viewProjection.inverse();
	
	simulatePass.vfxFrame = script.vfxFrame;
	
	script.vfxFrame++;
	
}

var initialize = function()
{
	script.vfxFrame = 0;
	
	MAT_SIMULATE = script.Material_Simulate;
	MAT_RENDER = script.Material_Render;
	
	scriptObject = script.getSceneObject();
	scriptTransform = scriptObject.getTransform();
	vfxSceneObject = scriptObject.getParent();
	vfxComponent = vfxSceneObject.getComponent("Component.VFXComponent");
	simulatePass = MAT_SIMULATE.mainPass;
	renderPass = MAT_RENDER.mainPass;
	
	if (!global._ngsVfxManager) 
	{
		var isSpecs = global.deviceInfoSystem.isSpectacles();
		
		var vfxManagerSO = global.scene.createSceneObject("_ngsVfxManager");
		global._ngsVfxManager = new VfxManager(vfxManagerSO, script.Material_Feedback, isSpecs);
		
		var scriptComp = vfxManagerSO.createComponent("Script");
		var updateEvent = scriptComp.createEvent("LateUpdateEvent");
		if (isSpecs) {
			updateEvent.bind(function(){ global._ngsVfxManager.updateSpectacles(); });       				
		}
		else {
			updateEvent.bind(function(){ global._ngsVfxManager.update(); });       				
		}                           
	}
	
	var vfxInfo = global._ngsVfxManager.register(MAT_SIMULATE, MAT_RENDER, TEXEL_COUNT, INSTANCE_COUNT, vfxComponent);
	var vfxObj = vfxInfo.vfxObject;
	COPY_ID = vfxInfo.copyId;
	
	if (isNull(vfxObj) || vfxObj === undefined || COPY_ID === undefined) {
		return;
	}
	
	VFX_OBJECT = vfxObj;
	VFX_OBJECT.sceneObjects[COPY_ID] = scriptObject;
	VFX_OBJECT.vfxComponents[COPY_ID] = vfxComponent;
	
	script.usingScreenTransform = false;
	
	copyIdString = COPY_ID.toString();
	arrayName = "vfxModelMatrix[" + COPY_ID.toString() + "]";
	
	// Set array names
	modelMatrixString = "vfxModelMatrix[" + copyIdString + "]"
	modelMatrixInverseString = "vfxModelMatrixInverse[" + copyIdString + "]"
	modelViewMatrixString = "vfxModelViewMatrix[" + copyIdString + "]"
	modelViewMatrixInverseString = "vfxModelViewMatrixInverse[" + copyIdString + "]"
	modelViewProjectionMatrixString = "vfxModelViewProjectionMatrix[" + copyIdString + "]"
	modelViewProjectionMatrixInverseString = "vfxModelViewProjectionMatrixInverse[" + copyIdString + "]"
	worldAabbMinString = "vfxWorldAabbMin[" + copyIdString + "]";
	worldAabbMaxString = "vfxWorldAabbMax[" + copyIdString + "]";
	
	if (COPY_ID == 0) {
		// Keep track of camera components in the manager, only update the list if vfx is enabled at runtime
		if (isNull(global._ngsVfxManager.sceneCameraComponentObjects) || global._ngsVfxManager.frame > 1) 
		{
			global._ngsVfxManager.getCameras();
		}
		
		// For final rendering, create a new scene object/mesh visual and parent it to the VFX Mananager.
		// This ensures batched copies are not disabled if the original copy is.
		// The world transform is set by the batching arrays.
		renderMeshVisual = createMeshVisual( MAT_RENDER, vfxComponent.getRenderOrder());
		renderMesh = renderMeshVisual.mesh;
		renderObject = renderMeshVisual.getSceneObject();
		renderObject.setParent(global._ngsVfxManager.managerObject);
		renderObject.layer = vfxSceneObject.layer;
		
		VFX_OBJECT.renderMeshVisual = renderMeshVisual;
		VFX_OBJECT.renderObject = renderObject;	
		aabbMinVec4 = new vec4(renderMesh.aabbMin.x, renderMesh.aabbMin.y, renderMesh.aabbMin.z, 1.0);
		aabbMaxVec4 = new vec4(renderMesh.aabbMax.x, renderMesh.aabbMax.y, renderMesh.aabbMax.z, 1.0);
		simulatePass.vfxLocalAabbMin = renderMesh.aabbMin;
		simulatePass.vfxLocalAabbMax = renderMesh.aabbMax;
		
		/* 
		var frustumAabbMin = new vec3( -1000, -1000, -1000 );
		var frustumAabbMax = new vec3( 1000, 1000, 1000 );
		VFX_OBJECT.aabbExtent = frustumAabbMax.sub(frustumAabbMin).length * 0.5;
		*/ 
	}
	
	// Local frustum bounds for each batched copy
	// VFX_OBJECT.transformPositions[COPY_ID] = simulatePass.vfxLocalAabbMax.add(simulatePass.vfxLocalAabbMin).uniformScale(0.5);
	// VFX_OBJECT.transformScales[COPY_ID] = scriptTransform.getWorldScale();
	
	// Search for the render camera in order to get its transforms
	getRenderCamera();
	
	if ( isNull(renderCamera) ) {
		//print( "VFX: Did not find main camera" );
		return;
	}
	
	updateUniforms();
	
	// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
	
	if ( MAT_SIMULATE != undefined ) {
		simulatePass.vfxFrame = 0;
	}
	
	isInitialized = true;
};

//-------------------------------------------------------------------------------


var event = script.createEvent( "SceneEvent.OnStartEvent" );
event.bind( function( eventData )
	{
		initialize();
	});


//-------------------------------------------------------------------------------

var newEvent = script.createEvent('UpdateEvent');
newEvent.bind(function() 
	{
		if (isNull(renderCamera) && !isNull(VFX_OBJECT)) 
		{	
			getRenderCamera();
		}
		
		if ( !isInitialized || MAT_SIMULATE == undefined || isNull(VFX_OBJECT.simMeshVisual))
		{
			return;
		}
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		/* no delay */
		
		// -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
		
		updateUniforms();
		
	});

//-------------------------------------------------------------------------------


function createMeshVisual(material, renderOrder) 
{
	var so = global.scene.createSceneObject("");
	var meshVisual = so.createComponent('RenderMeshVisual');
	meshVisual.setRenderOrder( renderOrder );
	if (true && !isNull(script.Render_Mesh))  // Use custom mesh or particle quad
	{
		meshVisual.mesh = script.Render_Mesh;
		if (DEBUG_PRINT) print("Mesh: " + script.Render_Mesh);
	}
	else
	{
		meshVisual.mesh = global._ngsVfxManager.particleQuadMesh;
		if (DEBUG_PRINT) print("Mesh: Quad");
	}
	meshVisual.mainMaterial  = material;
	meshVisual.meshShadowMode = 0;
	meshVisual.shadowColor = new vec4( 1, 1, 1, 1 );
	meshVisual.shadowDensity = 1;
	
	/*
	// Manager handles culling for local space
	meshVisual.mainPass.frustumCullMin = new vec3( -9999999, -9999999, -9999999 );
	meshVisual.mainPass.frustumCullMax = new vec3(  9999999,  9999999,  9999999 );
	*/
	
	// Scenarium handles culling for world space
	meshVisual.mainPass.frustumCullMin = new vec3( -1000, -1000, -1000 );
	meshVisual.mainPass.frustumCullMax = new vec3( 1000, 1000, 1000 );
	
	meshVisual.mainPass.frustumCullMode = FrustumCullMode.UserDefinedAABB;
	return meshVisual;	
}

function updateRenderMesh()
{
	// Keep mesh assignment updated
	if (!isNull(script.Render_Mesh) && !script.Render_Mesh.isSame(renderMesh)) {
		renderMesh = script.Render_Mesh;
		renderMeshVisual.mesh = renderMesh;
	}
}

function getRenderCamera()
{
	if (COPY_ID == 0)
	{
		renderCamera = findCamera(global._ngsVfxManager.sceneCameraComponentObjects, vfxSceneObject.layer);
		if (!isNull(renderCamera)) 
		{
			renderCameraTransform = renderCamera.getTransform();	
			VFX_OBJECT.renderCamera = renderCamera;
		}
	}
	else
	{
		if (!isNull(VFX_OBJECT.renderCamera))
		{
			renderCamera = VFX_OBJECT.renderCamera;
			renderCameraTransform = renderCamera.getTransform();
		}
	}	
}

function findCamera(cameraComponentObjects, objectLayer)
{
	for (var i = 0; i < cameraComponentObjects.length; i++) 
	{
		var cameraComponent = cameraComponentObjects[i].getComponent("Component.Camera");
		var cameraLayer = cameraComponent.renderLayer;
		if (cameraLayer.contains(objectLayer)) {
			return cameraComponent;
		}
	}
	return null;
}


function componentSearchRecursive(baseObject, component, objects) 
{
	var result = null;
	if (baseObject.getComponentCount(component) > 0) {
		if(baseObject.getFirstComponent(component)) {
			result = baseObject; 
			objects.arrayKey.push(result);
		}
	}
	for (var i = 0; i < baseObject.getChildrenCount(); i++) {
		var childResult = componentSearchRecursive(baseObject.getChild(i), component, objects);
		if (childResult) result = childResult;
	}
	return result;
}

//-------------------------------------------------------------------------------

script.createEvent("OnDestroyEvent").bind(function(){    
		if (global._ngsVfxManager) global._ngsVfxManager.destroy(VFX_OBJECT, COPY_ID);
	})


