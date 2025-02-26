#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_FLAG_IS_NORMAL_MAP detailNormalTex
NGS_BACKEND_SHADER_FLAGS_END__
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler baseTexSmpSC 2:29
//sampler sampler detailNormalTexSmpSC 2:30
//sampler sampler intensityTextureSmpSC 2:31
//sampler sampler normalTexSmpSC 2:32
//sampler sampler opacityTexSmpSC 2:33
//sampler sampler sc_EnvmapDiffuseSmpSC 2:34
//sampler sampler sc_EnvmapSpecularSmpSC 2:35
//sampler sampler sc_RayTracedAoTextureSmpSC 2:37
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 2:38
//sampler sampler sc_RayTracedShadowTextureSmpSC 2:40
//sampler sampler sc_SSAOTextureSmpSC 2:41
//sampler sampler sc_ScreenTextureSmpSC 2:42
//sampler sampler sc_ShadowTextureSmpSC 2:43
//sampler sampler z_hitIdAndBarycentricSmp 2:45
//sampler sampler z_rayDirectionsSmpSC 2:46
//texture texture2D baseTex 2:4:2:29
//texture texture2D detailNormalTex 2:5:2:30
//texture texture2D intensityTexture 2:6:2:31
//texture texture2D normalTex 2:7:2:32
//texture texture2D opacityTex 2:8:2:33
//texture texture2D sc_EnvmapDiffuse 2:9:2:34
//texture texture2D sc_EnvmapSpecular 2:10:2:35
//texture texture2D sc_RayTracedAoTexture 2:19:2:37
//texture texture2D sc_RayTracedDiffIndTexture 2:20:2:38
//texture texture2D sc_RayTracedShadowTexture 2:22:2:40
//texture texture2D sc_SSAOTexture 2:23:2:41
//texture texture2D sc_ScreenTexture 2:24:2:42
//texture texture2D sc_ShadowTexture 2:25:2:43
//texture utexture2D z_hitIdAndBarycentric 2:27:2:45
//texture texture2D z_rayDirections 2:28:2:46
//ubo float sc_BonesUBO 2:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 2:47:5552 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapDiffuseDims 1104
//float4 sc_EnvmapDiffuseView 1120
//float4 sc_EnvmapSpecularSize 1136
//float4 sc_EnvmapSpecularDims 1152
//float4 sc_EnvmapSpecularView 1168
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_GeometryInfo 1408
//float4x4 sc_ModelViewProjectionMatrixArray 1424:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1552:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1808:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2064:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2192:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2288:[2]:48
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float3x3 sc_NormalMatrixInverse 3200
//float4x4 sc_PrevFrameModelMatrix 3248
//float4x4 sc_PrevFrameModelMatrixInverse 3312
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
//float3 sc_WorldAabbMin 3408
//float3 sc_WorldAabbMax 3424
//float4 sc_WindowToViewportTransform 3440
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float _sc_GetFramebufferColorInvalidUsageMarker 3600
//float shaderComplexityValue 3604
//float sc_DisableFrustumCullingMarker 3608
//float4 weights0 3616
//float4 weights1 3632
//float4 weights2 3648
//float4 sc_StereoClipPlanes 3664:[2]:16
//int sc_FallbackInstanceID 3696
//float _sc_framebufferFetchMarker 3700
//float2 sc_TAAJitterOffset 3704
//float strandWidth 3712
//float strandTaper 3716
//float4 sc_StrandDataMapTextureSize 3728
//float clumpInstanceCount 3744
//float clumpRadius 3748
//float clumpTipScale 3752
//float hairstyleInstanceCount 3756
//float hairstyleNoise 3760
//float4 sc_ScreenTextureSize 3776
//float4 sc_ScreenTextureDims 3792
//float4 sc_ScreenTextureView 3808
//bool receivesRayTracedReflections 3824
//bool isProxyMode 3828
//bool receivesRayTracedShadows 3832
//bool receivesRayTracedDiffuseIndirect 3836
//bool receivesRayTracedAo 3840
//float4 sc_RayTracedReflectionTextureSize 3856
//float4 sc_RayTracedReflectionTextureDims 3872
//float4 sc_RayTracedReflectionTextureView 3888
//float4 sc_RayTracedShadowTextureSize 3904
//float4 sc_RayTracedShadowTextureDims 3920
//float4 sc_RayTracedShadowTextureView 3936
//float4 sc_RayTracedDiffIndTextureSize 3952
//float4 sc_RayTracedDiffIndTextureDims 3968
//float4 sc_RayTracedDiffIndTextureView 3984
//float4 sc_RayTracedAoTextureSize 4000
//float4 sc_RayTracedAoTextureDims 4016
//float4 sc_RayTracedAoTextureView 4032
//float receiver_mask 4048
//float3 OriginNormalizationScale 4064
//float3 OriginNormalizationScaleInv 4080
//float3 OriginNormalizationOffset 4096
//int receiverId 4112
//int instance_id 4116
//int lray_triangles_last 4120
//bool noEarlyZ 4124
//bool has_animated_pn 4128
//int emitter_stride 4132
//int proxy_offset_position 4136
//int proxy_offset_normal 4140
//int proxy_offset_tangent 4144
//int proxy_offset_color 4148
//int proxy_offset_texture0 4152
//int proxy_offset_texture1 4156
//int proxy_offset_texture2 4160
//int proxy_offset_texture3 4164
//int proxy_format_position 4168
//int proxy_format_normal 4172
//int proxy_format_tangent 4176
//int proxy_format_color 4180
//int proxy_format_texture0 4184
//int proxy_format_texture1 4188
//int proxy_format_texture2 4192
//int proxy_format_texture3 4196
//float4 z_rayDirectionsSize 4208
//float4 z_rayDirectionsDims 4224
//float4 z_rayDirectionsView 4240
//float correctedIntensity 4256
//float4 intensityTextureSize 4272
//float4 intensityTextureDims 4288
//float4 intensityTextureView 4304
//float3x3 intensityTextureTransform 4320
//float4 intensityTextureUvMinMax 4368
//float4 intensityTextureBorderColor 4384
//float reflBlurWidth 4400
//float reflBlurMinRough 4404
//float reflBlurMaxRough 4408
//int overrideTimeEnabled 4412
//float overrideTimeElapsed 4416
//float overrideTimeDelta 4420
//int PreviewEnabled 4424
//int PreviewNodeID 4428
//float alphaTestThreshold 4432
//float3 recolorRed 4448
//float4 Tweak_N81 4464
//float4 baseColor 4480
//float4 baseTexSize 4496
//float4 baseTexDims 4512
//float4 baseTexView 4528
//float3x3 baseTexTransform 4544
//float4 baseTexUvMinMax 4592
//float4 baseTexBorderColor 4608
//float2 uv2Scale 4624
//float2 uv2Offset 4632
//float2 uv3Scale 4640
//float2 uv3Offset 4648
//float3 recolorGreen 4656
//float3 recolorBlue 4672
//float4 opacityTexSize 4688
//float4 opacityTexDims 4704
//float4 opacityTexView 4720
//float3x3 opacityTexTransform 4736
//float4 opacityTexUvMinMax 4784
//float4 opacityTexBorderColor 4800
//float4 normalTexSize 4816
//float4 normalTexDims 4832
//float4 normalTexView 4848
//float3x3 normalTexTransform 4864
//float4 normalTexUvMinMax 4912
//float4 normalTexBorderColor 4928
//float4 detailNormalTexSize 4944
//float4 detailNormalTexDims 4960
//float4 detailNormalTexView 4976
//float3x3 detailNormalTexTransform 4992
//float4 detailNormalTexUvMinMax 5040
//float4 detailNormalTexBorderColor 5056
//float colorMultiplier 5072
//float4 Port_Import_N042 5088
//float Port_Input1_N044 5104
//float Port_Import_N088 5108
//float3 Port_Import_N089 5120
//float Port_Position1_N078 5136
//float4 Port_Import_N384 5152
//float Port_Import_N307 5168
//float Port_Import_N201 5172
//float Port_Import_N012 5176
//float Port_Import_N010 5180
//float Port_Import_N007 5184
//float2 Port_Import_N008 5192
//float2 Port_Import_N009 5200
//float Port_Speed_N022 5208
//float2 Port_Import_N254 5216
//float Port_Import_N065 5224
//float Port_Import_N055 5228
//float Port_Import_N056 5232
//float2 Port_Import_N000 5240
//float2 Port_Import_N060 5248
//float2 Port_Import_N061 5256
//float Port_Speed_N063 5264
//float2 Port_Import_N255 5272
//float4 Port_Default_N369 5280
//float4 Port_Import_N092 5296
//float3 Port_Import_N090 5312
//float3 Port_Import_N091 5328
//float3 Port_Import_N144 5344
//float Port_Value2_N073 5360
//float4 Port_Import_N166 5376
//float Port_Import_N206 5392
//float Port_Import_N043 5396
//float2 Port_Import_N151 5400
//float2 Port_Import_N155 5408
//float Port_Default_N204 5416
//float Port_Import_N047 5420
//float Port_Input1_N002 5424
//float Port_Input2_N072 5428
//float Port_Import_N336 5432
//float Port_Import_N160 5436
//float2 Port_Import_N167 5440
//float2 Port_Import_N207 5448
//float Port_Strength1_N200 5456
//float Port_Import_N095 5460
//float Port_Import_N108 5464
//float3 Port_Default_N113 5472
//float Port_Strength2_N200 5488
//float3 Port_Emissive_N036 5504
//float3 Port_AO_N036 5520
//float depthRef 5536
//}
//ssbo int layoutIndices 2:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVerticesPN 2:2:4 {
//float _VerticesPN 0:[]:4
//}
//ssbo float layoutVertices 2:1:4 {
//float _Vertices 0:[]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 1000
//spec_const bool BLEND_MODE_BRIGHT 1001
//spec_const bool BLEND_MODE_COLOR_BURN 1002
//spec_const bool BLEND_MODE_COLOR_DODGE 1003
//spec_const bool BLEND_MODE_COLOR 1004
//spec_const bool BLEND_MODE_DARKEN 1005
//spec_const bool BLEND_MODE_DIFFERENCE 1006
//spec_const bool BLEND_MODE_DIVIDE 1007
//spec_const bool BLEND_MODE_DIVISION 1008
//spec_const bool BLEND_MODE_EXCLUSION 1009
//spec_const bool BLEND_MODE_FORGRAY 1010
//spec_const bool BLEND_MODE_HARD_GLOW 1011
//spec_const bool BLEND_MODE_HARD_LIGHT 1012
//spec_const bool BLEND_MODE_HARD_MIX 1013
//spec_const bool BLEND_MODE_HARD_PHOENIX 1014
//spec_const bool BLEND_MODE_HARD_REFLECT 1015
//spec_const bool BLEND_MODE_HUE 1016
//spec_const bool BLEND_MODE_INTENSE 1017
//spec_const bool BLEND_MODE_LIGHTEN 1018
//spec_const bool BLEND_MODE_LINEAR_LIGHT 1019
//spec_const bool BLEND_MODE_LUMINOSITY 1020
//spec_const bool BLEND_MODE_NEGATION 1021
//spec_const bool BLEND_MODE_NOTBRIGHT 1022
//spec_const bool BLEND_MODE_OVERLAY 1023
//spec_const bool BLEND_MODE_PIN_LIGHT 1024
//spec_const bool BLEND_MODE_REALISTIC 1025
//spec_const bool BLEND_MODE_SATURATION 1026
//spec_const bool BLEND_MODE_SOFT_LIGHT 1027
//spec_const bool BLEND_MODE_SUBTRACT 1028
//spec_const bool BLEND_MODE_VIVID_LIGHT 1029
//spec_const bool ENABLE_BASE_TEX 1030
//spec_const bool ENABLE_DETAIL_NORMAL 1031
//spec_const bool ENABLE_NORMALMAP 1032
//spec_const bool ENABLE_OPACITY_TEX 1033
//spec_const bool ENABLE_RECOLOR 1034
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1035
//spec_const bool ENABLE_UV2_ANIMATION 1036
//spec_const bool ENABLE_UV2 1037
//spec_const bool ENABLE_UV3_ANIMATION 1038
//spec_const bool ENABLE_UV3 1039
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 1040
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 1041
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1042
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 1043
//spec_const bool SC_USE_CLAMP_TO_BORDER_opacityTex 1044
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 1045
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 1046
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1047
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 1048
//spec_const bool SC_USE_UV_MIN_MAX_opacityTex 1049
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 1050
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 1051
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1052
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 1053
//spec_const bool SC_USE_UV_TRANSFORM_opacityTex 1054
//spec_const bool UseViewSpaceDepthVariant 1055
//spec_const bool baseTexHasSwappedViews 1056
//spec_const bool detailNormalTexHasSwappedViews 1057
//spec_const bool intensityTextureHasSwappedViews 1058
//spec_const bool normalTexHasSwappedViews 1059
//spec_const bool opacityTexHasSwappedViews 1060
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1061
//spec_const bool sc_BlendMode_Add 1062
//spec_const bool sc_BlendMode_AlphaTest 1063
//spec_const bool sc_BlendMode_AlphaToCoverage 1064
//spec_const bool sc_BlendMode_ColoredGlass 1065
//spec_const bool sc_BlendMode_Custom 1066
//spec_const bool sc_BlendMode_Max 1067
//spec_const bool sc_BlendMode_Min 1068
//spec_const bool sc_BlendMode_MultiplyOriginal 1069
//spec_const bool sc_BlendMode_Multiply 1070
//spec_const bool sc_BlendMode_Normal 1071
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1072
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1073
//spec_const bool sc_BlendMode_PremultipliedAlpha 1074
//spec_const bool sc_BlendMode_Screen 1075
//spec_const bool sc_DepthOnly 1076
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 1077
//spec_const bool sc_EnvmapSpecularHasSwappedViews 1078
//spec_const bool sc_FramebufferFetch 1079
//spec_const bool sc_HasDiffuseEnvmap 1080
//spec_const bool sc_LightEstimation 1081
//spec_const bool sc_MotionVectorsPass 1082
//spec_const bool sc_OITCompositingPass 1083
//spec_const bool sc_OITDepthBoundsPass 1084
//spec_const bool sc_OITDepthGatherPass 1085
//spec_const bool sc_ProjectiveShadowsCaster 1086
//spec_const bool sc_ProjectiveShadowsReceiver 1087
//spec_const bool sc_ProxyAlphaOne 1088
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 1089
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 1090
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 1091
//spec_const bool sc_RenderAlphaToColor 1092
//spec_const bool sc_SSAOEnabled 1093
//spec_const bool sc_ScreenTextureHasSwappedViews 1094
//spec_const bool sc_ShaderComplexityAnalyzer 1095
//spec_const bool sc_UseFramebufferFetchMarker 1096
//spec_const bool sc_VertexBlendingUseNormals 1097
//spec_const bool sc_VertexBlending 1098
//spec_const int NODE_13_DROPLIST_ITEM 1099
//spec_const int NODE_181_DROPLIST_ITEM 1100
//spec_const int NODE_184_DROPLIST_ITEM 1101
//spec_const int NODE_27_DROPLIST_ITEM 1102
//spec_const int NODE_38_DROPLIST_ITEM 1103
//spec_const int NODE_49_DROPLIST_ITEM 1104
//spec_const int NODE_69_DROPLIST_ITEM 1105
//spec_const int SC_DEVICE_CLASS 1106
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 1107
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 1108
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1109
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 1110
//spec_const int SC_SOFTWARE_WRAP_MODE_U_opacityTex 1111
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 1112
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 1113
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1114
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 1115
//spec_const int SC_SOFTWARE_WRAP_MODE_V_opacityTex 1116
//spec_const int baseTexLayout 1117
//spec_const int detailNormalTexLayout 1118
//spec_const int intensityTextureLayout 1119
//spec_const int normalTexLayout 1120
//spec_const int opacityTexLayout 1121
//spec_const int sc_AmbientLightMode0 1122
//spec_const int sc_AmbientLightMode1 1123
//spec_const int sc_AmbientLightMode2 1124
//spec_const int sc_AmbientLightMode_Constant 1125
//spec_const int sc_AmbientLightMode_EnvironmentMap 1126
//spec_const int sc_AmbientLightMode_FromCamera 1127
//spec_const int sc_AmbientLightMode_SphericalHarmonics 1128
//spec_const int sc_AmbientLightsCount 1129
//spec_const int sc_DepthBufferMode 1130
//spec_const int sc_DirectionalLightsCount 1131
//spec_const int sc_EnvLightMode 1132
//spec_const int sc_EnvmapDiffuseLayout 1133
//spec_const int sc_EnvmapSpecularLayout 1134
//spec_const int sc_LightEstimationSGCount 1135
//spec_const int sc_MaxTextureImageUnits 1136
//spec_const int sc_PointLightsCount 1137
//spec_const int sc_RayTracedAoTextureLayout 1138
//spec_const int sc_RayTracedDiffIndTextureLayout 1139
//spec_const int sc_RayTracedShadowTextureLayout 1140
//spec_const int sc_RenderingSpace 1141
//spec_const int sc_ScreenTextureLayout 1142
//spec_const int sc_SkinBonesCount 1143
//spec_const int sc_StereoRenderingMode 1144
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1145
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(1000)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1001)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(1002)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(1003)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(1004)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(1005)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(1006)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(1007)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(1008)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(1009)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(1010)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(1011)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(1012)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(1013)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(1014)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(1015)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(1016)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(1017)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(1018)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(1019)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(1020)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(1021)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(1022)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(1023)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(1024)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(1025)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(1026)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(1027)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(1028)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(1029)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_BASE_TEX [[function_constant(1030)]];
constant bool ENABLE_BASE_TEX_tmp = is_function_constant_defined(ENABLE_BASE_TEX) ? ENABLE_BASE_TEX : false;
constant bool ENABLE_DETAIL_NORMAL [[function_constant(1031)]];
constant bool ENABLE_DETAIL_NORMAL_tmp = is_function_constant_defined(ENABLE_DETAIL_NORMAL) ? ENABLE_DETAIL_NORMAL : false;
constant bool ENABLE_NORMALMAP [[function_constant(1032)]];
constant bool ENABLE_NORMALMAP_tmp = is_function_constant_defined(ENABLE_NORMALMAP) ? ENABLE_NORMALMAP : false;
constant bool ENABLE_OPACITY_TEX [[function_constant(1033)]];
constant bool ENABLE_OPACITY_TEX_tmp = is_function_constant_defined(ENABLE_OPACITY_TEX) ? ENABLE_OPACITY_TEX : false;
constant bool ENABLE_RECOLOR [[function_constant(1034)]];
constant bool ENABLE_RECOLOR_tmp = is_function_constant_defined(ENABLE_RECOLOR) ? ENABLE_RECOLOR : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1035)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool ENABLE_UV2_ANIMATION [[function_constant(1036)]];
constant bool ENABLE_UV2_ANIMATION_tmp = is_function_constant_defined(ENABLE_UV2_ANIMATION) ? ENABLE_UV2_ANIMATION : false;
constant bool ENABLE_UV2 [[function_constant(1037)]];
constant bool ENABLE_UV2_tmp = is_function_constant_defined(ENABLE_UV2) ? ENABLE_UV2 : false;
constant bool ENABLE_UV3_ANIMATION [[function_constant(1038)]];
constant bool ENABLE_UV3_ANIMATION_tmp = is_function_constant_defined(ENABLE_UV3_ANIMATION) ? ENABLE_UV3_ANIMATION : false;
constant bool ENABLE_UV3 [[function_constant(1039)]];
constant bool ENABLE_UV3_tmp = is_function_constant_defined(ENABLE_UV3) ? ENABLE_UV3 : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(1040)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex [[function_constant(1041)]];
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_detailNormalTex) ? SC_USE_CLAMP_TO_BORDER_detailNormalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1042)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(1043)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex [[function_constant(1044)]];
constant bool SC_USE_CLAMP_TO_BORDER_opacityTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_opacityTex) ? SC_USE_CLAMP_TO_BORDER_opacityTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(1045)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_detailNormalTex [[function_constant(1046)]];
constant bool SC_USE_UV_MIN_MAX_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_detailNormalTex) ? SC_USE_UV_MIN_MAX_detailNormalTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1047)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(1048)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_opacityTex [[function_constant(1049)]];
constant bool SC_USE_UV_MIN_MAX_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_opacityTex) ? SC_USE_UV_MIN_MAX_opacityTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(1050)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_detailNormalTex [[function_constant(1051)]];
constant bool SC_USE_UV_TRANSFORM_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_detailNormalTex) ? SC_USE_UV_TRANSFORM_detailNormalTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1052)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(1053)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_opacityTex [[function_constant(1054)]];
constant bool SC_USE_UV_TRANSFORM_opacityTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_opacityTex) ? SC_USE_UV_TRANSFORM_opacityTex : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1055)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(1056)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool detailNormalTexHasSwappedViews [[function_constant(1057)]];
constant bool detailNormalTexHasSwappedViews_tmp = is_function_constant_defined(detailNormalTexHasSwappedViews) ? detailNormalTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1058)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(1059)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool opacityTexHasSwappedViews [[function_constant(1060)]];
constant bool opacityTexHasSwappedViews_tmp = is_function_constant_defined(opacityTexHasSwappedViews) ? opacityTexHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1061)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1062)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1063)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1064)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1065)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1066)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1067)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1068)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1069)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1070)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1071)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1072)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1073)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1074)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1075)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1076)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(1077)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(1078)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(1079)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(1080)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(1081)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(1082)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(1083)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1084)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1085)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1086)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1087)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(1088)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(1089)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(1090)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(1091)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(1092)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(1093)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1094)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1095)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1096)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1097)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1098)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(1099)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_181_DROPLIST_ITEM [[function_constant(1100)]];
constant int NODE_181_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_181_DROPLIST_ITEM) ? NODE_181_DROPLIST_ITEM : 0;
constant int NODE_184_DROPLIST_ITEM [[function_constant(1101)]];
constant int NODE_184_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_184_DROPLIST_ITEM) ? NODE_184_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(1102)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_38_DROPLIST_ITEM [[function_constant(1103)]];
constant int NODE_38_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_38_DROPLIST_ITEM) ? NODE_38_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(1104)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int NODE_69_DROPLIST_ITEM [[function_constant(1105)]];
constant int NODE_69_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_69_DROPLIST_ITEM) ? NODE_69_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(1106)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(1107)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex [[function_constant(1108)]];
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_U_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1109)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(1110)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex [[function_constant(1111)]];
constant int SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_opacityTex) ? SC_SOFTWARE_WRAP_MODE_U_opacityTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(1112)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex [[function_constant(1113)]];
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_V_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1114)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(1115)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex [[function_constant(1116)]];
constant int SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_opacityTex) ? SC_SOFTWARE_WRAP_MODE_V_opacityTex : -1;
constant int baseTexLayout [[function_constant(1117)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int detailNormalTexLayout [[function_constant(1118)]];
constant int detailNormalTexLayout_tmp = is_function_constant_defined(detailNormalTexLayout) ? detailNormalTexLayout : 0;
constant int intensityTextureLayout [[function_constant(1119)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int normalTexLayout [[function_constant(1120)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int opacityTexLayout [[function_constant(1121)]];
constant int opacityTexLayout_tmp = is_function_constant_defined(opacityTexLayout) ? opacityTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(1122)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(1123)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(1124)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(1125)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(1126)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(1127)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(1128)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(1129)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(1130)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(1131)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(1132)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(1133)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(1134)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(1135)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(1136)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(1137)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(1138)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(1139)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(1140)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(1141)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1142)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1143)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1144)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1145)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 Tweak_N81;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float colorMultiplier;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float Port_Position1_N078;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float3 Port_Emissive_N036;
float3 Port_AO_N036;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> opacityTex [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_RayTracedAoTexture [[id(19)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(20)]];
texture2d<float> sc_RayTracedShadowTexture [[id(22)]];
texture2d<float> sc_SSAOTexture [[id(23)]];
texture2d<float> sc_ScreenTexture [[id(24)]];
texture2d<float> sc_ShadowTexture [[id(25)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler baseTexSmpSC [[id(29)]];
sampler detailNormalTexSmpSC [[id(30)]];
sampler intensityTextureSmpSC [[id(31)]];
sampler normalTexSmpSC [[id(32)]];
sampler opacityTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
sampler z_hitIdAndBarycentricSmp [[id(45)]];
sampler z_rayDirectionsSmpSC [[id(46)]];
constant userUniformsObj* UserUniforms [[id(47)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool l9_0=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set2.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_4=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_4;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_6;
l9_6.position=in.position;
l9_6.normal=in.normal;
l9_6.tangent=in.tangent.xyz;
l9_6.texture0=in.texture0;
l9_6.texture1=in.texture1;
sc_Vertex_t l9_7=l9_6;
sc_Vertex_t param_1=l9_7;
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set2.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set2.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set2.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set2.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set2.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set2.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=0;
int l9_62=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_62=int(in.boneData[l9_61]);
}
int l9_63=l9_62;
int l9_64=l9_63;
int l9_65=1;
int l9_66=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_66=int(in.boneData[l9_65]);
}
int l9_67=l9_66;
int l9_68=l9_67;
int l9_69=2;
int l9_70=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_70=int(in.boneData[l9_69]);
}
int l9_71=l9_70;
int l9_72=l9_71;
int l9_73=3;
int l9_74=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_74=int(in.boneData[l9_73]);
}
int l9_75=l9_74;
int l9_76=l9_75;
int l9_77=l9_64;
float4 l9_78=l9_57.position;
float3 l9_79=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_80=l9_77;
float4 l9_81=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[0];
float4 l9_82=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[1];
float4 l9_83=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[2];
float4 l9_84[3];
l9_84[0]=l9_81;
l9_84[1]=l9_82;
l9_84[2]=l9_83;
l9_79=float3(dot(l9_78,l9_84[0]),dot(l9_78,l9_84[1]),dot(l9_78,l9_84[2]));
}
else
{
l9_79=l9_78.xyz;
}
float3 l9_85=l9_79;
float3 l9_86=l9_85;
float l9_87=l9_60.x;
int l9_88=l9_68;
float4 l9_89=l9_57.position;
float3 l9_90=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_91=l9_88;
float4 l9_92=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[0];
float4 l9_93=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[1];
float4 l9_94=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[2];
float4 l9_95[3];
l9_95[0]=l9_92;
l9_95[1]=l9_93;
l9_95[2]=l9_94;
l9_90=float3(dot(l9_89,l9_95[0]),dot(l9_89,l9_95[1]),dot(l9_89,l9_95[2]));
}
else
{
l9_90=l9_89.xyz;
}
float3 l9_96=l9_90;
float3 l9_97=l9_96;
float l9_98=l9_60.y;
int l9_99=l9_72;
float4 l9_100=l9_57.position;
float3 l9_101=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_102=l9_99;
float4 l9_103=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[0];
float4 l9_104=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[1];
float4 l9_105=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[2];
float4 l9_106[3];
l9_106[0]=l9_103;
l9_106[1]=l9_104;
l9_106[2]=l9_105;
l9_101=float3(dot(l9_100,l9_106[0]),dot(l9_100,l9_106[1]),dot(l9_100,l9_106[2]));
}
else
{
l9_101=l9_100.xyz;
}
float3 l9_107=l9_101;
float3 l9_108=l9_107;
float l9_109=l9_60.z;
int l9_110=l9_76;
float4 l9_111=l9_57.position;
float3 l9_112=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_113=l9_110;
float4 l9_114=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[0];
float4 l9_115=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[1];
float4 l9_116=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[2];
float4 l9_117[3];
l9_117[0]=l9_114;
l9_117[1]=l9_115;
l9_117[2]=l9_116;
l9_112=float3(dot(l9_111,l9_117[0]),dot(l9_111,l9_117[1]),dot(l9_111,l9_117[2]));
}
else
{
l9_112=l9_111.xyz;
}
float3 l9_118=l9_112;
float3 l9_119=(((l9_86*l9_87)+(l9_97*l9_98))+(l9_108*l9_109))+(l9_118*l9_60.w);
l9_57.position=float4(l9_119.x,l9_119.y,l9_119.z,l9_57.position.w);
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
int l9_124=l9_68;
float3x3 l9_125=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[2].xyz));
float3x3 l9_126=l9_125;
float3x3 l9_127=l9_126;
int l9_128=l9_72;
float3x3 l9_129=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[2].xyz));
float3x3 l9_130=l9_129;
float3x3 l9_131=l9_130;
int l9_132=l9_76;
float3x3 l9_133=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[2].xyz));
float3x3 l9_134=l9_133;
float3x3 l9_135=l9_134;
l9_57.normal=((((l9_123*l9_57.normal)*l9_60.x)+((l9_127*l9_57.normal)*l9_60.y))+((l9_131*l9_57.normal)*l9_60.z))+((l9_135*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_123*l9_57.tangent)*l9_60.x)+((l9_127*l9_57.tangent)*l9_60.y))+((l9_131*l9_57.tangent)*l9_60.z))+((l9_135*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_136=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_136.x,l9_136.y,l9_136.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_137=normalize(param_5);
out.varTangent=float4(l9_137.x,l9_137.y,l9_137.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_138=param_2.position;
float4 l9_139=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_139=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_141]*l9_138;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_142=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_142=0;
}
else
{
l9_142=gl_InstanceIndex%2;
}
int l9_143=l9_142;
l9_139=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_143]*l9_138;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_144=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_144=0;
}
else
{
l9_144=gl_InstanceIndex%2;
}
int l9_145=l9_144;
l9_139=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_145]*l9_138;
}
else
{
l9_139=l9_138;
}
}
}
float4 l9_146=l9_139;
out.varViewSpaceDepth=-l9_146.z;
}
float4 l9_147=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_147=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_148=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_148=0;
}
else
{
l9_148=gl_InstanceIndex%2;
}
int l9_149=l9_148;
l9_147=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_149]*param_2.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_150=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_150=0;
}
else
{
l9_150=gl_InstanceIndex%2;
}
int l9_151=l9_150;
l9_147=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_151]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_152=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_152=0;
}
else
{
l9_152=gl_InstanceIndex%2;
}
int l9_153=l9_152;
l9_147=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_153]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_154=param_2.position;
float4 l9_155=l9_154;
if (sc_RenderingSpace_tmp==1)
{
l9_155=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_154;
}
float4 l9_156=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_155;
float2 l9_157=((l9_156.xy/float2(l9_156.w))*0.5)+float2(0.5);
out.varShadowTex=l9_157;
}
float4 l9_158=l9_147;
if (sc_DepthBufferMode_tmp==1)
{
int l9_159=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_159=0;
}
else
{
l9_159=gl_InstanceIndex%2;
}
int l9_160=l9_159;
if ((*sc_set2.UserUniforms).sc_ProjectionMatrixArray[l9_160][2].w!=0.0)
{
float l9_161=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_158.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_158.w))*l9_161)-1.0)*l9_158.w;
}
}
float4 l9_162=l9_158;
l9_147=l9_162;
float4 l9_163=l9_147;
float4 l9_164=l9_163;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_165=l9_164;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_166=dot(l9_165,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_167=l9_166;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_167;
}
}
float4 l9_168=float4(l9_164.x,-l9_164.y,(l9_164.z*0.5)+(l9_164.w*0.5),l9_164.w);
out.gl_Position=l9_168;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 Tweak_N81;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float colorMultiplier;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float Port_Position1_N078;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float3 Port_Emissive_N036;
float3 Port_AO_N036;
float depthRef;
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> opacityTex [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_RayTracedAoTexture [[id(19)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(20)]];
texture2d<float> sc_RayTracedShadowTexture [[id(22)]];
texture2d<float> sc_SSAOTexture [[id(23)]];
texture2d<float> sc_ScreenTexture [[id(24)]];
texture2d<float> sc_ShadowTexture [[id(25)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler baseTexSmpSC [[id(29)]];
sampler detailNormalTexSmpSC [[id(30)]];
sampler intensityTextureSmpSC [[id(31)]];
sampler normalTexSmpSC [[id(32)]];
sampler opacityTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
sampler z_hitIdAndBarycentricSmp [[id(45)]];
sampler z_rayDirectionsSmpSC [[id(46)]];
constant userUniformsObj* UserUniforms [[id(47)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23=float3(0.0);
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46=float3(0.0);
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63=float4(0.0);
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99=float4(0.0);
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135=float2(0.0);
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150=float2(0.0);
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165=float2(0.0);
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180=float2(0.0);
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V,constant userUniformsObj& UserUniforms)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
bool l9_10=UserUniforms.isProxyMode!=0;
if (l9_10)
{
l9_9=1e-07;
}
float l9_11=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_12=param_6;
float l9_13=param_8;
float l9_14=l9_13+1.0;
l9_14=(l9_14*l9_14)*0.125;
float l9_15=(l9_12*(1.0-l9_14))+l9_14;
float l9_16=param_7;
float l9_17=param_8;
float l9_18=l9_17+1.0;
l9_18=(l9_18*l9_18)*0.125;
float l9_19=(l9_16*(1.0-l9_18))+l9_18;
float l9_20=1.0/(l9_15*l9_19);
float param_9=VdotH;
float3 param_10=F0;
float l9_21=param_9;
float3 l9_22=param_10;
float3 l9_23=float3(1.0);
float l9_24=1.0-l9_21;
float l9_25=l9_24*l9_24;
float l9_26=(l9_25*l9_25)*l9_24;
float3 l9_27=l9_22+((l9_23-l9_22)*l9_26);
float3 l9_28=l9_27;
return l9_28*(((l9_11*l9_20)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_29=param_11;
float3 l9_30=param_12;
float3 l9_31=float3(1.0);
float l9_32=1.0-l9_29;
float l9_33=l9_32*l9_32;
float l9_34=(l9_33*l9_33)*l9_32;
float3 l9_35=l9_30+((l9_31-l9_30)*l9_34);
float3 l9_36=l9_35;
return ((l9_36*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float4 sampleRayTracedIndirectDiffuse(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedDiffIndTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedDiffIndTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedDiffIndTexture.sample(sc_RayTracedDiffIndTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
return float4(0.0);
}
float sampleRayTracedAo(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedAo!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedAoTextureHasSwappedViews_tmp)!=0))
{
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedAoTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedAoTexture.sample(sc_RayTracedAoTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31.x;
}
return 0.0;
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float4 ngsCalculateLighting(thread const float3& albedo,thread const float& opacity,thread const float3& normal,thread const float3& position,thread const float3& viewDir,thread const float3& emissive,thread const float& metallic,thread const float& roughness,thread const float3& ao,thread const float3& specularAO,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_EnvmapDiffuse,thread sampler sc_EnvmapDiffuseSmpSC,thread texture2d<float> sc_EnvmapSpecular,thread sampler sc_EnvmapSpecularSmpSC,thread texture2d<float> sc_ScreenTexture,thread sampler sc_ScreenTextureSmpSC,thread texture2d<float> sc_ShadowTexture,thread sampler sc_ShadowTextureSmpSC,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC,thread texture2d<float> sc_RayTracedShadowTexture,thread sampler sc_RayTracedShadowTextureSmpSC,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord,thread float2& varShadowTex,thread float4& FragColor0)
{
SurfaceProperties l9_0;
l9_0.albedo=float3(0.0);
l9_0.opacity=1.0;
l9_0.normal=float3(0.0);
l9_0.positionWS=float3(0.0);
l9_0.viewDirWS=float3(0.0);
l9_0.metallic=0.0;
l9_0.roughness=0.0;
l9_0.emissive=float3(0.0);
l9_0.ao=float3(1.0);
l9_0.specularAo=float3(1.0);
l9_0.bakedShadows=float3(1.0);
SurfaceProperties l9_1=l9_0;
SurfaceProperties surfaceProperties=l9_1;
surfaceProperties.opacity=opacity;
float3 param=albedo;
float3 l9_2;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2=float3(pow(param.x,2.2),pow(param.y,2.2),pow(param.z,2.2));
}
else
{
l9_2=param*param;
}
float3 l9_3=l9_2;
surfaceProperties.albedo=l9_3;
surfaceProperties.normal=normalize(normal);
surfaceProperties.positionWS=position;
surfaceProperties.viewDirWS=viewDir;
float3 param_1=emissive;
float3 l9_4;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4=float3(pow(param_1.x,2.2),pow(param_1.y,2.2),pow(param_1.z,2.2));
}
else
{
l9_4=param_1*param_1;
}
float3 l9_5=l9_4;
surfaceProperties.emissive=l9_5;
surfaceProperties.metallic=metallic;
surfaceProperties.roughness=roughness;
surfaceProperties.ao=ao;
surfaceProperties.specularAo=specularAO;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 param_2=surfaceProperties.positionWS;
surfaceProperties.ao=evaluateSSAO(param_2,varStereoViewID,UserUniforms,sc_SSAOTexture,sc_SSAOTextureSmpSC);
}
SurfaceProperties param_3=surfaceProperties;
SurfaceProperties l9_6=param_3;
float3 l9_7=mix(float3(0.039999999),l9_6.albedo*l9_6.metallic,float3(l9_6.metallic));
float3 l9_8=mix(l9_6.albedo*(1.0-l9_6.metallic),float3(0.0),float3(l9_6.metallic));
param_3.albedo=l9_8;
param_3.specColor=l9_7;
SurfaceProperties l9_9=param_3;
surfaceProperties=l9_9;
SurfaceProperties param_4=surfaceProperties;
LightingComponents l9_10;
l9_10.directDiffuse=float3(0.0);
l9_10.directSpecular=float3(0.0);
l9_10.indirectDiffuse=float3(1.0);
l9_10.indirectSpecular=float3(0.0);
l9_10.emitted=float3(0.0);
l9_10.transmitted=float3(0.0);
LightingComponents l9_11=l9_10;
LightingComponents l9_12=l9_11;
float3 l9_13=param_4.viewDirWS;
int l9_14=0;
float4 l9_15=float4(param_4.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_16;
LightProperties l9_17;
int l9_18=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_18<sc_DirectionalLightsCount_tmp)
{
l9_16.direction=UserUniforms.sc_DirectionalLights[l9_18].direction;
l9_16.color=UserUniforms.sc_DirectionalLights[l9_18].color;
l9_17.direction=l9_16.direction;
l9_17.color=l9_16.color.xyz;
l9_17.attenuation=l9_16.color.w;
l9_17.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
l9_14++;
LightingComponents l9_19=l9_12;
LightProperties l9_20=l9_17;
SurfaceProperties l9_21=param_4;
float3 l9_22=l9_13;
SurfaceProperties l9_23=l9_21;
float3 l9_24=l9_20.direction;
float l9_25=dot(l9_23.normal,l9_24);
float l9_26=fast::clamp(l9_25,0.0,1.0);
float3 l9_27=float3(l9_26);
l9_19.directDiffuse+=((l9_27*l9_20.color)*l9_20.attenuation);
SurfaceProperties l9_28=l9_21;
float3 l9_29=l9_20.direction;
float3 l9_30=l9_22;
l9_19.directSpecular+=((calculateDirectSpecular(l9_28,l9_29,l9_30,UserUniforms)*l9_20.color)*l9_20.attenuation);
LightingComponents l9_31=l9_19;
l9_12=l9_31;
l9_18++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_32;
LightProperties l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount_tmp)
{
l9_32.falloffEnabled=UserUniforms.sc_PointLights[l9_34].falloffEnabled!=0;
l9_32.falloffEndDistance=UserUniforms.sc_PointLights[l9_34].falloffEndDistance;
l9_32.negRcpFalloffEndDistance4=UserUniforms.sc_PointLights[l9_34].negRcpFalloffEndDistance4;
l9_32.angleScale=UserUniforms.sc_PointLights[l9_34].angleScale;
l9_32.angleOffset=UserUniforms.sc_PointLights[l9_34].angleOffset;
l9_32.direction=UserUniforms.sc_PointLights[l9_34].direction;
l9_32.position=UserUniforms.sc_PointLights[l9_34].position;
l9_32.color=UserUniforms.sc_PointLights[l9_34].color;
float3 l9_35=l9_32.position-param_4.positionWS;
l9_33.direction=normalize(l9_35);
l9_33.color=l9_32.color.xyz;
l9_33.attenuation=l9_32.color.w;
l9_33.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
float3 l9_36=l9_33.direction;
float3 l9_37=l9_32.direction;
float l9_38=l9_32.angleScale;
float l9_39=l9_32.angleOffset;
float l9_40=dot(l9_36,l9_37);
float l9_41=fast::clamp((l9_40*l9_38)+l9_39,0.0,1.0);
float l9_42=l9_41*l9_41;
l9_33.attenuation*=l9_42;
if (l9_32.falloffEnabled)
{
float l9_43=length(l9_35);
float l9_44=l9_32.falloffEndDistance;
l9_33.attenuation*=computeDistanceAttenuation(l9_43,l9_44);
}
l9_14++;
LightingComponents l9_45=l9_12;
LightProperties l9_46=l9_33;
SurfaceProperties l9_47=param_4;
float3 l9_48=l9_13;
SurfaceProperties l9_49=l9_47;
float3 l9_50=l9_46.direction;
float l9_51=dot(l9_49.normal,l9_50);
float l9_52=fast::clamp(l9_51,0.0,1.0);
float3 l9_53=float3(l9_52);
l9_45.directDiffuse+=((l9_53*l9_46.color)*l9_46.attenuation);
SurfaceProperties l9_54=l9_47;
float3 l9_55=l9_46.direction;
float3 l9_56=l9_48;
l9_45.directSpecular+=((calculateDirectSpecular(l9_54,l9_55,l9_56,UserUniforms)*l9_46.color)*l9_46.attenuation);
LightingComponents l9_57=l9_45;
l9_12=l9_57;
l9_34++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_58=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_59=abs(varShadowTex-float2(0.5));
float l9_60=fast::max(l9_59.x,l9_59.y);
float l9_61=step(l9_60,0.5);
float4 l9_62=sc_ShadowTexture.sample(sc_ShadowTextureSmpSC,varShadowTex)*l9_61;
float3 l9_63=mix(UserUniforms.sc_ShadowColor.xyz,UserUniforms.sc_ShadowColor.xyz*l9_62.xyz,float3(UserUniforms.sc_ShadowColor.w));
float l9_64=l9_62.w*UserUniforms.sc_ShadowDensity;
l9_58=mix(float3(1.0),l9_63,float3(l9_64));
}
else
{
l9_58=float3(1.0);
}
float3 l9_65=l9_58;
float3 l9_66=l9_65;
l9_12.directDiffuse*=l9_66;
l9_12.directSpecular*=l9_66;
}
bool l9_67=UserUniforms.receivesRayTracedShadows!=0;
if (l9_67)
{
float4 l9_68=gl_FragCoord;
float2 l9_69=l9_68.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_70=l9_69;
float2 l9_71=l9_70;
int l9_72=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_73=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_73=0;
}
else
{
l9_73=varStereoViewID;
}
int l9_74=l9_73;
l9_72=1-l9_74;
}
else
{
int l9_75=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_75=0;
}
else
{
l9_75=varStereoViewID;
}
int l9_76=l9_75;
l9_72=l9_76;
}
int l9_77=l9_72;
float2 l9_78=l9_71;
int l9_79=l9_77;
float2 l9_80=l9_78;
int l9_81=l9_79;
float l9_82=0.0;
float4 l9_83=float4(0.0);
float2 l9_84=l9_80;
int l9_85=sc_RayTracedShadowTextureLayout_tmp;
int l9_86=l9_81;
float l9_87=l9_82;
float2 l9_88=l9_84;
int l9_89=l9_85;
int l9_90=l9_86;
float3 l9_91=float3(0.0);
if (l9_89==0)
{
l9_91=float3(l9_88,0.0);
}
else
{
if (l9_89==1)
{
l9_91=float3(l9_88.x,(l9_88.y*0.5)+(0.5-(float(l9_90)*0.5)),0.0);
}
else
{
l9_91=float3(l9_88,float(l9_90));
}
}
float3 l9_92=l9_91;
float3 l9_93=l9_92;
float2 l9_94=l9_93.xy;
float l9_95=l9_87;
float4 l9_96=sc_RayTracedShadowTexture.sample(sc_RayTracedShadowTextureSmpSC,l9_94,bias(l9_95));
float4 l9_97=l9_96;
l9_83=l9_97;
float4 l9_98=l9_83;
float4 l9_99=l9_98;
float4 l9_100=l9_99;
float l9_101=l9_100.x;
float3 l9_102=float3(l9_101);
float3 l9_103=l9_102;
l9_12.directDiffuse*=(float3(1.0)-l9_103);
l9_12.directSpecular*=(float3(1.0)-l9_103);
}
l9_12.directSpecular=float3(0.0);
SurfaceProperties l9_104=param_4;
float3 l9_105=l9_104.normal;
float3 l9_106=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_107=l9_105;
float3 l9_108=l9_107;
float l9_109=UserUniforms.sc_EnvmapRotation.y;
float2 l9_110=float2(0.0);
float l9_111=l9_108.x;
float l9_112=-l9_108.z;
float l9_113=(l9_111<0.0) ? (-1.0) : 1.0;
float l9_114=l9_113*acos(fast::clamp(l9_112/length(float2(l9_111,l9_112)),-1.0,1.0));
l9_110.x=l9_114-1.5707964;
l9_110.y=acos(l9_108.y);
l9_110/=float2(6.2831855,3.1415927);
l9_110.y=1.0-l9_110.y;
l9_110.x+=(l9_109/360.0);
l9_110.x=fract((l9_110.x+floor(l9_110.x))+1.0);
float2 l9_115=l9_110;
float2 l9_116=l9_115;
float4 l9_117=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_118=l9_116;
float2 l9_119=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_120=5.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_118,l9_119,l9_120);
}
float2 l9_121=l9_116;
float l9_122=13.0;
int l9_123=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=varStereoViewID;
}
int l9_125=l9_124;
l9_123=1-l9_125;
}
else
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=varStereoViewID;
}
int l9_127=l9_126;
l9_123=l9_127;
}
int l9_128=l9_123;
float2 l9_129=l9_121;
int l9_130=l9_128;
float l9_131=l9_122;
float4 l9_132=float4(0.0);
float2 l9_133=l9_129;
int l9_134=sc_EnvmapSpecularLayout_tmp;
int l9_135=l9_130;
float l9_136=l9_131;
float2 l9_137=l9_133;
int l9_138=l9_134;
int l9_139=l9_135;
float3 l9_140=float3(0.0);
if (l9_138==0)
{
l9_140=float3(l9_137,0.0);
}
else
{
if (l9_138==1)
{
l9_140=float3(l9_137.x,(l9_137.y*0.5)+(0.5-(float(l9_139)*0.5)),0.0);
}
else
{
l9_140=float3(l9_137,float(l9_139));
}
}
float3 l9_141=l9_140;
float3 l9_142=l9_141;
float2 l9_143=l9_142.xy;
float l9_144=l9_136;
float4 l9_145=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_143,bias(l9_144));
float4 l9_146=l9_145;
l9_132=l9_146;
float4 l9_147=l9_132;
float4 l9_148=l9_147;
l9_117=l9_148;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_149=l9_116;
float2 l9_150=UserUniforms.sc_EnvmapDiffuseSize.xy;
float l9_151=0.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_149,l9_150,l9_151);
bool l9_152=UserUniforms.isProxyMode!=0;
if (l9_152)
{
float2 l9_153=l9_116;
float l9_154=0.0;
int l9_155=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=varStereoViewID;
}
int l9_157=l9_156;
l9_155=1-l9_157;
}
else
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=varStereoViewID;
}
int l9_159=l9_158;
l9_155=l9_159;
}
int l9_160=l9_155;
float2 l9_161=l9_153;
int l9_162=l9_160;
float l9_163=l9_154;
float4 l9_164=float4(0.0);
float2 l9_165=l9_161;
int l9_166=sc_EnvmapDiffuseLayout_tmp;
int l9_167=l9_162;
float l9_168=l9_163;
float2 l9_169=l9_165;
int l9_170=l9_166;
int l9_171=l9_167;
float3 l9_172=float3(0.0);
if (l9_170==0)
{
l9_172=float3(l9_169,0.0);
}
else
{
if (l9_170==1)
{
l9_172=float3(l9_169.x,(l9_169.y*0.5)+(0.5-(float(l9_171)*0.5)),0.0);
}
else
{
l9_172=float3(l9_169,float(l9_171));
}
}
float3 l9_173=l9_172;
float3 l9_174=l9_173;
float2 l9_175=l9_174.xy;
float l9_176=l9_168;
float4 l9_177=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_175,level(l9_176));
float4 l9_178=l9_177;
l9_164=l9_178;
float4 l9_179=l9_164;
float4 l9_180=l9_179;
l9_117=l9_180;
}
else
{
float2 l9_181=l9_116;
float l9_182=-13.0;
int l9_183=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=varStereoViewID;
}
int l9_185=l9_184;
l9_183=1-l9_185;
}
else
{
int l9_186=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_186=0;
}
else
{
l9_186=varStereoViewID;
}
int l9_187=l9_186;
l9_183=l9_187;
}
int l9_188=l9_183;
float2 l9_189=l9_181;
int l9_190=l9_188;
float l9_191=l9_182;
float4 l9_192=float4(0.0);
float2 l9_193=l9_189;
int l9_194=sc_EnvmapDiffuseLayout_tmp;
int l9_195=l9_190;
float l9_196=l9_191;
float2 l9_197=l9_193;
int l9_198=l9_194;
int l9_199=l9_195;
float3 l9_200=float3(0.0);
if (l9_198==0)
{
l9_200=float3(l9_197,0.0);
}
else
{
if (l9_198==1)
{
l9_200=float3(l9_197.x,(l9_197.y*0.5)+(0.5-(float(l9_199)*0.5)),0.0);
}
else
{
l9_200=float3(l9_197,float(l9_199));
}
}
float3 l9_201=l9_200;
float3 l9_202=l9_201;
float2 l9_203=l9_202.xy;
float l9_204=l9_196;
float4 l9_205=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_203,bias(l9_204));
float4 l9_206=l9_205;
l9_192=l9_206;
float4 l9_207=l9_192;
float4 l9_208=l9_207;
l9_117=l9_208;
}
}
else
{
float2 l9_209=l9_116;
float l9_210=13.0;
int l9_211=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_212=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_212=0;
}
else
{
l9_212=varStereoViewID;
}
int l9_213=l9_212;
l9_211=1-l9_213;
}
else
{
int l9_214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_214=0;
}
else
{
l9_214=varStereoViewID;
}
int l9_215=l9_214;
l9_211=l9_215;
}
int l9_216=l9_211;
float2 l9_217=l9_209;
int l9_218=l9_216;
float l9_219=l9_210;
float4 l9_220=float4(0.0);
float2 l9_221=l9_217;
int l9_222=sc_EnvmapSpecularLayout_tmp;
int l9_223=l9_218;
float l9_224=l9_219;
float2 l9_225=l9_221;
int l9_226=l9_222;
int l9_227=l9_223;
float3 l9_228=float3(0.0);
if (l9_226==0)
{
l9_228=float3(l9_225,0.0);
}
else
{
if (l9_226==1)
{
l9_228=float3(l9_225.x,(l9_225.y*0.5)+(0.5-(float(l9_227)*0.5)),0.0);
}
else
{
l9_228=float3(l9_225,float(l9_227));
}
}
float3 l9_229=l9_228;
float3 l9_230=l9_229;
float2 l9_231=l9_230.xy;
float l9_232=l9_224;
float4 l9_233=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_231,bias(l9_232));
float4 l9_234=l9_233;
l9_220=l9_234;
float4 l9_235=l9_220;
float4 l9_236=l9_235;
l9_117=l9_236;
}
}
float4 l9_237=l9_117;
float3 l9_238=l9_237.xyz*(1.0/l9_237.w);
float3 l9_239=l9_238*UserUniforms.sc_EnvmapExposure;
l9_106=l9_239;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_240=UserUniforms.sc_Sh[0];
float3 l9_241=UserUniforms.sc_Sh[1];
float3 l9_242=UserUniforms.sc_Sh[2];
float3 l9_243=UserUniforms.sc_Sh[3];
float3 l9_244=UserUniforms.sc_Sh[4];
float3 l9_245=UserUniforms.sc_Sh[5];
float3 l9_246=UserUniforms.sc_Sh[6];
float3 l9_247=UserUniforms.sc_Sh[7];
float3 l9_248=UserUniforms.sc_Sh[8];
float3 l9_249=-l9_105;
float l9_250=0.0;
l9_250=l9_249.x;
float l9_251=l9_249.y;
float l9_252=l9_249.z;
float l9_253=l9_250*l9_250;
float l9_254=l9_251*l9_251;
float l9_255=l9_252*l9_252;
float l9_256=l9_250*l9_251;
float l9_257=l9_251*l9_252;
float l9_258=l9_250*l9_252;
float3 l9_259=((((((l9_248*0.42904299)*(l9_253-l9_254))+((l9_246*0.74312502)*l9_255))+(l9_240*0.88622701))-(l9_246*0.24770799))+((((l9_244*l9_256)+(l9_247*l9_258))+(l9_245*l9_257))*0.85808599))+((((l9_243*l9_250)+(l9_241*l9_251))+(l9_242*l9_252))*1.0233279);
l9_106=l9_259*UserUniforms.sc_ShIntensity;
}
}
bool l9_260=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_260)
{
float4 l9_261=sampleRayTracedIndirectDiffuse(varStereoViewID,UserUniforms,sc_RayTracedDiffIndTexture,sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_106=mix(l9_106,l9_261.xyz,float3(l9_261.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[0].color*UserUniforms.sc_AmbientLights[0].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[1].color*UserUniforms.sc_AmbientLights[1].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[2].color*UserUniforms.sc_AmbientLights[2].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_262=l9_105;
float3 l9_263=UserUniforms.sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_264;
float l9_265;
int l9_266=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_266<sc_LightEstimationSGCount_tmp)
{
l9_264.color=UserUniforms.sc_LightEstimationData.sg[l9_266].color;
l9_264.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_266].sharpness;
l9_264.axis=UserUniforms.sc_LightEstimationData.sg[l9_266].axis;
float3 l9_267=l9_262;
float l9_268=dot(l9_264.axis,l9_267);
float l9_269=l9_264.sharpness;
float l9_270=0.36000001;
float l9_271=1.0/(4.0*l9_270);
float l9_272=exp(-l9_269);
float l9_273=l9_272*l9_272;
float l9_274=1.0/l9_269;
float l9_275=(1.0+(2.0*l9_273))-l9_274;
float l9_276=((l9_272-l9_273)*l9_274)-l9_273;
float l9_277=sqrt(1.0-l9_275);
float l9_278=l9_270*l9_268;
float l9_279=l9_271*l9_277;
float l9_280=l9_278+l9_279;
float l9_281=l9_268;
float l9_282=fast::clamp(l9_281,0.0,1.0);
float l9_283=l9_282;
if (step(abs(l9_278),l9_279)>0.5)
{
l9_265=(l9_280*l9_280)/l9_277;
}
else
{
l9_265=l9_283;
}
l9_283=l9_265;
float l9_284=(l9_275*l9_283)+l9_276;
sc_SphericalGaussianLight_t l9_285=l9_264;
float3 l9_286=(l9_285.color/float3(l9_285.sharpness))*6.2831855;
float3 l9_287=(l9_286*l9_284)/float3(3.1415927);
l9_263+=l9_287;
l9_266++;
continue;
}
else
{
break;
}
}
float3 l9_288=l9_263;
l9_106+=l9_288;
}
float3 l9_289=l9_106;
float3 l9_290=l9_289;
l9_12.indirectDiffuse=l9_290;
LightingComponents l9_291=l9_12;
LightingComponents lighting=l9_291;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
lighting.directDiffuse=float3(0.0);
lighting.indirectDiffuse=float3(0.0);
float4 l9_292=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_293=FragColor0;
float4 l9_294=l9_293;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_294.x+=UserUniforms._sc_framebufferFetchMarker;
}
float4 l9_295=l9_294;
l9_292=l9_295;
}
else
{
float4 l9_296=gl_FragCoord;
float2 l9_297=l9_296.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_298=l9_297;
float2 l9_299=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_300=1;
int l9_301=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_301=0;
}
else
{
l9_301=varStereoViewID;
}
int l9_302=l9_301;
int l9_303=l9_302;
float3 l9_304=float3(l9_298,0.0);
int l9_305=l9_300;
int l9_306=l9_303;
if (l9_305==1)
{
l9_304.y=((2.0*l9_304.y)+float(l9_306))-1.0;
}
float2 l9_307=l9_304.xy;
l9_299=l9_307;
}
else
{
l9_299=l9_298;
}
float2 l9_308=l9_299;
float2 l9_309=l9_308;
float2 l9_310=l9_309;
int l9_311=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_312=0;
}
else
{
l9_312=varStereoViewID;
}
int l9_313=l9_312;
l9_311=1-l9_313;
}
else
{
int l9_314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_314=0;
}
else
{
l9_314=varStereoViewID;
}
int l9_315=l9_314;
l9_311=l9_315;
}
int l9_316=l9_311;
float2 l9_317=l9_310;
int l9_318=l9_316;
float2 l9_319=l9_317;
int l9_320=l9_318;
float l9_321=0.0;
float4 l9_322=float4(0.0);
float2 l9_323=l9_319;
int l9_324=sc_ScreenTextureLayout_tmp;
int l9_325=l9_320;
float l9_326=l9_321;
float2 l9_327=l9_323;
int l9_328=l9_324;
int l9_329=l9_325;
float3 l9_330=float3(0.0);
if (l9_328==0)
{
l9_330=float3(l9_327,0.0);
}
else
{
if (l9_328==1)
{
l9_330=float3(l9_327.x,(l9_327.y*0.5)+(0.5-(float(l9_329)*0.5)),0.0);
}
else
{
l9_330=float3(l9_327,float(l9_329));
}
}
float3 l9_331=l9_330;
float3 l9_332=l9_331;
float2 l9_333=l9_332.xy;
float l9_334=l9_326;
float4 l9_335=sc_ScreenTexture.sample(sc_ScreenTextureSmpSC,l9_333,bias(l9_334));
float4 l9_336=l9_335;
l9_322=l9_336;
float4 l9_337=l9_322;
float4 l9_338=l9_337;
float4 l9_339=l9_338;
l9_292=l9_339;
}
float4 l9_340=l9_292;
float4 l9_341=l9_340;
float3 param_5=l9_341.xyz;
float3 l9_342;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_342=float3(pow(param_5.x,2.2),pow(param_5.y,2.2),pow(param_5.z,2.2));
}
else
{
l9_342=param_5*param_5;
}
float3 l9_343=l9_342;
float3 framebuffer=l9_343;
lighting.transmitted=framebuffer*mix(float3(1.0),surfaceProperties.albedo,float3(surfaceProperties.opacity));
surfaceProperties.opacity=1.0;
}
bool enablePremultipliedAlpha=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
enablePremultipliedAlpha=true;
}
SurfaceProperties param_6=surfaceProperties;
LightingComponents param_7=lighting;
bool param_8=enablePremultipliedAlpha;
float3 l9_344=float3(0.0);
bool l9_345=UserUniforms.receivesRayTracedAo!=0;
if (l9_345)
{
l9_344=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*float3(1.0-sampleRayTracedAo(varStereoViewID,UserUniforms,sc_RayTracedAoTexture,sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_344=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*param_6.ao));
}
float3 l9_346=param_7.directSpecular+(param_7.indirectSpecular*param_6.specularAo);
float3 l9_347=param_6.emissive;
float3 l9_348=param_7.transmitted;
if (param_8)
{
float l9_349=param_6.opacity;
l9_344*=srgbToLinear(l9_349);
}
float3 l9_350=((l9_344+l9_346)+l9_347)+l9_348;
float3 l9_351=l9_350;
float4 Output=float4(l9_351,surfaceProperties.opacity);
bool l9_352=UserUniforms.isProxyMode!=0;
if (l9_352)
{
return Output;
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 param_9=Output.xyz;
float l9_353=1.8;
float l9_354=1.4;
float l9_355=0.5;
float l9_356=1.5;
float3 l9_357=(param_9*((param_9*l9_353)+float3(l9_354)))/((param_9*((param_9*l9_353)+float3(l9_355)))+float3(l9_356));
Output=float4(l9_357.x,l9_357.y,l9_357.z,Output.w);
}
float3 param_10=Output.xyz;
float l9_358=param_10.x;
float l9_359=param_10.y;
float l9_360=param_10.z;
float3 l9_361=float3(linearToSrgb(l9_358),linearToSrgb(l9_359),linearToSrgb(l9_360));
Output=float4(l9_361.x,l9_361.y,l9_361.z,Output.w);
return Output;
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
bool l9_2=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_2)
{
float4 l9_3=gl_FragCoord;
int2 l9_4=int2(l9_3.xy);
RayHitPayload l9_5=GetHitData(l9_4,(*sc_set2.UserUniforms),sc_set2.z_rayDirections,sc_set2.z_rayDirectionsSmpSC,sc_set2.z_hitIdAndBarycentric,sc_set2.z_hitIdAndBarycentricSmp,(*sc_set2.layoutVertices),(*sc_set2.layoutVerticesPN),(*sc_set2.layoutIndices));
RayHitPayload rhp=l9_5;
bool l9_6=(*sc_set2.UserUniforms).noEarlyZ!=0;
if (l9_6)
{
if (rhp.id.x!=uint((*sc_set2.UserUniforms).instance_id))
{
return out;
}
}
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=rhp.viewDirWS;
Globals.PositionWS=rhp.positionWS;
Globals.VertexColor=rhp.color;
Globals.Surface_UVCoord0=rhp.uv0;
Globals.Surface_UVCoord1=rhp.uv1;
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
float4 emitterPositionCS=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_8]*float4(rhp.positionWS,1.0);
Globals.gScreenCoord=((emitterPositionCS.xy/float2(emitterPositionCS.w))*0.5)+float2(0.5);
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
}
else
{
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_9=gl_FragCoord;
float2 l9_10=l9_9.xy*(*sc_set2.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_11=l9_10;
float2 l9_12=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_13=1;
int l9_14=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_14=0;
}
else
{
l9_14=in.varStereoViewID;
}
int l9_15=l9_14;
int l9_16=l9_15;
float3 l9_17=float3(l9_11,0.0);
int l9_18=l9_13;
int l9_19=l9_16;
if (l9_18==1)
{
l9_17.y=((2.0*l9_17.y)+float(l9_19))-1.0;
}
float2 l9_20=l9_17.xy;
l9_12=l9_20;
}
else
{
l9_12=l9_11;
}
float2 l9_21=l9_12;
float2 l9_22=l9_21;
Globals.gScreenCoord=l9_22;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
}
float4 Result_N363=float4(0.0);
float4 param=float4(0.0);
float4 param_1=float4(0.0);
ssGlobals param_3=Globals;
float4 param_2;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_23=float4(0.0);
l9_23=param_3.VertexColor;
float3 l9_24=float3(0.0);
float3 l9_25=float3(0.0);
float3 l9_26=float3(0.0);
ssGlobals l9_27=param_3;
float3 l9_28;
if ((int(ENABLE_RECOLOR_tmp)!=0))
{
float3 l9_29=float3(0.0);
float3 l9_30=(*sc_set2.UserUniforms).recolorRed;
l9_29=l9_30;
float3 l9_31=float3(0.0);
l9_31=l9_29;
float2 l9_32=float2(0.0);
l9_32=l9_27.Surface_UVCoord0;
float l9_33=0.0;
float4 l9_34=float4(l9_32,0.0,0.0);
float l9_35=l9_34.y;
l9_33=l9_35;
float4 l9_36=float4(0.0);
float4 l9_37=(*sc_set2.UserUniforms).Tweak_N81;
l9_36=l9_37;
float4 l9_38=float4(0.0);
float4 l9_39=(*sc_set2.UserUniforms).baseColor;
l9_38=l9_39;
float4 l9_40=float4(0.0);
float l9_41=l9_33;
float4 l9_42=l9_36;
float l9_43=(*sc_set2.UserUniforms).Port_Position1_N078;
float4 l9_44=l9_36;
float4 l9_45=l9_38;
l9_41=fast::clamp(l9_41,0.0,1.0);
float4 l9_46;
if (l9_41<l9_43)
{
l9_46=mix(l9_42,l9_44,float4(fast::clamp(l9_41/l9_43,0.0,1.0)));
}
else
{
l9_46=mix(l9_44,l9_45,float4(fast::clamp((l9_41-l9_43)/(1.0-l9_43),0.0,1.0)));
}
bool l9_47=(*sc_set2.UserUniforms).PreviewEnabled==1;
bool l9_48;
if (l9_47)
{
l9_48=!PreviewInfo.Saved;
}
else
{
l9_48=l9_47;
}
bool l9_49;
if (l9_48)
{
l9_49=78==(*sc_set2.UserUniforms).PreviewNodeID;
}
else
{
l9_49=l9_48;
}
if (l9_49)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_46;
PreviewInfo.Color.w=1.0;
}
l9_40=l9_46;
float4 l9_50=float4(0.0);
l9_50=l9_40;
float4 l9_51=float4(0.0);
float4 l9_52=float4(0.0);
float4 l9_53=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_54=l9_27;
float4 l9_55;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_56=float2(0.0);
float2 l9_57=float2(0.0);
float2 l9_58=float2(0.0);
float2 l9_59=float2(0.0);
float2 l9_60=float2(0.0);
float2 l9_61=float2(0.0);
ssGlobals l9_62=l9_54;
float2 l9_63;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_64=float2(0.0);
l9_64=l9_62.Surface_UVCoord0;
l9_57=l9_64;
l9_63=l9_57;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_65=float2(0.0);
l9_65=l9_62.Surface_UVCoord1;
l9_58=l9_65;
l9_63=l9_58;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_66=float2(0.0);
float2 l9_67=float2(0.0);
float2 l9_68=float2(0.0);
ssGlobals l9_69=l9_62;
float2 l9_70;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_71=float2(0.0);
float2 l9_72=float2(0.0);
float2 l9_73=float2(0.0);
ssGlobals l9_74=l9_69;
float2 l9_75;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_76=float2(0.0);
float2 l9_77=float2(0.0);
float2 l9_78=float2(0.0);
float2 l9_79=float2(0.0);
float2 l9_80=float2(0.0);
ssGlobals l9_81=l9_74;
float2 l9_82;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_83=float2(0.0);
l9_83=l9_81.Surface_UVCoord0;
l9_77=l9_83;
l9_82=l9_77;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_84=float2(0.0);
l9_84=l9_81.Surface_UVCoord1;
l9_78=l9_84;
l9_82=l9_78;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_85=float2(0.0);
l9_85=l9_81.gScreenCoord;
l9_79=l9_85;
l9_82=l9_79;
}
else
{
float2 l9_86=float2(0.0);
l9_86=l9_81.Surface_UVCoord0;
l9_80=l9_86;
l9_82=l9_80;
}
}
}
l9_76=l9_82;
float2 l9_87=float2(0.0);
float2 l9_88=(*sc_set2.UserUniforms).uv2Scale;
l9_87=l9_88;
float2 l9_89=float2(0.0);
l9_89=l9_87;
float2 l9_90=float2(0.0);
float2 l9_91=(*sc_set2.UserUniforms).uv2Offset;
l9_90=l9_91;
float2 l9_92=float2(0.0);
l9_92=l9_90;
float2 l9_93=float2(0.0);
l9_93=(l9_76*l9_89)+l9_92;
float2 l9_94=float2(0.0);
l9_94=l9_93+(l9_92*(l9_74.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_72=l9_94;
l9_75=l9_72;
}
else
{
float2 l9_95=float2(0.0);
float2 l9_96=float2(0.0);
float2 l9_97=float2(0.0);
float2 l9_98=float2(0.0);
float2 l9_99=float2(0.0);
ssGlobals l9_100=l9_74;
float2 l9_101;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_102=float2(0.0);
l9_102=l9_100.Surface_UVCoord0;
l9_96=l9_102;
l9_101=l9_96;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_103=float2(0.0);
l9_103=l9_100.Surface_UVCoord1;
l9_97=l9_103;
l9_101=l9_97;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_104=float2(0.0);
l9_104=l9_100.gScreenCoord;
l9_98=l9_104;
l9_101=l9_98;
}
else
{
float2 l9_105=float2(0.0);
l9_105=l9_100.Surface_UVCoord0;
l9_99=l9_105;
l9_101=l9_99;
}
}
}
l9_95=l9_101;
float2 l9_106=float2(0.0);
float2 l9_107=(*sc_set2.UserUniforms).uv2Scale;
l9_106=l9_107;
float2 l9_108=float2(0.0);
l9_108=l9_106;
float2 l9_109=float2(0.0);
float2 l9_110=(*sc_set2.UserUniforms).uv2Offset;
l9_109=l9_110;
float2 l9_111=float2(0.0);
l9_111=l9_109;
float2 l9_112=float2(0.0);
l9_112=(l9_95*l9_108)+l9_111;
l9_73=l9_112;
l9_75=l9_73;
}
l9_71=l9_75;
l9_67=l9_71;
l9_70=l9_67;
}
else
{
float2 l9_113=float2(0.0);
l9_113=l9_69.Surface_UVCoord0;
l9_68=l9_113;
l9_70=l9_68;
}
l9_66=l9_70;
float2 l9_114=float2(0.0);
l9_114=l9_66;
float2 l9_115=float2(0.0);
l9_115=l9_114;
l9_59=l9_115;
l9_63=l9_59;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_116=float2(0.0);
float2 l9_117=float2(0.0);
float2 l9_118=float2(0.0);
ssGlobals l9_119=l9_62;
float2 l9_120;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_121=float2(0.0);
float2 l9_122=float2(0.0);
float2 l9_123=float2(0.0);
ssGlobals l9_124=l9_119;
float2 l9_125;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_126=float2(0.0);
float2 l9_127=float2(0.0);
float2 l9_128=float2(0.0);
float2 l9_129=float2(0.0);
float2 l9_130=float2(0.0);
float2 l9_131=float2(0.0);
ssGlobals l9_132=l9_124;
float2 l9_133;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_134=float2(0.0);
l9_134=l9_132.Surface_UVCoord0;
l9_127=l9_134;
l9_133=l9_127;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_135=float2(0.0);
l9_135=l9_132.Surface_UVCoord1;
l9_128=l9_135;
l9_133=l9_128;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_136=float2(0.0);
l9_136=l9_132.gScreenCoord;
l9_129=l9_136;
l9_133=l9_129;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_137=float2(0.0);
float2 l9_138=float2(0.0);
float2 l9_139=float2(0.0);
ssGlobals l9_140=l9_132;
float2 l9_141;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_142=float2(0.0);
float2 l9_143=float2(0.0);
float2 l9_144=float2(0.0);
ssGlobals l9_145=l9_140;
float2 l9_146;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_147=float2(0.0);
float2 l9_148=float2(0.0);
float2 l9_149=float2(0.0);
float2 l9_150=float2(0.0);
float2 l9_151=float2(0.0);
ssGlobals l9_152=l9_145;
float2 l9_153;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_154=float2(0.0);
l9_154=l9_152.Surface_UVCoord0;
l9_148=l9_154;
l9_153=l9_148;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_155=float2(0.0);
l9_155=l9_152.Surface_UVCoord1;
l9_149=l9_155;
l9_153=l9_149;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_156=float2(0.0);
l9_156=l9_152.gScreenCoord;
l9_150=l9_156;
l9_153=l9_150;
}
else
{
float2 l9_157=float2(0.0);
l9_157=l9_152.Surface_UVCoord0;
l9_151=l9_157;
l9_153=l9_151;
}
}
}
l9_147=l9_153;
float2 l9_158=float2(0.0);
float2 l9_159=(*sc_set2.UserUniforms).uv2Scale;
l9_158=l9_159;
float2 l9_160=float2(0.0);
l9_160=l9_158;
float2 l9_161=float2(0.0);
float2 l9_162=(*sc_set2.UserUniforms).uv2Offset;
l9_161=l9_162;
float2 l9_163=float2(0.0);
l9_163=l9_161;
float2 l9_164=float2(0.0);
l9_164=(l9_147*l9_160)+l9_163;
float2 l9_165=float2(0.0);
l9_165=l9_164+(l9_163*(l9_145.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_143=l9_165;
l9_146=l9_143;
}
else
{
float2 l9_166=float2(0.0);
float2 l9_167=float2(0.0);
float2 l9_168=float2(0.0);
float2 l9_169=float2(0.0);
float2 l9_170=float2(0.0);
ssGlobals l9_171=l9_145;
float2 l9_172;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_173=float2(0.0);
l9_173=l9_171.Surface_UVCoord0;
l9_167=l9_173;
l9_172=l9_167;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_174=float2(0.0);
l9_174=l9_171.Surface_UVCoord1;
l9_168=l9_174;
l9_172=l9_168;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_175=float2(0.0);
l9_175=l9_171.gScreenCoord;
l9_169=l9_175;
l9_172=l9_169;
}
else
{
float2 l9_176=float2(0.0);
l9_176=l9_171.Surface_UVCoord0;
l9_170=l9_176;
l9_172=l9_170;
}
}
}
l9_166=l9_172;
float2 l9_177=float2(0.0);
float2 l9_178=(*sc_set2.UserUniforms).uv2Scale;
l9_177=l9_178;
float2 l9_179=float2(0.0);
l9_179=l9_177;
float2 l9_180=float2(0.0);
float2 l9_181=(*sc_set2.UserUniforms).uv2Offset;
l9_180=l9_181;
float2 l9_182=float2(0.0);
l9_182=l9_180;
float2 l9_183=float2(0.0);
l9_183=(l9_166*l9_179)+l9_182;
l9_144=l9_183;
l9_146=l9_144;
}
l9_142=l9_146;
l9_138=l9_142;
l9_141=l9_138;
}
else
{
float2 l9_184=float2(0.0);
l9_184=l9_140.Surface_UVCoord0;
l9_139=l9_184;
l9_141=l9_139;
}
l9_137=l9_141;
float2 l9_185=float2(0.0);
l9_185=l9_137;
float2 l9_186=float2(0.0);
l9_186=l9_185;
l9_130=l9_186;
l9_133=l9_130;
}
else
{
float2 l9_187=float2(0.0);
l9_187=l9_132.Surface_UVCoord0;
l9_131=l9_187;
l9_133=l9_131;
}
}
}
}
l9_126=l9_133;
float2 l9_188=float2(0.0);
float2 l9_189=(*sc_set2.UserUniforms).uv3Scale;
l9_188=l9_189;
float2 l9_190=float2(0.0);
l9_190=l9_188;
float2 l9_191=float2(0.0);
float2 l9_192=(*sc_set2.UserUniforms).uv3Offset;
l9_191=l9_192;
float2 l9_193=float2(0.0);
l9_193=l9_191;
float2 l9_194=float2(0.0);
l9_194=(l9_126*l9_190)+l9_193;
float2 l9_195=float2(0.0);
l9_195=l9_194+(l9_193*(l9_124.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_122=l9_195;
l9_125=l9_122;
}
else
{
float2 l9_196=float2(0.0);
float2 l9_197=float2(0.0);
float2 l9_198=float2(0.0);
float2 l9_199=float2(0.0);
float2 l9_200=float2(0.0);
float2 l9_201=float2(0.0);
ssGlobals l9_202=l9_124;
float2 l9_203;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_204=float2(0.0);
l9_204=l9_202.Surface_UVCoord0;
l9_197=l9_204;
l9_203=l9_197;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_205=float2(0.0);
l9_205=l9_202.Surface_UVCoord1;
l9_198=l9_205;
l9_203=l9_198;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_206=float2(0.0);
l9_206=l9_202.gScreenCoord;
l9_199=l9_206;
l9_203=l9_199;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_207=float2(0.0);
float2 l9_208=float2(0.0);
float2 l9_209=float2(0.0);
ssGlobals l9_210=l9_202;
float2 l9_211;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_212=float2(0.0);
float2 l9_213=float2(0.0);
float2 l9_214=float2(0.0);
ssGlobals l9_215=l9_210;
float2 l9_216;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_217=float2(0.0);
float2 l9_218=float2(0.0);
float2 l9_219=float2(0.0);
float2 l9_220=float2(0.0);
float2 l9_221=float2(0.0);
ssGlobals l9_222=l9_215;
float2 l9_223;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_224=float2(0.0);
l9_224=l9_222.Surface_UVCoord0;
l9_218=l9_224;
l9_223=l9_218;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_225=float2(0.0);
l9_225=l9_222.Surface_UVCoord1;
l9_219=l9_225;
l9_223=l9_219;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_226=float2(0.0);
l9_226=l9_222.gScreenCoord;
l9_220=l9_226;
l9_223=l9_220;
}
else
{
float2 l9_227=float2(0.0);
l9_227=l9_222.Surface_UVCoord0;
l9_221=l9_227;
l9_223=l9_221;
}
}
}
l9_217=l9_223;
float2 l9_228=float2(0.0);
float2 l9_229=(*sc_set2.UserUniforms).uv2Scale;
l9_228=l9_229;
float2 l9_230=float2(0.0);
l9_230=l9_228;
float2 l9_231=float2(0.0);
float2 l9_232=(*sc_set2.UserUniforms).uv2Offset;
l9_231=l9_232;
float2 l9_233=float2(0.0);
l9_233=l9_231;
float2 l9_234=float2(0.0);
l9_234=(l9_217*l9_230)+l9_233;
float2 l9_235=float2(0.0);
l9_235=l9_234+(l9_233*(l9_215.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_213=l9_235;
l9_216=l9_213;
}
else
{
float2 l9_236=float2(0.0);
float2 l9_237=float2(0.0);
float2 l9_238=float2(0.0);
float2 l9_239=float2(0.0);
float2 l9_240=float2(0.0);
ssGlobals l9_241=l9_215;
float2 l9_242;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_243=float2(0.0);
l9_243=l9_241.Surface_UVCoord0;
l9_237=l9_243;
l9_242=l9_237;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_244=float2(0.0);
l9_244=l9_241.Surface_UVCoord1;
l9_238=l9_244;
l9_242=l9_238;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_245=float2(0.0);
l9_245=l9_241.gScreenCoord;
l9_239=l9_245;
l9_242=l9_239;
}
else
{
float2 l9_246=float2(0.0);
l9_246=l9_241.Surface_UVCoord0;
l9_240=l9_246;
l9_242=l9_240;
}
}
}
l9_236=l9_242;
float2 l9_247=float2(0.0);
float2 l9_248=(*sc_set2.UserUniforms).uv2Scale;
l9_247=l9_248;
float2 l9_249=float2(0.0);
l9_249=l9_247;
float2 l9_250=float2(0.0);
float2 l9_251=(*sc_set2.UserUniforms).uv2Offset;
l9_250=l9_251;
float2 l9_252=float2(0.0);
l9_252=l9_250;
float2 l9_253=float2(0.0);
l9_253=(l9_236*l9_249)+l9_252;
l9_214=l9_253;
l9_216=l9_214;
}
l9_212=l9_216;
l9_208=l9_212;
l9_211=l9_208;
}
else
{
float2 l9_254=float2(0.0);
l9_254=l9_210.Surface_UVCoord0;
l9_209=l9_254;
l9_211=l9_209;
}
l9_207=l9_211;
float2 l9_255=float2(0.0);
l9_255=l9_207;
float2 l9_256=float2(0.0);
l9_256=l9_255;
l9_200=l9_256;
l9_203=l9_200;
}
else
{
float2 l9_257=float2(0.0);
l9_257=l9_202.Surface_UVCoord0;
l9_201=l9_257;
l9_203=l9_201;
}
}
}
}
l9_196=l9_203;
float2 l9_258=float2(0.0);
float2 l9_259=(*sc_set2.UserUniforms).uv3Scale;
l9_258=l9_259;
float2 l9_260=float2(0.0);
l9_260=l9_258;
float2 l9_261=float2(0.0);
float2 l9_262=(*sc_set2.UserUniforms).uv3Offset;
l9_261=l9_262;
float2 l9_263=float2(0.0);
l9_263=l9_261;
float2 l9_264=float2(0.0);
l9_264=(l9_196*l9_260)+l9_263;
l9_123=l9_264;
l9_125=l9_123;
}
l9_121=l9_125;
l9_117=l9_121;
l9_120=l9_117;
}
else
{
float2 l9_265=float2(0.0);
l9_265=l9_119.Surface_UVCoord0;
l9_118=l9_265;
l9_120=l9_118;
}
l9_116=l9_120;
float2 l9_266=float2(0.0);
l9_266=l9_116;
float2 l9_267=float2(0.0);
l9_267=l9_266;
l9_60=l9_267;
l9_63=l9_60;
}
else
{
float2 l9_268=float2(0.0);
l9_268=l9_62.Surface_UVCoord0;
l9_61=l9_268;
l9_63=l9_61;
}
}
}
}
l9_56=l9_63;
float4 l9_269=float4(0.0);
int l9_270=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_271=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_271=0;
}
else
{
l9_271=in.varStereoViewID;
}
int l9_272=l9_271;
l9_270=1-l9_272;
}
else
{
int l9_273=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_273=0;
}
else
{
l9_273=in.varStereoViewID;
}
int l9_274=l9_273;
l9_270=l9_274;
}
int l9_275=l9_270;
int l9_276=baseTexLayout_tmp;
int l9_277=l9_275;
float2 l9_278=l9_56;
bool l9_279=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_280=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_281=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_282=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_283=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_284=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_285=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_286=0.0;
bool l9_287=l9_284&&(!l9_282);
float l9_288=1.0;
float l9_289=l9_278.x;
int l9_290=l9_281.x;
if (l9_290==1)
{
l9_289=fract(l9_289);
}
else
{
if (l9_290==2)
{
float l9_291=fract(l9_289);
float l9_292=l9_289-l9_291;
float l9_293=step(0.25,fract(l9_292*0.5));
l9_289=mix(l9_291,1.0-l9_291,fast::clamp(l9_293,0.0,1.0));
}
}
l9_278.x=l9_289;
float l9_294=l9_278.y;
int l9_295=l9_281.y;
if (l9_295==1)
{
l9_294=fract(l9_294);
}
else
{
if (l9_295==2)
{
float l9_296=fract(l9_294);
float l9_297=l9_294-l9_296;
float l9_298=step(0.25,fract(l9_297*0.5));
l9_294=mix(l9_296,1.0-l9_296,fast::clamp(l9_298,0.0,1.0));
}
}
l9_278.y=l9_294;
if (l9_282)
{
bool l9_299=l9_284;
bool l9_300;
if (l9_299)
{
l9_300=l9_281.x==3;
}
else
{
l9_300=l9_299;
}
float l9_301=l9_278.x;
float l9_302=l9_283.x;
float l9_303=l9_283.z;
bool l9_304=l9_300;
float l9_305=l9_288;
float l9_306=fast::clamp(l9_301,l9_302,l9_303);
float l9_307=step(abs(l9_301-l9_306),9.9999997e-06);
l9_305*=(l9_307+((1.0-float(l9_304))*(1.0-l9_307)));
l9_301=l9_306;
l9_278.x=l9_301;
l9_288=l9_305;
bool l9_308=l9_284;
bool l9_309;
if (l9_308)
{
l9_309=l9_281.y==3;
}
else
{
l9_309=l9_308;
}
float l9_310=l9_278.y;
float l9_311=l9_283.y;
float l9_312=l9_283.w;
bool l9_313=l9_309;
float l9_314=l9_288;
float l9_315=fast::clamp(l9_310,l9_311,l9_312);
float l9_316=step(abs(l9_310-l9_315),9.9999997e-06);
l9_314*=(l9_316+((1.0-float(l9_313))*(1.0-l9_316)));
l9_310=l9_315;
l9_278.y=l9_310;
l9_288=l9_314;
}
float2 l9_317=l9_278;
bool l9_318=l9_279;
float3x3 l9_319=l9_280;
if (l9_318)
{
l9_317=float2((l9_319*float3(l9_317,1.0)).xy);
}
float2 l9_320=l9_317;
float2 l9_321=l9_320;
float2 l9_322=l9_321;
l9_278=l9_322;
float l9_323=l9_278.x;
int l9_324=l9_281.x;
bool l9_325=l9_287;
float l9_326=l9_288;
if ((l9_324==0)||(l9_324==3))
{
float l9_327=l9_323;
float l9_328=0.0;
float l9_329=1.0;
bool l9_330=l9_325;
float l9_331=l9_326;
float l9_332=fast::clamp(l9_327,l9_328,l9_329);
float l9_333=step(abs(l9_327-l9_332),9.9999997e-06);
l9_331*=(l9_333+((1.0-float(l9_330))*(1.0-l9_333)));
l9_327=l9_332;
l9_323=l9_327;
l9_326=l9_331;
}
l9_278.x=l9_323;
l9_288=l9_326;
float l9_334=l9_278.y;
int l9_335=l9_281.y;
bool l9_336=l9_287;
float l9_337=l9_288;
if ((l9_335==0)||(l9_335==3))
{
float l9_338=l9_334;
float l9_339=0.0;
float l9_340=1.0;
bool l9_341=l9_336;
float l9_342=l9_337;
float l9_343=fast::clamp(l9_338,l9_339,l9_340);
float l9_344=step(abs(l9_338-l9_343),9.9999997e-06);
l9_342*=(l9_344+((1.0-float(l9_341))*(1.0-l9_344)));
l9_338=l9_343;
l9_334=l9_338;
l9_337=l9_342;
}
l9_278.y=l9_334;
l9_288=l9_337;
float2 l9_345=l9_278;
int l9_346=l9_276;
int l9_347=l9_277;
float l9_348=l9_286;
float2 l9_349=l9_345;
int l9_350=l9_346;
int l9_351=l9_347;
float3 l9_352=float3(0.0);
if (l9_350==0)
{
l9_352=float3(l9_349,0.0);
}
else
{
if (l9_350==1)
{
l9_352=float3(l9_349.x,(l9_349.y*0.5)+(0.5-(float(l9_351)*0.5)),0.0);
}
else
{
l9_352=float3(l9_349,float(l9_351));
}
}
float3 l9_353=l9_352;
float3 l9_354=l9_353;
float2 l9_355=l9_354.xy;
float l9_356=l9_348;
float4 l9_357=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_355,bias(l9_356));
float4 l9_358=l9_357;
float4 l9_359=l9_358;
if (l9_284)
{
l9_359=mix(l9_285,l9_359,float4(l9_288));
}
float4 l9_360=l9_359;
l9_269=l9_360;
l9_52=l9_269;
l9_55=l9_52;
}
else
{
l9_55=l9_53;
}
l9_51=l9_55;
float4 l9_361=float4(0.0);
l9_361=l9_50*l9_51;
float4 l9_362=float4(0.0);
l9_362=l9_361;
float4 l9_363=float4(0.0);
l9_363=l9_362;
float l9_364=0.0;
float l9_365=0.0;
float l9_366=0.0;
float3 l9_367=l9_363.xyz;
float l9_368=l9_367.x;
float l9_369=l9_367.y;
float l9_370=l9_367.z;
l9_364=l9_368;
l9_365=l9_369;
l9_366=l9_370;
float3 l9_371=float3(0.0);
l9_371=l9_31*float3(l9_364);
float3 l9_372=float3(0.0);
float3 l9_373=(*sc_set2.UserUniforms).recolorGreen;
l9_372=l9_373;
float3 l9_374=float3(0.0);
l9_374=l9_372;
float3 l9_375=float3(0.0);
l9_375=l9_374*float3(l9_365);
float3 l9_376=float3(0.0);
float3 l9_377=(*sc_set2.UserUniforms).recolorBlue;
l9_376=l9_377;
float3 l9_378=float3(0.0);
l9_378=l9_376;
float3 l9_379=float3(0.0);
l9_379=l9_378*float3(l9_366);
float3 l9_380=float3(0.0);
l9_380=(l9_371+l9_375)+l9_379;
l9_25=l9_380;
l9_28=l9_25;
}
else
{
float2 l9_381=float2(0.0);
l9_381=l9_27.Surface_UVCoord0;
float l9_382=0.0;
float4 l9_383=float4(l9_381,0.0,0.0);
float l9_384=l9_383.y;
l9_382=l9_384;
float4 l9_385=float4(0.0);
float4 l9_386=(*sc_set2.UserUniforms).Tweak_N81;
l9_385=l9_386;
float4 l9_387=float4(0.0);
float4 l9_388=(*sc_set2.UserUniforms).baseColor;
l9_387=l9_388;
float4 l9_389=float4(0.0);
float l9_390=l9_382;
float4 l9_391=l9_385;
float l9_392=(*sc_set2.UserUniforms).Port_Position1_N078;
float4 l9_393=l9_385;
float4 l9_394=l9_387;
l9_390=fast::clamp(l9_390,0.0,1.0);
float4 l9_395;
if (l9_390<l9_392)
{
l9_395=mix(l9_391,l9_393,float4(fast::clamp(l9_390/l9_392,0.0,1.0)));
}
else
{
l9_395=mix(l9_393,l9_394,float4(fast::clamp((l9_390-l9_392)/(1.0-l9_392),0.0,1.0)));
}
bool l9_396=(*sc_set2.UserUniforms).PreviewEnabled==1;
bool l9_397;
if (l9_396)
{
l9_397=!PreviewInfo.Saved;
}
else
{
l9_397=l9_396;
}
bool l9_398;
if (l9_397)
{
l9_398=78==(*sc_set2.UserUniforms).PreviewNodeID;
}
else
{
l9_398=l9_397;
}
if (l9_398)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_395;
PreviewInfo.Color.w=1.0;
}
l9_389=l9_395;
float4 l9_399=float4(0.0);
l9_399=l9_389;
float4 l9_400=float4(0.0);
float4 l9_401=float4(0.0);
float4 l9_402=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_403=l9_27;
float4 l9_404;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_405=float2(0.0);
float2 l9_406=float2(0.0);
float2 l9_407=float2(0.0);
float2 l9_408=float2(0.0);
float2 l9_409=float2(0.0);
float2 l9_410=float2(0.0);
ssGlobals l9_411=l9_403;
float2 l9_412;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_413=float2(0.0);
l9_413=l9_411.Surface_UVCoord0;
l9_406=l9_413;
l9_412=l9_406;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_414=float2(0.0);
l9_414=l9_411.Surface_UVCoord1;
l9_407=l9_414;
l9_412=l9_407;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_415=float2(0.0);
float2 l9_416=float2(0.0);
float2 l9_417=float2(0.0);
ssGlobals l9_418=l9_411;
float2 l9_419;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_420=float2(0.0);
float2 l9_421=float2(0.0);
float2 l9_422=float2(0.0);
ssGlobals l9_423=l9_418;
float2 l9_424;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_425=float2(0.0);
float2 l9_426=float2(0.0);
float2 l9_427=float2(0.0);
float2 l9_428=float2(0.0);
float2 l9_429=float2(0.0);
ssGlobals l9_430=l9_423;
float2 l9_431;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_432=float2(0.0);
l9_432=l9_430.Surface_UVCoord0;
l9_426=l9_432;
l9_431=l9_426;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_433=float2(0.0);
l9_433=l9_430.Surface_UVCoord1;
l9_427=l9_433;
l9_431=l9_427;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_434=float2(0.0);
l9_434=l9_430.gScreenCoord;
l9_428=l9_434;
l9_431=l9_428;
}
else
{
float2 l9_435=float2(0.0);
l9_435=l9_430.Surface_UVCoord0;
l9_429=l9_435;
l9_431=l9_429;
}
}
}
l9_425=l9_431;
float2 l9_436=float2(0.0);
float2 l9_437=(*sc_set2.UserUniforms).uv2Scale;
l9_436=l9_437;
float2 l9_438=float2(0.0);
l9_438=l9_436;
float2 l9_439=float2(0.0);
float2 l9_440=(*sc_set2.UserUniforms).uv2Offset;
l9_439=l9_440;
float2 l9_441=float2(0.0);
l9_441=l9_439;
float2 l9_442=float2(0.0);
l9_442=(l9_425*l9_438)+l9_441;
float2 l9_443=float2(0.0);
l9_443=l9_442+(l9_441*(l9_423.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_421=l9_443;
l9_424=l9_421;
}
else
{
float2 l9_444=float2(0.0);
float2 l9_445=float2(0.0);
float2 l9_446=float2(0.0);
float2 l9_447=float2(0.0);
float2 l9_448=float2(0.0);
ssGlobals l9_449=l9_423;
float2 l9_450;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_451=float2(0.0);
l9_451=l9_449.Surface_UVCoord0;
l9_445=l9_451;
l9_450=l9_445;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_452=float2(0.0);
l9_452=l9_449.Surface_UVCoord1;
l9_446=l9_452;
l9_450=l9_446;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_453=float2(0.0);
l9_453=l9_449.gScreenCoord;
l9_447=l9_453;
l9_450=l9_447;
}
else
{
float2 l9_454=float2(0.0);
l9_454=l9_449.Surface_UVCoord0;
l9_448=l9_454;
l9_450=l9_448;
}
}
}
l9_444=l9_450;
float2 l9_455=float2(0.0);
float2 l9_456=(*sc_set2.UserUniforms).uv2Scale;
l9_455=l9_456;
float2 l9_457=float2(0.0);
l9_457=l9_455;
float2 l9_458=float2(0.0);
float2 l9_459=(*sc_set2.UserUniforms).uv2Offset;
l9_458=l9_459;
float2 l9_460=float2(0.0);
l9_460=l9_458;
float2 l9_461=float2(0.0);
l9_461=(l9_444*l9_457)+l9_460;
l9_422=l9_461;
l9_424=l9_422;
}
l9_420=l9_424;
l9_416=l9_420;
l9_419=l9_416;
}
else
{
float2 l9_462=float2(0.0);
l9_462=l9_418.Surface_UVCoord0;
l9_417=l9_462;
l9_419=l9_417;
}
l9_415=l9_419;
float2 l9_463=float2(0.0);
l9_463=l9_415;
float2 l9_464=float2(0.0);
l9_464=l9_463;
l9_408=l9_464;
l9_412=l9_408;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_465=float2(0.0);
float2 l9_466=float2(0.0);
float2 l9_467=float2(0.0);
ssGlobals l9_468=l9_411;
float2 l9_469;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_470=float2(0.0);
float2 l9_471=float2(0.0);
float2 l9_472=float2(0.0);
ssGlobals l9_473=l9_468;
float2 l9_474;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_475=float2(0.0);
float2 l9_476=float2(0.0);
float2 l9_477=float2(0.0);
float2 l9_478=float2(0.0);
float2 l9_479=float2(0.0);
float2 l9_480=float2(0.0);
ssGlobals l9_481=l9_473;
float2 l9_482;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_483=float2(0.0);
l9_483=l9_481.Surface_UVCoord0;
l9_476=l9_483;
l9_482=l9_476;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_484=float2(0.0);
l9_484=l9_481.Surface_UVCoord1;
l9_477=l9_484;
l9_482=l9_477;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_485=float2(0.0);
l9_485=l9_481.gScreenCoord;
l9_478=l9_485;
l9_482=l9_478;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_486=float2(0.0);
float2 l9_487=float2(0.0);
float2 l9_488=float2(0.0);
ssGlobals l9_489=l9_481;
float2 l9_490;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_491=float2(0.0);
float2 l9_492=float2(0.0);
float2 l9_493=float2(0.0);
ssGlobals l9_494=l9_489;
float2 l9_495;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_496=float2(0.0);
float2 l9_497=float2(0.0);
float2 l9_498=float2(0.0);
float2 l9_499=float2(0.0);
float2 l9_500=float2(0.0);
ssGlobals l9_501=l9_494;
float2 l9_502;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_503=float2(0.0);
l9_503=l9_501.Surface_UVCoord0;
l9_497=l9_503;
l9_502=l9_497;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_504=float2(0.0);
l9_504=l9_501.Surface_UVCoord1;
l9_498=l9_504;
l9_502=l9_498;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_505=float2(0.0);
l9_505=l9_501.gScreenCoord;
l9_499=l9_505;
l9_502=l9_499;
}
else
{
float2 l9_506=float2(0.0);
l9_506=l9_501.Surface_UVCoord0;
l9_500=l9_506;
l9_502=l9_500;
}
}
}
l9_496=l9_502;
float2 l9_507=float2(0.0);
float2 l9_508=(*sc_set2.UserUniforms).uv2Scale;
l9_507=l9_508;
float2 l9_509=float2(0.0);
l9_509=l9_507;
float2 l9_510=float2(0.0);
float2 l9_511=(*sc_set2.UserUniforms).uv2Offset;
l9_510=l9_511;
float2 l9_512=float2(0.0);
l9_512=l9_510;
float2 l9_513=float2(0.0);
l9_513=(l9_496*l9_509)+l9_512;
float2 l9_514=float2(0.0);
l9_514=l9_513+(l9_512*(l9_494.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_492=l9_514;
l9_495=l9_492;
}
else
{
float2 l9_515=float2(0.0);
float2 l9_516=float2(0.0);
float2 l9_517=float2(0.0);
float2 l9_518=float2(0.0);
float2 l9_519=float2(0.0);
ssGlobals l9_520=l9_494;
float2 l9_521;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_522=float2(0.0);
l9_522=l9_520.Surface_UVCoord0;
l9_516=l9_522;
l9_521=l9_516;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_523=float2(0.0);
l9_523=l9_520.Surface_UVCoord1;
l9_517=l9_523;
l9_521=l9_517;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_524=float2(0.0);
l9_524=l9_520.gScreenCoord;
l9_518=l9_524;
l9_521=l9_518;
}
else
{
float2 l9_525=float2(0.0);
l9_525=l9_520.Surface_UVCoord0;
l9_519=l9_525;
l9_521=l9_519;
}
}
}
l9_515=l9_521;
float2 l9_526=float2(0.0);
float2 l9_527=(*sc_set2.UserUniforms).uv2Scale;
l9_526=l9_527;
float2 l9_528=float2(0.0);
l9_528=l9_526;
float2 l9_529=float2(0.0);
float2 l9_530=(*sc_set2.UserUniforms).uv2Offset;
l9_529=l9_530;
float2 l9_531=float2(0.0);
l9_531=l9_529;
float2 l9_532=float2(0.0);
l9_532=(l9_515*l9_528)+l9_531;
l9_493=l9_532;
l9_495=l9_493;
}
l9_491=l9_495;
l9_487=l9_491;
l9_490=l9_487;
}
else
{
float2 l9_533=float2(0.0);
l9_533=l9_489.Surface_UVCoord0;
l9_488=l9_533;
l9_490=l9_488;
}
l9_486=l9_490;
float2 l9_534=float2(0.0);
l9_534=l9_486;
float2 l9_535=float2(0.0);
l9_535=l9_534;
l9_479=l9_535;
l9_482=l9_479;
}
else
{
float2 l9_536=float2(0.0);
l9_536=l9_481.Surface_UVCoord0;
l9_480=l9_536;
l9_482=l9_480;
}
}
}
}
l9_475=l9_482;
float2 l9_537=float2(0.0);
float2 l9_538=(*sc_set2.UserUniforms).uv3Scale;
l9_537=l9_538;
float2 l9_539=float2(0.0);
l9_539=l9_537;
float2 l9_540=float2(0.0);
float2 l9_541=(*sc_set2.UserUniforms).uv3Offset;
l9_540=l9_541;
float2 l9_542=float2(0.0);
l9_542=l9_540;
float2 l9_543=float2(0.0);
l9_543=(l9_475*l9_539)+l9_542;
float2 l9_544=float2(0.0);
l9_544=l9_543+(l9_542*(l9_473.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_471=l9_544;
l9_474=l9_471;
}
else
{
float2 l9_545=float2(0.0);
float2 l9_546=float2(0.0);
float2 l9_547=float2(0.0);
float2 l9_548=float2(0.0);
float2 l9_549=float2(0.0);
float2 l9_550=float2(0.0);
ssGlobals l9_551=l9_473;
float2 l9_552;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_553=float2(0.0);
l9_553=l9_551.Surface_UVCoord0;
l9_546=l9_553;
l9_552=l9_546;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_554=float2(0.0);
l9_554=l9_551.Surface_UVCoord1;
l9_547=l9_554;
l9_552=l9_547;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_555=float2(0.0);
l9_555=l9_551.gScreenCoord;
l9_548=l9_555;
l9_552=l9_548;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_556=float2(0.0);
float2 l9_557=float2(0.0);
float2 l9_558=float2(0.0);
ssGlobals l9_559=l9_551;
float2 l9_560;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_561=float2(0.0);
float2 l9_562=float2(0.0);
float2 l9_563=float2(0.0);
ssGlobals l9_564=l9_559;
float2 l9_565;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_566=float2(0.0);
float2 l9_567=float2(0.0);
float2 l9_568=float2(0.0);
float2 l9_569=float2(0.0);
float2 l9_570=float2(0.0);
ssGlobals l9_571=l9_564;
float2 l9_572;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_573=float2(0.0);
l9_573=l9_571.Surface_UVCoord0;
l9_567=l9_573;
l9_572=l9_567;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_574=float2(0.0);
l9_574=l9_571.Surface_UVCoord1;
l9_568=l9_574;
l9_572=l9_568;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_575=float2(0.0);
l9_575=l9_571.gScreenCoord;
l9_569=l9_575;
l9_572=l9_569;
}
else
{
float2 l9_576=float2(0.0);
l9_576=l9_571.Surface_UVCoord0;
l9_570=l9_576;
l9_572=l9_570;
}
}
}
l9_566=l9_572;
float2 l9_577=float2(0.0);
float2 l9_578=(*sc_set2.UserUniforms).uv2Scale;
l9_577=l9_578;
float2 l9_579=float2(0.0);
l9_579=l9_577;
float2 l9_580=float2(0.0);
float2 l9_581=(*sc_set2.UserUniforms).uv2Offset;
l9_580=l9_581;
float2 l9_582=float2(0.0);
l9_582=l9_580;
float2 l9_583=float2(0.0);
l9_583=(l9_566*l9_579)+l9_582;
float2 l9_584=float2(0.0);
l9_584=l9_583+(l9_582*(l9_564.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_562=l9_584;
l9_565=l9_562;
}
else
{
float2 l9_585=float2(0.0);
float2 l9_586=float2(0.0);
float2 l9_587=float2(0.0);
float2 l9_588=float2(0.0);
float2 l9_589=float2(0.0);
ssGlobals l9_590=l9_564;
float2 l9_591;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_592=float2(0.0);
l9_592=l9_590.Surface_UVCoord0;
l9_586=l9_592;
l9_591=l9_586;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_593=float2(0.0);
l9_593=l9_590.Surface_UVCoord1;
l9_587=l9_593;
l9_591=l9_587;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_594=float2(0.0);
l9_594=l9_590.gScreenCoord;
l9_588=l9_594;
l9_591=l9_588;
}
else
{
float2 l9_595=float2(0.0);
l9_595=l9_590.Surface_UVCoord0;
l9_589=l9_595;
l9_591=l9_589;
}
}
}
l9_585=l9_591;
float2 l9_596=float2(0.0);
float2 l9_597=(*sc_set2.UserUniforms).uv2Scale;
l9_596=l9_597;
float2 l9_598=float2(0.0);
l9_598=l9_596;
float2 l9_599=float2(0.0);
float2 l9_600=(*sc_set2.UserUniforms).uv2Offset;
l9_599=l9_600;
float2 l9_601=float2(0.0);
l9_601=l9_599;
float2 l9_602=float2(0.0);
l9_602=(l9_585*l9_598)+l9_601;
l9_563=l9_602;
l9_565=l9_563;
}
l9_561=l9_565;
l9_557=l9_561;
l9_560=l9_557;
}
else
{
float2 l9_603=float2(0.0);
l9_603=l9_559.Surface_UVCoord0;
l9_558=l9_603;
l9_560=l9_558;
}
l9_556=l9_560;
float2 l9_604=float2(0.0);
l9_604=l9_556;
float2 l9_605=float2(0.0);
l9_605=l9_604;
l9_549=l9_605;
l9_552=l9_549;
}
else
{
float2 l9_606=float2(0.0);
l9_606=l9_551.Surface_UVCoord0;
l9_550=l9_606;
l9_552=l9_550;
}
}
}
}
l9_545=l9_552;
float2 l9_607=float2(0.0);
float2 l9_608=(*sc_set2.UserUniforms).uv3Scale;
l9_607=l9_608;
float2 l9_609=float2(0.0);
l9_609=l9_607;
float2 l9_610=float2(0.0);
float2 l9_611=(*sc_set2.UserUniforms).uv3Offset;
l9_610=l9_611;
float2 l9_612=float2(0.0);
l9_612=l9_610;
float2 l9_613=float2(0.0);
l9_613=(l9_545*l9_609)+l9_612;
l9_472=l9_613;
l9_474=l9_472;
}
l9_470=l9_474;
l9_466=l9_470;
l9_469=l9_466;
}
else
{
float2 l9_614=float2(0.0);
l9_614=l9_468.Surface_UVCoord0;
l9_467=l9_614;
l9_469=l9_467;
}
l9_465=l9_469;
float2 l9_615=float2(0.0);
l9_615=l9_465;
float2 l9_616=float2(0.0);
l9_616=l9_615;
l9_409=l9_616;
l9_412=l9_409;
}
else
{
float2 l9_617=float2(0.0);
l9_617=l9_411.Surface_UVCoord0;
l9_410=l9_617;
l9_412=l9_410;
}
}
}
}
l9_405=l9_412;
float4 l9_618=float4(0.0);
int l9_619=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_620=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_620=0;
}
else
{
l9_620=in.varStereoViewID;
}
int l9_621=l9_620;
l9_619=1-l9_621;
}
else
{
int l9_622=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_622=0;
}
else
{
l9_622=in.varStereoViewID;
}
int l9_623=l9_622;
l9_619=l9_623;
}
int l9_624=l9_619;
int l9_625=baseTexLayout_tmp;
int l9_626=l9_624;
float2 l9_627=l9_405;
bool l9_628=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_629=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_630=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_631=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_632=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_633=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_634=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_635=0.0;
bool l9_636=l9_633&&(!l9_631);
float l9_637=1.0;
float l9_638=l9_627.x;
int l9_639=l9_630.x;
if (l9_639==1)
{
l9_638=fract(l9_638);
}
else
{
if (l9_639==2)
{
float l9_640=fract(l9_638);
float l9_641=l9_638-l9_640;
float l9_642=step(0.25,fract(l9_641*0.5));
l9_638=mix(l9_640,1.0-l9_640,fast::clamp(l9_642,0.0,1.0));
}
}
l9_627.x=l9_638;
float l9_643=l9_627.y;
int l9_644=l9_630.y;
if (l9_644==1)
{
l9_643=fract(l9_643);
}
else
{
if (l9_644==2)
{
float l9_645=fract(l9_643);
float l9_646=l9_643-l9_645;
float l9_647=step(0.25,fract(l9_646*0.5));
l9_643=mix(l9_645,1.0-l9_645,fast::clamp(l9_647,0.0,1.0));
}
}
l9_627.y=l9_643;
if (l9_631)
{
bool l9_648=l9_633;
bool l9_649;
if (l9_648)
{
l9_649=l9_630.x==3;
}
else
{
l9_649=l9_648;
}
float l9_650=l9_627.x;
float l9_651=l9_632.x;
float l9_652=l9_632.z;
bool l9_653=l9_649;
float l9_654=l9_637;
float l9_655=fast::clamp(l9_650,l9_651,l9_652);
float l9_656=step(abs(l9_650-l9_655),9.9999997e-06);
l9_654*=(l9_656+((1.0-float(l9_653))*(1.0-l9_656)));
l9_650=l9_655;
l9_627.x=l9_650;
l9_637=l9_654;
bool l9_657=l9_633;
bool l9_658;
if (l9_657)
{
l9_658=l9_630.y==3;
}
else
{
l9_658=l9_657;
}
float l9_659=l9_627.y;
float l9_660=l9_632.y;
float l9_661=l9_632.w;
bool l9_662=l9_658;
float l9_663=l9_637;
float l9_664=fast::clamp(l9_659,l9_660,l9_661);
float l9_665=step(abs(l9_659-l9_664),9.9999997e-06);
l9_663*=(l9_665+((1.0-float(l9_662))*(1.0-l9_665)));
l9_659=l9_664;
l9_627.y=l9_659;
l9_637=l9_663;
}
float2 l9_666=l9_627;
bool l9_667=l9_628;
float3x3 l9_668=l9_629;
if (l9_667)
{
l9_666=float2((l9_668*float3(l9_666,1.0)).xy);
}
float2 l9_669=l9_666;
float2 l9_670=l9_669;
float2 l9_671=l9_670;
l9_627=l9_671;
float l9_672=l9_627.x;
int l9_673=l9_630.x;
bool l9_674=l9_636;
float l9_675=l9_637;
if ((l9_673==0)||(l9_673==3))
{
float l9_676=l9_672;
float l9_677=0.0;
float l9_678=1.0;
bool l9_679=l9_674;
float l9_680=l9_675;
float l9_681=fast::clamp(l9_676,l9_677,l9_678);
float l9_682=step(abs(l9_676-l9_681),9.9999997e-06);
l9_680*=(l9_682+((1.0-float(l9_679))*(1.0-l9_682)));
l9_676=l9_681;
l9_672=l9_676;
l9_675=l9_680;
}
l9_627.x=l9_672;
l9_637=l9_675;
float l9_683=l9_627.y;
int l9_684=l9_630.y;
bool l9_685=l9_636;
float l9_686=l9_637;
if ((l9_684==0)||(l9_684==3))
{
float l9_687=l9_683;
float l9_688=0.0;
float l9_689=1.0;
bool l9_690=l9_685;
float l9_691=l9_686;
float l9_692=fast::clamp(l9_687,l9_688,l9_689);
float l9_693=step(abs(l9_687-l9_692),9.9999997e-06);
l9_691*=(l9_693+((1.0-float(l9_690))*(1.0-l9_693)));
l9_687=l9_692;
l9_683=l9_687;
l9_686=l9_691;
}
l9_627.y=l9_683;
l9_637=l9_686;
float2 l9_694=l9_627;
int l9_695=l9_625;
int l9_696=l9_626;
float l9_697=l9_635;
float2 l9_698=l9_694;
int l9_699=l9_695;
int l9_700=l9_696;
float3 l9_701=float3(0.0);
if (l9_699==0)
{
l9_701=float3(l9_698,0.0);
}
else
{
if (l9_699==1)
{
l9_701=float3(l9_698.x,(l9_698.y*0.5)+(0.5-(float(l9_700)*0.5)),0.0);
}
else
{
l9_701=float3(l9_698,float(l9_700));
}
}
float3 l9_702=l9_701;
float3 l9_703=l9_702;
float2 l9_704=l9_703.xy;
float l9_705=l9_697;
float4 l9_706=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_704,bias(l9_705));
float4 l9_707=l9_706;
float4 l9_708=l9_707;
if (l9_633)
{
l9_708=mix(l9_634,l9_708,float4(l9_637));
}
float4 l9_709=l9_708;
l9_618=l9_709;
l9_401=l9_618;
l9_404=l9_401;
}
else
{
l9_404=l9_402;
}
l9_400=l9_404;
float4 l9_710=float4(0.0);
l9_710=l9_399*l9_400;
float4 l9_711=float4(0.0);
l9_711=l9_710;
float4 l9_712=float4(0.0);
l9_712=l9_711;
l9_26=l9_712.xyz;
l9_28=l9_26;
}
l9_24=l9_28;
float3 l9_713=float3(0.0);
l9_713=l9_24;
float3 l9_714=float3(0.0);
l9_714=l9_713;
float4 l9_715=float4(0.0);
l9_715=float4(l9_714.x,l9_714.y,l9_714.z,l9_715.w);
l9_715.w=(*sc_set2.UserUniforms).Port_Value2_N073;
float4 l9_716=float4(0.0);
l9_716=l9_23*l9_715;
param=l9_716;
param_2=param;
}
else
{
float3 l9_717=float3(0.0);
float3 l9_718=float3(0.0);
float3 l9_719=float3(0.0);
ssGlobals l9_720=param_3;
float3 l9_721;
if ((int(ENABLE_RECOLOR_tmp)!=0))
{
float3 l9_722=float3(0.0);
float3 l9_723=(*sc_set2.UserUniforms).recolorRed;
l9_722=l9_723;
float3 l9_724=float3(0.0);
l9_724=l9_722;
float2 l9_725=float2(0.0);
l9_725=l9_720.Surface_UVCoord0;
float l9_726=0.0;
float4 l9_727=float4(l9_725,0.0,0.0);
float l9_728=l9_727.y;
l9_726=l9_728;
float4 l9_729=float4(0.0);
float4 l9_730=(*sc_set2.UserUniforms).Tweak_N81;
l9_729=l9_730;
float4 l9_731=float4(0.0);
float4 l9_732=(*sc_set2.UserUniforms).baseColor;
l9_731=l9_732;
float4 l9_733=float4(0.0);
float l9_734=l9_726;
float4 l9_735=l9_729;
float l9_736=(*sc_set2.UserUniforms).Port_Position1_N078;
float4 l9_737=l9_729;
float4 l9_738=l9_731;
l9_734=fast::clamp(l9_734,0.0,1.0);
float4 l9_739;
if (l9_734<l9_736)
{
l9_739=mix(l9_735,l9_737,float4(fast::clamp(l9_734/l9_736,0.0,1.0)));
}
else
{
l9_739=mix(l9_737,l9_738,float4(fast::clamp((l9_734-l9_736)/(1.0-l9_736),0.0,1.0)));
}
bool l9_740=(*sc_set2.UserUniforms).PreviewEnabled==1;
bool l9_741;
if (l9_740)
{
l9_741=!PreviewInfo.Saved;
}
else
{
l9_741=l9_740;
}
bool l9_742;
if (l9_741)
{
l9_742=78==(*sc_set2.UserUniforms).PreviewNodeID;
}
else
{
l9_742=l9_741;
}
if (l9_742)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_739;
PreviewInfo.Color.w=1.0;
}
l9_733=l9_739;
float4 l9_743=float4(0.0);
l9_743=l9_733;
float4 l9_744=float4(0.0);
float4 l9_745=float4(0.0);
float4 l9_746=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_747=l9_720;
float4 l9_748;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_749=float2(0.0);
float2 l9_750=float2(0.0);
float2 l9_751=float2(0.0);
float2 l9_752=float2(0.0);
float2 l9_753=float2(0.0);
float2 l9_754=float2(0.0);
ssGlobals l9_755=l9_747;
float2 l9_756;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_757=float2(0.0);
l9_757=l9_755.Surface_UVCoord0;
l9_750=l9_757;
l9_756=l9_750;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_758=float2(0.0);
l9_758=l9_755.Surface_UVCoord1;
l9_751=l9_758;
l9_756=l9_751;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_759=float2(0.0);
float2 l9_760=float2(0.0);
float2 l9_761=float2(0.0);
ssGlobals l9_762=l9_755;
float2 l9_763;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_764=float2(0.0);
float2 l9_765=float2(0.0);
float2 l9_766=float2(0.0);
ssGlobals l9_767=l9_762;
float2 l9_768;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_769=float2(0.0);
float2 l9_770=float2(0.0);
float2 l9_771=float2(0.0);
float2 l9_772=float2(0.0);
float2 l9_773=float2(0.0);
ssGlobals l9_774=l9_767;
float2 l9_775;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_776=float2(0.0);
l9_776=l9_774.Surface_UVCoord0;
l9_770=l9_776;
l9_775=l9_770;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_777=float2(0.0);
l9_777=l9_774.Surface_UVCoord1;
l9_771=l9_777;
l9_775=l9_771;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_778=float2(0.0);
l9_778=l9_774.gScreenCoord;
l9_772=l9_778;
l9_775=l9_772;
}
else
{
float2 l9_779=float2(0.0);
l9_779=l9_774.Surface_UVCoord0;
l9_773=l9_779;
l9_775=l9_773;
}
}
}
l9_769=l9_775;
float2 l9_780=float2(0.0);
float2 l9_781=(*sc_set2.UserUniforms).uv2Scale;
l9_780=l9_781;
float2 l9_782=float2(0.0);
l9_782=l9_780;
float2 l9_783=float2(0.0);
float2 l9_784=(*sc_set2.UserUniforms).uv2Offset;
l9_783=l9_784;
float2 l9_785=float2(0.0);
l9_785=l9_783;
float2 l9_786=float2(0.0);
l9_786=(l9_769*l9_782)+l9_785;
float2 l9_787=float2(0.0);
l9_787=l9_786+(l9_785*(l9_767.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_765=l9_787;
l9_768=l9_765;
}
else
{
float2 l9_788=float2(0.0);
float2 l9_789=float2(0.0);
float2 l9_790=float2(0.0);
float2 l9_791=float2(0.0);
float2 l9_792=float2(0.0);
ssGlobals l9_793=l9_767;
float2 l9_794;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_795=float2(0.0);
l9_795=l9_793.Surface_UVCoord0;
l9_789=l9_795;
l9_794=l9_789;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_796=float2(0.0);
l9_796=l9_793.Surface_UVCoord1;
l9_790=l9_796;
l9_794=l9_790;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_797=float2(0.0);
l9_797=l9_793.gScreenCoord;
l9_791=l9_797;
l9_794=l9_791;
}
else
{
float2 l9_798=float2(0.0);
l9_798=l9_793.Surface_UVCoord0;
l9_792=l9_798;
l9_794=l9_792;
}
}
}
l9_788=l9_794;
float2 l9_799=float2(0.0);
float2 l9_800=(*sc_set2.UserUniforms).uv2Scale;
l9_799=l9_800;
float2 l9_801=float2(0.0);
l9_801=l9_799;
float2 l9_802=float2(0.0);
float2 l9_803=(*sc_set2.UserUniforms).uv2Offset;
l9_802=l9_803;
float2 l9_804=float2(0.0);
l9_804=l9_802;
float2 l9_805=float2(0.0);
l9_805=(l9_788*l9_801)+l9_804;
l9_766=l9_805;
l9_768=l9_766;
}
l9_764=l9_768;
l9_760=l9_764;
l9_763=l9_760;
}
else
{
float2 l9_806=float2(0.0);
l9_806=l9_762.Surface_UVCoord0;
l9_761=l9_806;
l9_763=l9_761;
}
l9_759=l9_763;
float2 l9_807=float2(0.0);
l9_807=l9_759;
float2 l9_808=float2(0.0);
l9_808=l9_807;
l9_752=l9_808;
l9_756=l9_752;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_809=float2(0.0);
float2 l9_810=float2(0.0);
float2 l9_811=float2(0.0);
ssGlobals l9_812=l9_755;
float2 l9_813;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_814=float2(0.0);
float2 l9_815=float2(0.0);
float2 l9_816=float2(0.0);
ssGlobals l9_817=l9_812;
float2 l9_818;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_819=float2(0.0);
float2 l9_820=float2(0.0);
float2 l9_821=float2(0.0);
float2 l9_822=float2(0.0);
float2 l9_823=float2(0.0);
float2 l9_824=float2(0.0);
ssGlobals l9_825=l9_817;
float2 l9_826;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_827=float2(0.0);
l9_827=l9_825.Surface_UVCoord0;
l9_820=l9_827;
l9_826=l9_820;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_828=float2(0.0);
l9_828=l9_825.Surface_UVCoord1;
l9_821=l9_828;
l9_826=l9_821;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_829=float2(0.0);
l9_829=l9_825.gScreenCoord;
l9_822=l9_829;
l9_826=l9_822;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_830=float2(0.0);
float2 l9_831=float2(0.0);
float2 l9_832=float2(0.0);
ssGlobals l9_833=l9_825;
float2 l9_834;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_835=float2(0.0);
float2 l9_836=float2(0.0);
float2 l9_837=float2(0.0);
ssGlobals l9_838=l9_833;
float2 l9_839;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_840=float2(0.0);
float2 l9_841=float2(0.0);
float2 l9_842=float2(0.0);
float2 l9_843=float2(0.0);
float2 l9_844=float2(0.0);
ssGlobals l9_845=l9_838;
float2 l9_846;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_847=float2(0.0);
l9_847=l9_845.Surface_UVCoord0;
l9_841=l9_847;
l9_846=l9_841;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_848=float2(0.0);
l9_848=l9_845.Surface_UVCoord1;
l9_842=l9_848;
l9_846=l9_842;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_849=float2(0.0);
l9_849=l9_845.gScreenCoord;
l9_843=l9_849;
l9_846=l9_843;
}
else
{
float2 l9_850=float2(0.0);
l9_850=l9_845.Surface_UVCoord0;
l9_844=l9_850;
l9_846=l9_844;
}
}
}
l9_840=l9_846;
float2 l9_851=float2(0.0);
float2 l9_852=(*sc_set2.UserUniforms).uv2Scale;
l9_851=l9_852;
float2 l9_853=float2(0.0);
l9_853=l9_851;
float2 l9_854=float2(0.0);
float2 l9_855=(*sc_set2.UserUniforms).uv2Offset;
l9_854=l9_855;
float2 l9_856=float2(0.0);
l9_856=l9_854;
float2 l9_857=float2(0.0);
l9_857=(l9_840*l9_853)+l9_856;
float2 l9_858=float2(0.0);
l9_858=l9_857+(l9_856*(l9_838.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_836=l9_858;
l9_839=l9_836;
}
else
{
float2 l9_859=float2(0.0);
float2 l9_860=float2(0.0);
float2 l9_861=float2(0.0);
float2 l9_862=float2(0.0);
float2 l9_863=float2(0.0);
ssGlobals l9_864=l9_838;
float2 l9_865;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_866=float2(0.0);
l9_866=l9_864.Surface_UVCoord0;
l9_860=l9_866;
l9_865=l9_860;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_867=float2(0.0);
l9_867=l9_864.Surface_UVCoord1;
l9_861=l9_867;
l9_865=l9_861;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_868=float2(0.0);
l9_868=l9_864.gScreenCoord;
l9_862=l9_868;
l9_865=l9_862;
}
else
{
float2 l9_869=float2(0.0);
l9_869=l9_864.Surface_UVCoord0;
l9_863=l9_869;
l9_865=l9_863;
}
}
}
l9_859=l9_865;
float2 l9_870=float2(0.0);
float2 l9_871=(*sc_set2.UserUniforms).uv2Scale;
l9_870=l9_871;
float2 l9_872=float2(0.0);
l9_872=l9_870;
float2 l9_873=float2(0.0);
float2 l9_874=(*sc_set2.UserUniforms).uv2Offset;
l9_873=l9_874;
float2 l9_875=float2(0.0);
l9_875=l9_873;
float2 l9_876=float2(0.0);
l9_876=(l9_859*l9_872)+l9_875;
l9_837=l9_876;
l9_839=l9_837;
}
l9_835=l9_839;
l9_831=l9_835;
l9_834=l9_831;
}
else
{
float2 l9_877=float2(0.0);
l9_877=l9_833.Surface_UVCoord0;
l9_832=l9_877;
l9_834=l9_832;
}
l9_830=l9_834;
float2 l9_878=float2(0.0);
l9_878=l9_830;
float2 l9_879=float2(0.0);
l9_879=l9_878;
l9_823=l9_879;
l9_826=l9_823;
}
else
{
float2 l9_880=float2(0.0);
l9_880=l9_825.Surface_UVCoord0;
l9_824=l9_880;
l9_826=l9_824;
}
}
}
}
l9_819=l9_826;
float2 l9_881=float2(0.0);
float2 l9_882=(*sc_set2.UserUniforms).uv3Scale;
l9_881=l9_882;
float2 l9_883=float2(0.0);
l9_883=l9_881;
float2 l9_884=float2(0.0);
float2 l9_885=(*sc_set2.UserUniforms).uv3Offset;
l9_884=l9_885;
float2 l9_886=float2(0.0);
l9_886=l9_884;
float2 l9_887=float2(0.0);
l9_887=(l9_819*l9_883)+l9_886;
float2 l9_888=float2(0.0);
l9_888=l9_887+(l9_886*(l9_817.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_815=l9_888;
l9_818=l9_815;
}
else
{
float2 l9_889=float2(0.0);
float2 l9_890=float2(0.0);
float2 l9_891=float2(0.0);
float2 l9_892=float2(0.0);
float2 l9_893=float2(0.0);
float2 l9_894=float2(0.0);
ssGlobals l9_895=l9_817;
float2 l9_896;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_897=float2(0.0);
l9_897=l9_895.Surface_UVCoord0;
l9_890=l9_897;
l9_896=l9_890;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_898=float2(0.0);
l9_898=l9_895.Surface_UVCoord1;
l9_891=l9_898;
l9_896=l9_891;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_899=float2(0.0);
l9_899=l9_895.gScreenCoord;
l9_892=l9_899;
l9_896=l9_892;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_900=float2(0.0);
float2 l9_901=float2(0.0);
float2 l9_902=float2(0.0);
ssGlobals l9_903=l9_895;
float2 l9_904;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_905=float2(0.0);
float2 l9_906=float2(0.0);
float2 l9_907=float2(0.0);
ssGlobals l9_908=l9_903;
float2 l9_909;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_910=float2(0.0);
float2 l9_911=float2(0.0);
float2 l9_912=float2(0.0);
float2 l9_913=float2(0.0);
float2 l9_914=float2(0.0);
ssGlobals l9_915=l9_908;
float2 l9_916;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_917=float2(0.0);
l9_917=l9_915.Surface_UVCoord0;
l9_911=l9_917;
l9_916=l9_911;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_918=float2(0.0);
l9_918=l9_915.Surface_UVCoord1;
l9_912=l9_918;
l9_916=l9_912;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_919=float2(0.0);
l9_919=l9_915.gScreenCoord;
l9_913=l9_919;
l9_916=l9_913;
}
else
{
float2 l9_920=float2(0.0);
l9_920=l9_915.Surface_UVCoord0;
l9_914=l9_920;
l9_916=l9_914;
}
}
}
l9_910=l9_916;
float2 l9_921=float2(0.0);
float2 l9_922=(*sc_set2.UserUniforms).uv2Scale;
l9_921=l9_922;
float2 l9_923=float2(0.0);
l9_923=l9_921;
float2 l9_924=float2(0.0);
float2 l9_925=(*sc_set2.UserUniforms).uv2Offset;
l9_924=l9_925;
float2 l9_926=float2(0.0);
l9_926=l9_924;
float2 l9_927=float2(0.0);
l9_927=(l9_910*l9_923)+l9_926;
float2 l9_928=float2(0.0);
l9_928=l9_927+(l9_926*(l9_908.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_906=l9_928;
l9_909=l9_906;
}
else
{
float2 l9_929=float2(0.0);
float2 l9_930=float2(0.0);
float2 l9_931=float2(0.0);
float2 l9_932=float2(0.0);
float2 l9_933=float2(0.0);
ssGlobals l9_934=l9_908;
float2 l9_935;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_936=float2(0.0);
l9_936=l9_934.Surface_UVCoord0;
l9_930=l9_936;
l9_935=l9_930;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_937=float2(0.0);
l9_937=l9_934.Surface_UVCoord1;
l9_931=l9_937;
l9_935=l9_931;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_938=float2(0.0);
l9_938=l9_934.gScreenCoord;
l9_932=l9_938;
l9_935=l9_932;
}
else
{
float2 l9_939=float2(0.0);
l9_939=l9_934.Surface_UVCoord0;
l9_933=l9_939;
l9_935=l9_933;
}
}
}
l9_929=l9_935;
float2 l9_940=float2(0.0);
float2 l9_941=(*sc_set2.UserUniforms).uv2Scale;
l9_940=l9_941;
float2 l9_942=float2(0.0);
l9_942=l9_940;
float2 l9_943=float2(0.0);
float2 l9_944=(*sc_set2.UserUniforms).uv2Offset;
l9_943=l9_944;
float2 l9_945=float2(0.0);
l9_945=l9_943;
float2 l9_946=float2(0.0);
l9_946=(l9_929*l9_942)+l9_945;
l9_907=l9_946;
l9_909=l9_907;
}
l9_905=l9_909;
l9_901=l9_905;
l9_904=l9_901;
}
else
{
float2 l9_947=float2(0.0);
l9_947=l9_903.Surface_UVCoord0;
l9_902=l9_947;
l9_904=l9_902;
}
l9_900=l9_904;
float2 l9_948=float2(0.0);
l9_948=l9_900;
float2 l9_949=float2(0.0);
l9_949=l9_948;
l9_893=l9_949;
l9_896=l9_893;
}
else
{
float2 l9_950=float2(0.0);
l9_950=l9_895.Surface_UVCoord0;
l9_894=l9_950;
l9_896=l9_894;
}
}
}
}
l9_889=l9_896;
float2 l9_951=float2(0.0);
float2 l9_952=(*sc_set2.UserUniforms).uv3Scale;
l9_951=l9_952;
float2 l9_953=float2(0.0);
l9_953=l9_951;
float2 l9_954=float2(0.0);
float2 l9_955=(*sc_set2.UserUniforms).uv3Offset;
l9_954=l9_955;
float2 l9_956=float2(0.0);
l9_956=l9_954;
float2 l9_957=float2(0.0);
l9_957=(l9_889*l9_953)+l9_956;
l9_816=l9_957;
l9_818=l9_816;
}
l9_814=l9_818;
l9_810=l9_814;
l9_813=l9_810;
}
else
{
float2 l9_958=float2(0.0);
l9_958=l9_812.Surface_UVCoord0;
l9_811=l9_958;
l9_813=l9_811;
}
l9_809=l9_813;
float2 l9_959=float2(0.0);
l9_959=l9_809;
float2 l9_960=float2(0.0);
l9_960=l9_959;
l9_753=l9_960;
l9_756=l9_753;
}
else
{
float2 l9_961=float2(0.0);
l9_961=l9_755.Surface_UVCoord0;
l9_754=l9_961;
l9_756=l9_754;
}
}
}
}
l9_749=l9_756;
float4 l9_962=float4(0.0);
int l9_963=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_964=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_964=0;
}
else
{
l9_964=in.varStereoViewID;
}
int l9_965=l9_964;
l9_963=1-l9_965;
}
else
{
int l9_966=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_966=0;
}
else
{
l9_966=in.varStereoViewID;
}
int l9_967=l9_966;
l9_963=l9_967;
}
int l9_968=l9_963;
int l9_969=baseTexLayout_tmp;
int l9_970=l9_968;
float2 l9_971=l9_749;
bool l9_972=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_973=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_974=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_975=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_976=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_977=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_978=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_979=0.0;
bool l9_980=l9_977&&(!l9_975);
float l9_981=1.0;
float l9_982=l9_971.x;
int l9_983=l9_974.x;
if (l9_983==1)
{
l9_982=fract(l9_982);
}
else
{
if (l9_983==2)
{
float l9_984=fract(l9_982);
float l9_985=l9_982-l9_984;
float l9_986=step(0.25,fract(l9_985*0.5));
l9_982=mix(l9_984,1.0-l9_984,fast::clamp(l9_986,0.0,1.0));
}
}
l9_971.x=l9_982;
float l9_987=l9_971.y;
int l9_988=l9_974.y;
if (l9_988==1)
{
l9_987=fract(l9_987);
}
else
{
if (l9_988==2)
{
float l9_989=fract(l9_987);
float l9_990=l9_987-l9_989;
float l9_991=step(0.25,fract(l9_990*0.5));
l9_987=mix(l9_989,1.0-l9_989,fast::clamp(l9_991,0.0,1.0));
}
}
l9_971.y=l9_987;
if (l9_975)
{
bool l9_992=l9_977;
bool l9_993;
if (l9_992)
{
l9_993=l9_974.x==3;
}
else
{
l9_993=l9_992;
}
float l9_994=l9_971.x;
float l9_995=l9_976.x;
float l9_996=l9_976.z;
bool l9_997=l9_993;
float l9_998=l9_981;
float l9_999=fast::clamp(l9_994,l9_995,l9_996);
float l9_1000=step(abs(l9_994-l9_999),9.9999997e-06);
l9_998*=(l9_1000+((1.0-float(l9_997))*(1.0-l9_1000)));
l9_994=l9_999;
l9_971.x=l9_994;
l9_981=l9_998;
bool l9_1001=l9_977;
bool l9_1002;
if (l9_1001)
{
l9_1002=l9_974.y==3;
}
else
{
l9_1002=l9_1001;
}
float l9_1003=l9_971.y;
float l9_1004=l9_976.y;
float l9_1005=l9_976.w;
bool l9_1006=l9_1002;
float l9_1007=l9_981;
float l9_1008=fast::clamp(l9_1003,l9_1004,l9_1005);
float l9_1009=step(abs(l9_1003-l9_1008),9.9999997e-06);
l9_1007*=(l9_1009+((1.0-float(l9_1006))*(1.0-l9_1009)));
l9_1003=l9_1008;
l9_971.y=l9_1003;
l9_981=l9_1007;
}
float2 l9_1010=l9_971;
bool l9_1011=l9_972;
float3x3 l9_1012=l9_973;
if (l9_1011)
{
l9_1010=float2((l9_1012*float3(l9_1010,1.0)).xy);
}
float2 l9_1013=l9_1010;
float2 l9_1014=l9_1013;
float2 l9_1015=l9_1014;
l9_971=l9_1015;
float l9_1016=l9_971.x;
int l9_1017=l9_974.x;
bool l9_1018=l9_980;
float l9_1019=l9_981;
if ((l9_1017==0)||(l9_1017==3))
{
float l9_1020=l9_1016;
float l9_1021=0.0;
float l9_1022=1.0;
bool l9_1023=l9_1018;
float l9_1024=l9_1019;
float l9_1025=fast::clamp(l9_1020,l9_1021,l9_1022);
float l9_1026=step(abs(l9_1020-l9_1025),9.9999997e-06);
l9_1024*=(l9_1026+((1.0-float(l9_1023))*(1.0-l9_1026)));
l9_1020=l9_1025;
l9_1016=l9_1020;
l9_1019=l9_1024;
}
l9_971.x=l9_1016;
l9_981=l9_1019;
float l9_1027=l9_971.y;
int l9_1028=l9_974.y;
bool l9_1029=l9_980;
float l9_1030=l9_981;
if ((l9_1028==0)||(l9_1028==3))
{
float l9_1031=l9_1027;
float l9_1032=0.0;
float l9_1033=1.0;
bool l9_1034=l9_1029;
float l9_1035=l9_1030;
float l9_1036=fast::clamp(l9_1031,l9_1032,l9_1033);
float l9_1037=step(abs(l9_1031-l9_1036),9.9999997e-06);
l9_1035*=(l9_1037+((1.0-float(l9_1034))*(1.0-l9_1037)));
l9_1031=l9_1036;
l9_1027=l9_1031;
l9_1030=l9_1035;
}
l9_971.y=l9_1027;
l9_981=l9_1030;
float2 l9_1038=l9_971;
int l9_1039=l9_969;
int l9_1040=l9_970;
float l9_1041=l9_979;
float2 l9_1042=l9_1038;
int l9_1043=l9_1039;
int l9_1044=l9_1040;
float3 l9_1045=float3(0.0);
if (l9_1043==0)
{
l9_1045=float3(l9_1042,0.0);
}
else
{
if (l9_1043==1)
{
l9_1045=float3(l9_1042.x,(l9_1042.y*0.5)+(0.5-(float(l9_1044)*0.5)),0.0);
}
else
{
l9_1045=float3(l9_1042,float(l9_1044));
}
}
float3 l9_1046=l9_1045;
float3 l9_1047=l9_1046;
float2 l9_1048=l9_1047.xy;
float l9_1049=l9_1041;
float4 l9_1050=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1048,bias(l9_1049));
float4 l9_1051=l9_1050;
float4 l9_1052=l9_1051;
if (l9_977)
{
l9_1052=mix(l9_978,l9_1052,float4(l9_981));
}
float4 l9_1053=l9_1052;
l9_962=l9_1053;
l9_745=l9_962;
l9_748=l9_745;
}
else
{
l9_748=l9_746;
}
l9_744=l9_748;
float4 l9_1054=float4(0.0);
l9_1054=l9_743*l9_744;
float4 l9_1055=float4(0.0);
l9_1055=l9_1054;
float4 l9_1056=float4(0.0);
l9_1056=l9_1055;
float l9_1057=0.0;
float l9_1058=0.0;
float l9_1059=0.0;
float3 l9_1060=l9_1056.xyz;
float l9_1061=l9_1060.x;
float l9_1062=l9_1060.y;
float l9_1063=l9_1060.z;
l9_1057=l9_1061;
l9_1058=l9_1062;
l9_1059=l9_1063;
float3 l9_1064=float3(0.0);
l9_1064=l9_724*float3(l9_1057);
float3 l9_1065=float3(0.0);
float3 l9_1066=(*sc_set2.UserUniforms).recolorGreen;
l9_1065=l9_1066;
float3 l9_1067=float3(0.0);
l9_1067=l9_1065;
float3 l9_1068=float3(0.0);
l9_1068=l9_1067*float3(l9_1058);
float3 l9_1069=float3(0.0);
float3 l9_1070=(*sc_set2.UserUniforms).recolorBlue;
l9_1069=l9_1070;
float3 l9_1071=float3(0.0);
l9_1071=l9_1069;
float3 l9_1072=float3(0.0);
l9_1072=l9_1071*float3(l9_1059);
float3 l9_1073=float3(0.0);
l9_1073=(l9_1064+l9_1068)+l9_1072;
l9_718=l9_1073;
l9_721=l9_718;
}
else
{
float2 l9_1074=float2(0.0);
l9_1074=l9_720.Surface_UVCoord0;
float l9_1075=0.0;
float4 l9_1076=float4(l9_1074,0.0,0.0);
float l9_1077=l9_1076.y;
l9_1075=l9_1077;
float4 l9_1078=float4(0.0);
float4 l9_1079=(*sc_set2.UserUniforms).Tweak_N81;
l9_1078=l9_1079;
float4 l9_1080=float4(0.0);
float4 l9_1081=(*sc_set2.UserUniforms).baseColor;
l9_1080=l9_1081;
float4 l9_1082=float4(0.0);
float l9_1083=l9_1075;
float4 l9_1084=l9_1078;
float l9_1085=(*sc_set2.UserUniforms).Port_Position1_N078;
float4 l9_1086=l9_1078;
float4 l9_1087=l9_1080;
l9_1083=fast::clamp(l9_1083,0.0,1.0);
float4 l9_1088;
if (l9_1083<l9_1085)
{
l9_1088=mix(l9_1084,l9_1086,float4(fast::clamp(l9_1083/l9_1085,0.0,1.0)));
}
else
{
l9_1088=mix(l9_1086,l9_1087,float4(fast::clamp((l9_1083-l9_1085)/(1.0-l9_1085),0.0,1.0)));
}
bool l9_1089=(*sc_set2.UserUniforms).PreviewEnabled==1;
bool l9_1090;
if (l9_1089)
{
l9_1090=!PreviewInfo.Saved;
}
else
{
l9_1090=l9_1089;
}
bool l9_1091;
if (l9_1090)
{
l9_1091=78==(*sc_set2.UserUniforms).PreviewNodeID;
}
else
{
l9_1091=l9_1090;
}
if (l9_1091)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=l9_1088;
PreviewInfo.Color.w=1.0;
}
l9_1082=l9_1088;
float4 l9_1092=float4(0.0);
l9_1092=l9_1082;
float4 l9_1093=float4(0.0);
float4 l9_1094=float4(0.0);
float4 l9_1095=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals l9_1096=l9_720;
float4 l9_1097;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_1098=float2(0.0);
float2 l9_1099=float2(0.0);
float2 l9_1100=float2(0.0);
float2 l9_1101=float2(0.0);
float2 l9_1102=float2(0.0);
float2 l9_1103=float2(0.0);
ssGlobals l9_1104=l9_1096;
float2 l9_1105;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1106=float2(0.0);
l9_1106=l9_1104.Surface_UVCoord0;
l9_1099=l9_1106;
l9_1105=l9_1099;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1107=float2(0.0);
l9_1107=l9_1104.Surface_UVCoord1;
l9_1100=l9_1107;
l9_1105=l9_1100;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1108=float2(0.0);
float2 l9_1109=float2(0.0);
float2 l9_1110=float2(0.0);
ssGlobals l9_1111=l9_1104;
float2 l9_1112;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1113=float2(0.0);
float2 l9_1114=float2(0.0);
float2 l9_1115=float2(0.0);
ssGlobals l9_1116=l9_1111;
float2 l9_1117;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1118=float2(0.0);
float2 l9_1119=float2(0.0);
float2 l9_1120=float2(0.0);
float2 l9_1121=float2(0.0);
float2 l9_1122=float2(0.0);
ssGlobals l9_1123=l9_1116;
float2 l9_1124;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1125=float2(0.0);
l9_1125=l9_1123.Surface_UVCoord0;
l9_1119=l9_1125;
l9_1124=l9_1119;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1126=float2(0.0);
l9_1126=l9_1123.Surface_UVCoord1;
l9_1120=l9_1126;
l9_1124=l9_1120;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1127=float2(0.0);
l9_1127=l9_1123.gScreenCoord;
l9_1121=l9_1127;
l9_1124=l9_1121;
}
else
{
float2 l9_1128=float2(0.0);
l9_1128=l9_1123.Surface_UVCoord0;
l9_1122=l9_1128;
l9_1124=l9_1122;
}
}
}
l9_1118=l9_1124;
float2 l9_1129=float2(0.0);
float2 l9_1130=(*sc_set2.UserUniforms).uv2Scale;
l9_1129=l9_1130;
float2 l9_1131=float2(0.0);
l9_1131=l9_1129;
float2 l9_1132=float2(0.0);
float2 l9_1133=(*sc_set2.UserUniforms).uv2Offset;
l9_1132=l9_1133;
float2 l9_1134=float2(0.0);
l9_1134=l9_1132;
float2 l9_1135=float2(0.0);
l9_1135=(l9_1118*l9_1131)+l9_1134;
float2 l9_1136=float2(0.0);
l9_1136=l9_1135+(l9_1134*(l9_1116.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1114=l9_1136;
l9_1117=l9_1114;
}
else
{
float2 l9_1137=float2(0.0);
float2 l9_1138=float2(0.0);
float2 l9_1139=float2(0.0);
float2 l9_1140=float2(0.0);
float2 l9_1141=float2(0.0);
ssGlobals l9_1142=l9_1116;
float2 l9_1143;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1144=float2(0.0);
l9_1144=l9_1142.Surface_UVCoord0;
l9_1138=l9_1144;
l9_1143=l9_1138;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1145=float2(0.0);
l9_1145=l9_1142.Surface_UVCoord1;
l9_1139=l9_1145;
l9_1143=l9_1139;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1146=float2(0.0);
l9_1146=l9_1142.gScreenCoord;
l9_1140=l9_1146;
l9_1143=l9_1140;
}
else
{
float2 l9_1147=float2(0.0);
l9_1147=l9_1142.Surface_UVCoord0;
l9_1141=l9_1147;
l9_1143=l9_1141;
}
}
}
l9_1137=l9_1143;
float2 l9_1148=float2(0.0);
float2 l9_1149=(*sc_set2.UserUniforms).uv2Scale;
l9_1148=l9_1149;
float2 l9_1150=float2(0.0);
l9_1150=l9_1148;
float2 l9_1151=float2(0.0);
float2 l9_1152=(*sc_set2.UserUniforms).uv2Offset;
l9_1151=l9_1152;
float2 l9_1153=float2(0.0);
l9_1153=l9_1151;
float2 l9_1154=float2(0.0);
l9_1154=(l9_1137*l9_1150)+l9_1153;
l9_1115=l9_1154;
l9_1117=l9_1115;
}
l9_1113=l9_1117;
l9_1109=l9_1113;
l9_1112=l9_1109;
}
else
{
float2 l9_1155=float2(0.0);
l9_1155=l9_1111.Surface_UVCoord0;
l9_1110=l9_1155;
l9_1112=l9_1110;
}
l9_1108=l9_1112;
float2 l9_1156=float2(0.0);
l9_1156=l9_1108;
float2 l9_1157=float2(0.0);
l9_1157=l9_1156;
l9_1101=l9_1157;
l9_1105=l9_1101;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1158=float2(0.0);
float2 l9_1159=float2(0.0);
float2 l9_1160=float2(0.0);
ssGlobals l9_1161=l9_1104;
float2 l9_1162;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1163=float2(0.0);
float2 l9_1164=float2(0.0);
float2 l9_1165=float2(0.0);
ssGlobals l9_1166=l9_1161;
float2 l9_1167;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1168=float2(0.0);
float2 l9_1169=float2(0.0);
float2 l9_1170=float2(0.0);
float2 l9_1171=float2(0.0);
float2 l9_1172=float2(0.0);
float2 l9_1173=float2(0.0);
ssGlobals l9_1174=l9_1166;
float2 l9_1175;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1176=float2(0.0);
l9_1176=l9_1174.Surface_UVCoord0;
l9_1169=l9_1176;
l9_1175=l9_1169;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1177=float2(0.0);
l9_1177=l9_1174.Surface_UVCoord1;
l9_1170=l9_1177;
l9_1175=l9_1170;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1178=float2(0.0);
l9_1178=l9_1174.gScreenCoord;
l9_1171=l9_1178;
l9_1175=l9_1171;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1179=float2(0.0);
float2 l9_1180=float2(0.0);
float2 l9_1181=float2(0.0);
ssGlobals l9_1182=l9_1174;
float2 l9_1183;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1184=float2(0.0);
float2 l9_1185=float2(0.0);
float2 l9_1186=float2(0.0);
ssGlobals l9_1187=l9_1182;
float2 l9_1188;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1189=float2(0.0);
float2 l9_1190=float2(0.0);
float2 l9_1191=float2(0.0);
float2 l9_1192=float2(0.0);
float2 l9_1193=float2(0.0);
ssGlobals l9_1194=l9_1187;
float2 l9_1195;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1196=float2(0.0);
l9_1196=l9_1194.Surface_UVCoord0;
l9_1190=l9_1196;
l9_1195=l9_1190;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1197=float2(0.0);
l9_1197=l9_1194.Surface_UVCoord1;
l9_1191=l9_1197;
l9_1195=l9_1191;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1198=float2(0.0);
l9_1198=l9_1194.gScreenCoord;
l9_1192=l9_1198;
l9_1195=l9_1192;
}
else
{
float2 l9_1199=float2(0.0);
l9_1199=l9_1194.Surface_UVCoord0;
l9_1193=l9_1199;
l9_1195=l9_1193;
}
}
}
l9_1189=l9_1195;
float2 l9_1200=float2(0.0);
float2 l9_1201=(*sc_set2.UserUniforms).uv2Scale;
l9_1200=l9_1201;
float2 l9_1202=float2(0.0);
l9_1202=l9_1200;
float2 l9_1203=float2(0.0);
float2 l9_1204=(*sc_set2.UserUniforms).uv2Offset;
l9_1203=l9_1204;
float2 l9_1205=float2(0.0);
l9_1205=l9_1203;
float2 l9_1206=float2(0.0);
l9_1206=(l9_1189*l9_1202)+l9_1205;
float2 l9_1207=float2(0.0);
l9_1207=l9_1206+(l9_1205*(l9_1187.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1185=l9_1207;
l9_1188=l9_1185;
}
else
{
float2 l9_1208=float2(0.0);
float2 l9_1209=float2(0.0);
float2 l9_1210=float2(0.0);
float2 l9_1211=float2(0.0);
float2 l9_1212=float2(0.0);
ssGlobals l9_1213=l9_1187;
float2 l9_1214;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1215=float2(0.0);
l9_1215=l9_1213.Surface_UVCoord0;
l9_1209=l9_1215;
l9_1214=l9_1209;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1216=float2(0.0);
l9_1216=l9_1213.Surface_UVCoord1;
l9_1210=l9_1216;
l9_1214=l9_1210;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1217=float2(0.0);
l9_1217=l9_1213.gScreenCoord;
l9_1211=l9_1217;
l9_1214=l9_1211;
}
else
{
float2 l9_1218=float2(0.0);
l9_1218=l9_1213.Surface_UVCoord0;
l9_1212=l9_1218;
l9_1214=l9_1212;
}
}
}
l9_1208=l9_1214;
float2 l9_1219=float2(0.0);
float2 l9_1220=(*sc_set2.UserUniforms).uv2Scale;
l9_1219=l9_1220;
float2 l9_1221=float2(0.0);
l9_1221=l9_1219;
float2 l9_1222=float2(0.0);
float2 l9_1223=(*sc_set2.UserUniforms).uv2Offset;
l9_1222=l9_1223;
float2 l9_1224=float2(0.0);
l9_1224=l9_1222;
float2 l9_1225=float2(0.0);
l9_1225=(l9_1208*l9_1221)+l9_1224;
l9_1186=l9_1225;
l9_1188=l9_1186;
}
l9_1184=l9_1188;
l9_1180=l9_1184;
l9_1183=l9_1180;
}
else
{
float2 l9_1226=float2(0.0);
l9_1226=l9_1182.Surface_UVCoord0;
l9_1181=l9_1226;
l9_1183=l9_1181;
}
l9_1179=l9_1183;
float2 l9_1227=float2(0.0);
l9_1227=l9_1179;
float2 l9_1228=float2(0.0);
l9_1228=l9_1227;
l9_1172=l9_1228;
l9_1175=l9_1172;
}
else
{
float2 l9_1229=float2(0.0);
l9_1229=l9_1174.Surface_UVCoord0;
l9_1173=l9_1229;
l9_1175=l9_1173;
}
}
}
}
l9_1168=l9_1175;
float2 l9_1230=float2(0.0);
float2 l9_1231=(*sc_set2.UserUniforms).uv3Scale;
l9_1230=l9_1231;
float2 l9_1232=float2(0.0);
l9_1232=l9_1230;
float2 l9_1233=float2(0.0);
float2 l9_1234=(*sc_set2.UserUniforms).uv3Offset;
l9_1233=l9_1234;
float2 l9_1235=float2(0.0);
l9_1235=l9_1233;
float2 l9_1236=float2(0.0);
l9_1236=(l9_1168*l9_1232)+l9_1235;
float2 l9_1237=float2(0.0);
l9_1237=l9_1236+(l9_1235*(l9_1166.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_1164=l9_1237;
l9_1167=l9_1164;
}
else
{
float2 l9_1238=float2(0.0);
float2 l9_1239=float2(0.0);
float2 l9_1240=float2(0.0);
float2 l9_1241=float2(0.0);
float2 l9_1242=float2(0.0);
float2 l9_1243=float2(0.0);
ssGlobals l9_1244=l9_1166;
float2 l9_1245;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1246=float2(0.0);
l9_1246=l9_1244.Surface_UVCoord0;
l9_1239=l9_1246;
l9_1245=l9_1239;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1247=float2(0.0);
l9_1247=l9_1244.Surface_UVCoord1;
l9_1240=l9_1247;
l9_1245=l9_1240;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1248=float2(0.0);
l9_1248=l9_1244.gScreenCoord;
l9_1241=l9_1248;
l9_1245=l9_1241;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1249=float2(0.0);
float2 l9_1250=float2(0.0);
float2 l9_1251=float2(0.0);
ssGlobals l9_1252=l9_1244;
float2 l9_1253;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1254=float2(0.0);
float2 l9_1255=float2(0.0);
float2 l9_1256=float2(0.0);
ssGlobals l9_1257=l9_1252;
float2 l9_1258;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1259=float2(0.0);
float2 l9_1260=float2(0.0);
float2 l9_1261=float2(0.0);
float2 l9_1262=float2(0.0);
float2 l9_1263=float2(0.0);
ssGlobals l9_1264=l9_1257;
float2 l9_1265;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1266=float2(0.0);
l9_1266=l9_1264.Surface_UVCoord0;
l9_1260=l9_1266;
l9_1265=l9_1260;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1267=float2(0.0);
l9_1267=l9_1264.Surface_UVCoord1;
l9_1261=l9_1267;
l9_1265=l9_1261;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1268=float2(0.0);
l9_1268=l9_1264.gScreenCoord;
l9_1262=l9_1268;
l9_1265=l9_1262;
}
else
{
float2 l9_1269=float2(0.0);
l9_1269=l9_1264.Surface_UVCoord0;
l9_1263=l9_1269;
l9_1265=l9_1263;
}
}
}
l9_1259=l9_1265;
float2 l9_1270=float2(0.0);
float2 l9_1271=(*sc_set2.UserUniforms).uv2Scale;
l9_1270=l9_1271;
float2 l9_1272=float2(0.0);
l9_1272=l9_1270;
float2 l9_1273=float2(0.0);
float2 l9_1274=(*sc_set2.UserUniforms).uv2Offset;
l9_1273=l9_1274;
float2 l9_1275=float2(0.0);
l9_1275=l9_1273;
float2 l9_1276=float2(0.0);
l9_1276=(l9_1259*l9_1272)+l9_1275;
float2 l9_1277=float2(0.0);
l9_1277=l9_1276+(l9_1275*(l9_1257.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1255=l9_1277;
l9_1258=l9_1255;
}
else
{
float2 l9_1278=float2(0.0);
float2 l9_1279=float2(0.0);
float2 l9_1280=float2(0.0);
float2 l9_1281=float2(0.0);
float2 l9_1282=float2(0.0);
ssGlobals l9_1283=l9_1257;
float2 l9_1284;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1285=float2(0.0);
l9_1285=l9_1283.Surface_UVCoord0;
l9_1279=l9_1285;
l9_1284=l9_1279;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1286=float2(0.0);
l9_1286=l9_1283.Surface_UVCoord1;
l9_1280=l9_1286;
l9_1284=l9_1280;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1287=float2(0.0);
l9_1287=l9_1283.gScreenCoord;
l9_1281=l9_1287;
l9_1284=l9_1281;
}
else
{
float2 l9_1288=float2(0.0);
l9_1288=l9_1283.Surface_UVCoord0;
l9_1282=l9_1288;
l9_1284=l9_1282;
}
}
}
l9_1278=l9_1284;
float2 l9_1289=float2(0.0);
float2 l9_1290=(*sc_set2.UserUniforms).uv2Scale;
l9_1289=l9_1290;
float2 l9_1291=float2(0.0);
l9_1291=l9_1289;
float2 l9_1292=float2(0.0);
float2 l9_1293=(*sc_set2.UserUniforms).uv2Offset;
l9_1292=l9_1293;
float2 l9_1294=float2(0.0);
l9_1294=l9_1292;
float2 l9_1295=float2(0.0);
l9_1295=(l9_1278*l9_1291)+l9_1294;
l9_1256=l9_1295;
l9_1258=l9_1256;
}
l9_1254=l9_1258;
l9_1250=l9_1254;
l9_1253=l9_1250;
}
else
{
float2 l9_1296=float2(0.0);
l9_1296=l9_1252.Surface_UVCoord0;
l9_1251=l9_1296;
l9_1253=l9_1251;
}
l9_1249=l9_1253;
float2 l9_1297=float2(0.0);
l9_1297=l9_1249;
float2 l9_1298=float2(0.0);
l9_1298=l9_1297;
l9_1242=l9_1298;
l9_1245=l9_1242;
}
else
{
float2 l9_1299=float2(0.0);
l9_1299=l9_1244.Surface_UVCoord0;
l9_1243=l9_1299;
l9_1245=l9_1243;
}
}
}
}
l9_1238=l9_1245;
float2 l9_1300=float2(0.0);
float2 l9_1301=(*sc_set2.UserUniforms).uv3Scale;
l9_1300=l9_1301;
float2 l9_1302=float2(0.0);
l9_1302=l9_1300;
float2 l9_1303=float2(0.0);
float2 l9_1304=(*sc_set2.UserUniforms).uv3Offset;
l9_1303=l9_1304;
float2 l9_1305=float2(0.0);
l9_1305=l9_1303;
float2 l9_1306=float2(0.0);
l9_1306=(l9_1238*l9_1302)+l9_1305;
l9_1165=l9_1306;
l9_1167=l9_1165;
}
l9_1163=l9_1167;
l9_1159=l9_1163;
l9_1162=l9_1159;
}
else
{
float2 l9_1307=float2(0.0);
l9_1307=l9_1161.Surface_UVCoord0;
l9_1160=l9_1307;
l9_1162=l9_1160;
}
l9_1158=l9_1162;
float2 l9_1308=float2(0.0);
l9_1308=l9_1158;
float2 l9_1309=float2(0.0);
l9_1309=l9_1308;
l9_1102=l9_1309;
l9_1105=l9_1102;
}
else
{
float2 l9_1310=float2(0.0);
l9_1310=l9_1104.Surface_UVCoord0;
l9_1103=l9_1310;
l9_1105=l9_1103;
}
}
}
}
l9_1098=l9_1105;
float4 l9_1311=float4(0.0);
int l9_1312=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1313=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1313=0;
}
else
{
l9_1313=in.varStereoViewID;
}
int l9_1314=l9_1313;
l9_1312=1-l9_1314;
}
else
{
int l9_1315=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1315=0;
}
else
{
l9_1315=in.varStereoViewID;
}
int l9_1316=l9_1315;
l9_1312=l9_1316;
}
int l9_1317=l9_1312;
int l9_1318=baseTexLayout_tmp;
int l9_1319=l9_1317;
float2 l9_1320=l9_1098;
bool l9_1321=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1322=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_1323=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1324=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1325=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_1326=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1327=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_1328=0.0;
bool l9_1329=l9_1326&&(!l9_1324);
float l9_1330=1.0;
float l9_1331=l9_1320.x;
int l9_1332=l9_1323.x;
if (l9_1332==1)
{
l9_1331=fract(l9_1331);
}
else
{
if (l9_1332==2)
{
float l9_1333=fract(l9_1331);
float l9_1334=l9_1331-l9_1333;
float l9_1335=step(0.25,fract(l9_1334*0.5));
l9_1331=mix(l9_1333,1.0-l9_1333,fast::clamp(l9_1335,0.0,1.0));
}
}
l9_1320.x=l9_1331;
float l9_1336=l9_1320.y;
int l9_1337=l9_1323.y;
if (l9_1337==1)
{
l9_1336=fract(l9_1336);
}
else
{
if (l9_1337==2)
{
float l9_1338=fract(l9_1336);
float l9_1339=l9_1336-l9_1338;
float l9_1340=step(0.25,fract(l9_1339*0.5));
l9_1336=mix(l9_1338,1.0-l9_1338,fast::clamp(l9_1340,0.0,1.0));
}
}
l9_1320.y=l9_1336;
if (l9_1324)
{
bool l9_1341=l9_1326;
bool l9_1342;
if (l9_1341)
{
l9_1342=l9_1323.x==3;
}
else
{
l9_1342=l9_1341;
}
float l9_1343=l9_1320.x;
float l9_1344=l9_1325.x;
float l9_1345=l9_1325.z;
bool l9_1346=l9_1342;
float l9_1347=l9_1330;
float l9_1348=fast::clamp(l9_1343,l9_1344,l9_1345);
float l9_1349=step(abs(l9_1343-l9_1348),9.9999997e-06);
l9_1347*=(l9_1349+((1.0-float(l9_1346))*(1.0-l9_1349)));
l9_1343=l9_1348;
l9_1320.x=l9_1343;
l9_1330=l9_1347;
bool l9_1350=l9_1326;
bool l9_1351;
if (l9_1350)
{
l9_1351=l9_1323.y==3;
}
else
{
l9_1351=l9_1350;
}
float l9_1352=l9_1320.y;
float l9_1353=l9_1325.y;
float l9_1354=l9_1325.w;
bool l9_1355=l9_1351;
float l9_1356=l9_1330;
float l9_1357=fast::clamp(l9_1352,l9_1353,l9_1354);
float l9_1358=step(abs(l9_1352-l9_1357),9.9999997e-06);
l9_1356*=(l9_1358+((1.0-float(l9_1355))*(1.0-l9_1358)));
l9_1352=l9_1357;
l9_1320.y=l9_1352;
l9_1330=l9_1356;
}
float2 l9_1359=l9_1320;
bool l9_1360=l9_1321;
float3x3 l9_1361=l9_1322;
if (l9_1360)
{
l9_1359=float2((l9_1361*float3(l9_1359,1.0)).xy);
}
float2 l9_1362=l9_1359;
float2 l9_1363=l9_1362;
float2 l9_1364=l9_1363;
l9_1320=l9_1364;
float l9_1365=l9_1320.x;
int l9_1366=l9_1323.x;
bool l9_1367=l9_1329;
float l9_1368=l9_1330;
if ((l9_1366==0)||(l9_1366==3))
{
float l9_1369=l9_1365;
float l9_1370=0.0;
float l9_1371=1.0;
bool l9_1372=l9_1367;
float l9_1373=l9_1368;
float l9_1374=fast::clamp(l9_1369,l9_1370,l9_1371);
float l9_1375=step(abs(l9_1369-l9_1374),9.9999997e-06);
l9_1373*=(l9_1375+((1.0-float(l9_1372))*(1.0-l9_1375)));
l9_1369=l9_1374;
l9_1365=l9_1369;
l9_1368=l9_1373;
}
l9_1320.x=l9_1365;
l9_1330=l9_1368;
float l9_1376=l9_1320.y;
int l9_1377=l9_1323.y;
bool l9_1378=l9_1329;
float l9_1379=l9_1330;
if ((l9_1377==0)||(l9_1377==3))
{
float l9_1380=l9_1376;
float l9_1381=0.0;
float l9_1382=1.0;
bool l9_1383=l9_1378;
float l9_1384=l9_1379;
float l9_1385=fast::clamp(l9_1380,l9_1381,l9_1382);
float l9_1386=step(abs(l9_1380-l9_1385),9.9999997e-06);
l9_1384*=(l9_1386+((1.0-float(l9_1383))*(1.0-l9_1386)));
l9_1380=l9_1385;
l9_1376=l9_1380;
l9_1379=l9_1384;
}
l9_1320.y=l9_1376;
l9_1330=l9_1379;
float2 l9_1387=l9_1320;
int l9_1388=l9_1318;
int l9_1389=l9_1319;
float l9_1390=l9_1328;
float2 l9_1391=l9_1387;
int l9_1392=l9_1388;
int l9_1393=l9_1389;
float3 l9_1394=float3(0.0);
if (l9_1392==0)
{
l9_1394=float3(l9_1391,0.0);
}
else
{
if (l9_1392==1)
{
l9_1394=float3(l9_1391.x,(l9_1391.y*0.5)+(0.5-(float(l9_1393)*0.5)),0.0);
}
else
{
l9_1394=float3(l9_1391,float(l9_1393));
}
}
float3 l9_1395=l9_1394;
float3 l9_1396=l9_1395;
float2 l9_1397=l9_1396.xy;
float l9_1398=l9_1390;
float4 l9_1399=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1397,bias(l9_1398));
float4 l9_1400=l9_1399;
float4 l9_1401=l9_1400;
if (l9_1326)
{
l9_1401=mix(l9_1327,l9_1401,float4(l9_1330));
}
float4 l9_1402=l9_1401;
l9_1311=l9_1402;
l9_1094=l9_1311;
l9_1097=l9_1094;
}
else
{
l9_1097=l9_1095;
}
l9_1093=l9_1097;
float4 l9_1403=float4(0.0);
l9_1403=l9_1092*l9_1093;
float4 l9_1404=float4(0.0);
l9_1404=l9_1403;
float4 l9_1405=float4(0.0);
l9_1405=l9_1404;
l9_719=l9_1405.xyz;
l9_721=l9_719;
}
l9_717=l9_721;
float3 l9_1406=float3(0.0);
l9_1406=l9_717;
float3 l9_1407=float3(0.0);
l9_1407=l9_1406;
float4 l9_1408=float4(0.0);
l9_1408=float4(l9_1407.x,l9_1407.y,l9_1407.z,l9_1408.w);
l9_1408.w=(*sc_set2.UserUniforms).Port_Value2_N073;
param_1=l9_1408;
param_2=param_1;
}
Result_N363=param_2;
float4 Export_N364=float4(0.0);
Export_N364=Result_N363;
float2 UVCoord_N77=float2(0.0);
UVCoord_N77=Globals.Surface_UVCoord0;
float Value2_N79=0.0;
float4 param_4=float4(UVCoord_N77,0.0,0.0);
float param_5=param_4.y;
Value2_N79=param_5;
float4 Output_N81=float4(0.0);
float4 param_6=(*sc_set2.UserUniforms).Tweak_N81;
Output_N81=param_6;
float4 Output_N5=float4(0.0);
float4 param_7=(*sc_set2.UserUniforms).baseColor;
Output_N5=param_7;
float4 Value_N78=float4(0.0);
float param_8=Value2_N79;
float4 param_9=Output_N81;
float param_10=(*sc_set2.UserUniforms).Port_Position1_N078;
float4 param_11=Output_N81;
float4 param_12=Output_N5;
param_8=fast::clamp(param_8,0.0,1.0);
float4 param_13;
if (param_8<param_10)
{
param_13=mix(param_9,param_11,float4(fast::clamp(param_8/param_10,0.0,1.0)));
}
else
{
param_13=mix(param_11,param_12,float4(fast::clamp((param_8-param_10)/(1.0-param_10),0.0,1.0)));
}
bool l9_1409=(*sc_set2.UserUniforms).PreviewEnabled==1;
bool l9_1410;
if (l9_1409)
{
l9_1410=!PreviewInfo.Saved;
}
else
{
l9_1410=l9_1409;
}
bool l9_1411;
if (l9_1410)
{
l9_1411=78==(*sc_set2.UserUniforms).PreviewNodeID;
}
else
{
l9_1411=l9_1410;
}
if (l9_1411)
{
PreviewInfo.Saved=true;
PreviewInfo.Color=param_13;
PreviewInfo.Color.w=1.0;
}
Value_N78=param_13;
float4 Value_N384=float4(0.0);
Value_N384=Value_N78;
float4 Result_N369=float4(0.0);
float4 param_14=float4(0.0);
float4 param_15=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals param_17=Globals;
float4 param_16;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_1412=float2(0.0);
float2 l9_1413=float2(0.0);
float2 l9_1414=float2(0.0);
float2 l9_1415=float2(0.0);
float2 l9_1416=float2(0.0);
float2 l9_1417=float2(0.0);
ssGlobals l9_1418=param_17;
float2 l9_1419;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1420=float2(0.0);
l9_1420=l9_1418.Surface_UVCoord0;
l9_1413=l9_1420;
l9_1419=l9_1413;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1421=float2(0.0);
l9_1421=l9_1418.Surface_UVCoord1;
l9_1414=l9_1421;
l9_1419=l9_1414;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1422=float2(0.0);
float2 l9_1423=float2(0.0);
float2 l9_1424=float2(0.0);
ssGlobals l9_1425=l9_1418;
float2 l9_1426;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1427=float2(0.0);
float2 l9_1428=float2(0.0);
float2 l9_1429=float2(0.0);
ssGlobals l9_1430=l9_1425;
float2 l9_1431;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1432=float2(0.0);
float2 l9_1433=float2(0.0);
float2 l9_1434=float2(0.0);
float2 l9_1435=float2(0.0);
float2 l9_1436=float2(0.0);
ssGlobals l9_1437=l9_1430;
float2 l9_1438;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1439=float2(0.0);
l9_1439=l9_1437.Surface_UVCoord0;
l9_1433=l9_1439;
l9_1438=l9_1433;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1440=float2(0.0);
l9_1440=l9_1437.Surface_UVCoord1;
l9_1434=l9_1440;
l9_1438=l9_1434;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1441=float2(0.0);
l9_1441=l9_1437.gScreenCoord;
l9_1435=l9_1441;
l9_1438=l9_1435;
}
else
{
float2 l9_1442=float2(0.0);
l9_1442=l9_1437.Surface_UVCoord0;
l9_1436=l9_1442;
l9_1438=l9_1436;
}
}
}
l9_1432=l9_1438;
float2 l9_1443=float2(0.0);
float2 l9_1444=(*sc_set2.UserUniforms).uv2Scale;
l9_1443=l9_1444;
float2 l9_1445=float2(0.0);
l9_1445=l9_1443;
float2 l9_1446=float2(0.0);
float2 l9_1447=(*sc_set2.UserUniforms).uv2Offset;
l9_1446=l9_1447;
float2 l9_1448=float2(0.0);
l9_1448=l9_1446;
float2 l9_1449=float2(0.0);
l9_1449=(l9_1432*l9_1445)+l9_1448;
float2 l9_1450=float2(0.0);
l9_1450=l9_1449+(l9_1448*(l9_1430.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1428=l9_1450;
l9_1431=l9_1428;
}
else
{
float2 l9_1451=float2(0.0);
float2 l9_1452=float2(0.0);
float2 l9_1453=float2(0.0);
float2 l9_1454=float2(0.0);
float2 l9_1455=float2(0.0);
ssGlobals l9_1456=l9_1430;
float2 l9_1457;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1458=float2(0.0);
l9_1458=l9_1456.Surface_UVCoord0;
l9_1452=l9_1458;
l9_1457=l9_1452;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1459=float2(0.0);
l9_1459=l9_1456.Surface_UVCoord1;
l9_1453=l9_1459;
l9_1457=l9_1453;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1460=float2(0.0);
l9_1460=l9_1456.gScreenCoord;
l9_1454=l9_1460;
l9_1457=l9_1454;
}
else
{
float2 l9_1461=float2(0.0);
l9_1461=l9_1456.Surface_UVCoord0;
l9_1455=l9_1461;
l9_1457=l9_1455;
}
}
}
l9_1451=l9_1457;
float2 l9_1462=float2(0.0);
float2 l9_1463=(*sc_set2.UserUniforms).uv2Scale;
l9_1462=l9_1463;
float2 l9_1464=float2(0.0);
l9_1464=l9_1462;
float2 l9_1465=float2(0.0);
float2 l9_1466=(*sc_set2.UserUniforms).uv2Offset;
l9_1465=l9_1466;
float2 l9_1467=float2(0.0);
l9_1467=l9_1465;
float2 l9_1468=float2(0.0);
l9_1468=(l9_1451*l9_1464)+l9_1467;
l9_1429=l9_1468;
l9_1431=l9_1429;
}
l9_1427=l9_1431;
l9_1423=l9_1427;
l9_1426=l9_1423;
}
else
{
float2 l9_1469=float2(0.0);
l9_1469=l9_1425.Surface_UVCoord0;
l9_1424=l9_1469;
l9_1426=l9_1424;
}
l9_1422=l9_1426;
float2 l9_1470=float2(0.0);
l9_1470=l9_1422;
float2 l9_1471=float2(0.0);
l9_1471=l9_1470;
l9_1415=l9_1471;
l9_1419=l9_1415;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1472=float2(0.0);
float2 l9_1473=float2(0.0);
float2 l9_1474=float2(0.0);
ssGlobals l9_1475=l9_1418;
float2 l9_1476;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1477=float2(0.0);
float2 l9_1478=float2(0.0);
float2 l9_1479=float2(0.0);
ssGlobals l9_1480=l9_1475;
float2 l9_1481;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1482=float2(0.0);
float2 l9_1483=float2(0.0);
float2 l9_1484=float2(0.0);
float2 l9_1485=float2(0.0);
float2 l9_1486=float2(0.0);
float2 l9_1487=float2(0.0);
ssGlobals l9_1488=l9_1480;
float2 l9_1489;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1490=float2(0.0);
l9_1490=l9_1488.Surface_UVCoord0;
l9_1483=l9_1490;
l9_1489=l9_1483;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1491=float2(0.0);
l9_1491=l9_1488.Surface_UVCoord1;
l9_1484=l9_1491;
l9_1489=l9_1484;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1492=float2(0.0);
l9_1492=l9_1488.gScreenCoord;
l9_1485=l9_1492;
l9_1489=l9_1485;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1493=float2(0.0);
float2 l9_1494=float2(0.0);
float2 l9_1495=float2(0.0);
ssGlobals l9_1496=l9_1488;
float2 l9_1497;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1498=float2(0.0);
float2 l9_1499=float2(0.0);
float2 l9_1500=float2(0.0);
ssGlobals l9_1501=l9_1496;
float2 l9_1502;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1503=float2(0.0);
float2 l9_1504=float2(0.0);
float2 l9_1505=float2(0.0);
float2 l9_1506=float2(0.0);
float2 l9_1507=float2(0.0);
ssGlobals l9_1508=l9_1501;
float2 l9_1509;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1510=float2(0.0);
l9_1510=l9_1508.Surface_UVCoord0;
l9_1504=l9_1510;
l9_1509=l9_1504;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1511=float2(0.0);
l9_1511=l9_1508.Surface_UVCoord1;
l9_1505=l9_1511;
l9_1509=l9_1505;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1512=float2(0.0);
l9_1512=l9_1508.gScreenCoord;
l9_1506=l9_1512;
l9_1509=l9_1506;
}
else
{
float2 l9_1513=float2(0.0);
l9_1513=l9_1508.Surface_UVCoord0;
l9_1507=l9_1513;
l9_1509=l9_1507;
}
}
}
l9_1503=l9_1509;
float2 l9_1514=float2(0.0);
float2 l9_1515=(*sc_set2.UserUniforms).uv2Scale;
l9_1514=l9_1515;
float2 l9_1516=float2(0.0);
l9_1516=l9_1514;
float2 l9_1517=float2(0.0);
float2 l9_1518=(*sc_set2.UserUniforms).uv2Offset;
l9_1517=l9_1518;
float2 l9_1519=float2(0.0);
l9_1519=l9_1517;
float2 l9_1520=float2(0.0);
l9_1520=(l9_1503*l9_1516)+l9_1519;
float2 l9_1521=float2(0.0);
l9_1521=l9_1520+(l9_1519*(l9_1501.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1499=l9_1521;
l9_1502=l9_1499;
}
else
{
float2 l9_1522=float2(0.0);
float2 l9_1523=float2(0.0);
float2 l9_1524=float2(0.0);
float2 l9_1525=float2(0.0);
float2 l9_1526=float2(0.0);
ssGlobals l9_1527=l9_1501;
float2 l9_1528;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1529=float2(0.0);
l9_1529=l9_1527.Surface_UVCoord0;
l9_1523=l9_1529;
l9_1528=l9_1523;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1530=float2(0.0);
l9_1530=l9_1527.Surface_UVCoord1;
l9_1524=l9_1530;
l9_1528=l9_1524;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1531=float2(0.0);
l9_1531=l9_1527.gScreenCoord;
l9_1525=l9_1531;
l9_1528=l9_1525;
}
else
{
float2 l9_1532=float2(0.0);
l9_1532=l9_1527.Surface_UVCoord0;
l9_1526=l9_1532;
l9_1528=l9_1526;
}
}
}
l9_1522=l9_1528;
float2 l9_1533=float2(0.0);
float2 l9_1534=(*sc_set2.UserUniforms).uv2Scale;
l9_1533=l9_1534;
float2 l9_1535=float2(0.0);
l9_1535=l9_1533;
float2 l9_1536=float2(0.0);
float2 l9_1537=(*sc_set2.UserUniforms).uv2Offset;
l9_1536=l9_1537;
float2 l9_1538=float2(0.0);
l9_1538=l9_1536;
float2 l9_1539=float2(0.0);
l9_1539=(l9_1522*l9_1535)+l9_1538;
l9_1500=l9_1539;
l9_1502=l9_1500;
}
l9_1498=l9_1502;
l9_1494=l9_1498;
l9_1497=l9_1494;
}
else
{
float2 l9_1540=float2(0.0);
l9_1540=l9_1496.Surface_UVCoord0;
l9_1495=l9_1540;
l9_1497=l9_1495;
}
l9_1493=l9_1497;
float2 l9_1541=float2(0.0);
l9_1541=l9_1493;
float2 l9_1542=float2(0.0);
l9_1542=l9_1541;
l9_1486=l9_1542;
l9_1489=l9_1486;
}
else
{
float2 l9_1543=float2(0.0);
l9_1543=l9_1488.Surface_UVCoord0;
l9_1487=l9_1543;
l9_1489=l9_1487;
}
}
}
}
l9_1482=l9_1489;
float2 l9_1544=float2(0.0);
float2 l9_1545=(*sc_set2.UserUniforms).uv3Scale;
l9_1544=l9_1545;
float2 l9_1546=float2(0.0);
l9_1546=l9_1544;
float2 l9_1547=float2(0.0);
float2 l9_1548=(*sc_set2.UserUniforms).uv3Offset;
l9_1547=l9_1548;
float2 l9_1549=float2(0.0);
l9_1549=l9_1547;
float2 l9_1550=float2(0.0);
l9_1550=(l9_1482*l9_1546)+l9_1549;
float2 l9_1551=float2(0.0);
l9_1551=l9_1550+(l9_1549*(l9_1480.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_1478=l9_1551;
l9_1481=l9_1478;
}
else
{
float2 l9_1552=float2(0.0);
float2 l9_1553=float2(0.0);
float2 l9_1554=float2(0.0);
float2 l9_1555=float2(0.0);
float2 l9_1556=float2(0.0);
float2 l9_1557=float2(0.0);
ssGlobals l9_1558=l9_1480;
float2 l9_1559;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1560=float2(0.0);
l9_1560=l9_1558.Surface_UVCoord0;
l9_1553=l9_1560;
l9_1559=l9_1553;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1561=float2(0.0);
l9_1561=l9_1558.Surface_UVCoord1;
l9_1554=l9_1561;
l9_1559=l9_1554;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1562=float2(0.0);
l9_1562=l9_1558.gScreenCoord;
l9_1555=l9_1562;
l9_1559=l9_1555;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1563=float2(0.0);
float2 l9_1564=float2(0.0);
float2 l9_1565=float2(0.0);
ssGlobals l9_1566=l9_1558;
float2 l9_1567;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1568=float2(0.0);
float2 l9_1569=float2(0.0);
float2 l9_1570=float2(0.0);
ssGlobals l9_1571=l9_1566;
float2 l9_1572;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1573=float2(0.0);
float2 l9_1574=float2(0.0);
float2 l9_1575=float2(0.0);
float2 l9_1576=float2(0.0);
float2 l9_1577=float2(0.0);
ssGlobals l9_1578=l9_1571;
float2 l9_1579;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1580=float2(0.0);
l9_1580=l9_1578.Surface_UVCoord0;
l9_1574=l9_1580;
l9_1579=l9_1574;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1581=float2(0.0);
l9_1581=l9_1578.Surface_UVCoord1;
l9_1575=l9_1581;
l9_1579=l9_1575;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1582=float2(0.0);
l9_1582=l9_1578.gScreenCoord;
l9_1576=l9_1582;
l9_1579=l9_1576;
}
else
{
float2 l9_1583=float2(0.0);
l9_1583=l9_1578.Surface_UVCoord0;
l9_1577=l9_1583;
l9_1579=l9_1577;
}
}
}
l9_1573=l9_1579;
float2 l9_1584=float2(0.0);
float2 l9_1585=(*sc_set2.UserUniforms).uv2Scale;
l9_1584=l9_1585;
float2 l9_1586=float2(0.0);
l9_1586=l9_1584;
float2 l9_1587=float2(0.0);
float2 l9_1588=(*sc_set2.UserUniforms).uv2Offset;
l9_1587=l9_1588;
float2 l9_1589=float2(0.0);
l9_1589=l9_1587;
float2 l9_1590=float2(0.0);
l9_1590=(l9_1573*l9_1586)+l9_1589;
float2 l9_1591=float2(0.0);
l9_1591=l9_1590+(l9_1589*(l9_1571.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1569=l9_1591;
l9_1572=l9_1569;
}
else
{
float2 l9_1592=float2(0.0);
float2 l9_1593=float2(0.0);
float2 l9_1594=float2(0.0);
float2 l9_1595=float2(0.0);
float2 l9_1596=float2(0.0);
ssGlobals l9_1597=l9_1571;
float2 l9_1598;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1599=float2(0.0);
l9_1599=l9_1597.Surface_UVCoord0;
l9_1593=l9_1599;
l9_1598=l9_1593;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1600=float2(0.0);
l9_1600=l9_1597.Surface_UVCoord1;
l9_1594=l9_1600;
l9_1598=l9_1594;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1601=float2(0.0);
l9_1601=l9_1597.gScreenCoord;
l9_1595=l9_1601;
l9_1598=l9_1595;
}
else
{
float2 l9_1602=float2(0.0);
l9_1602=l9_1597.Surface_UVCoord0;
l9_1596=l9_1602;
l9_1598=l9_1596;
}
}
}
l9_1592=l9_1598;
float2 l9_1603=float2(0.0);
float2 l9_1604=(*sc_set2.UserUniforms).uv2Scale;
l9_1603=l9_1604;
float2 l9_1605=float2(0.0);
l9_1605=l9_1603;
float2 l9_1606=float2(0.0);
float2 l9_1607=(*sc_set2.UserUniforms).uv2Offset;
l9_1606=l9_1607;
float2 l9_1608=float2(0.0);
l9_1608=l9_1606;
float2 l9_1609=float2(0.0);
l9_1609=(l9_1592*l9_1605)+l9_1608;
l9_1570=l9_1609;
l9_1572=l9_1570;
}
l9_1568=l9_1572;
l9_1564=l9_1568;
l9_1567=l9_1564;
}
else
{
float2 l9_1610=float2(0.0);
l9_1610=l9_1566.Surface_UVCoord0;
l9_1565=l9_1610;
l9_1567=l9_1565;
}
l9_1563=l9_1567;
float2 l9_1611=float2(0.0);
l9_1611=l9_1563;
float2 l9_1612=float2(0.0);
l9_1612=l9_1611;
l9_1556=l9_1612;
l9_1559=l9_1556;
}
else
{
float2 l9_1613=float2(0.0);
l9_1613=l9_1558.Surface_UVCoord0;
l9_1557=l9_1613;
l9_1559=l9_1557;
}
}
}
}
l9_1552=l9_1559;
float2 l9_1614=float2(0.0);
float2 l9_1615=(*sc_set2.UserUniforms).uv3Scale;
l9_1614=l9_1615;
float2 l9_1616=float2(0.0);
l9_1616=l9_1614;
float2 l9_1617=float2(0.0);
float2 l9_1618=(*sc_set2.UserUniforms).uv3Offset;
l9_1617=l9_1618;
float2 l9_1619=float2(0.0);
l9_1619=l9_1617;
float2 l9_1620=float2(0.0);
l9_1620=(l9_1552*l9_1616)+l9_1619;
l9_1479=l9_1620;
l9_1481=l9_1479;
}
l9_1477=l9_1481;
l9_1473=l9_1477;
l9_1476=l9_1473;
}
else
{
float2 l9_1621=float2(0.0);
l9_1621=l9_1475.Surface_UVCoord0;
l9_1474=l9_1621;
l9_1476=l9_1474;
}
l9_1472=l9_1476;
float2 l9_1622=float2(0.0);
l9_1622=l9_1472;
float2 l9_1623=float2(0.0);
l9_1623=l9_1622;
l9_1416=l9_1623;
l9_1419=l9_1416;
}
else
{
float2 l9_1624=float2(0.0);
l9_1624=l9_1418.Surface_UVCoord0;
l9_1417=l9_1624;
l9_1419=l9_1417;
}
}
}
}
l9_1412=l9_1419;
float4 l9_1625=float4(0.0);
int l9_1626=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1627=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1627=0;
}
else
{
l9_1627=in.varStereoViewID;
}
int l9_1628=l9_1627;
l9_1626=1-l9_1628;
}
else
{
int l9_1629=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1629=0;
}
else
{
l9_1629=in.varStereoViewID;
}
int l9_1630=l9_1629;
l9_1626=l9_1630;
}
int l9_1631=l9_1626;
int l9_1632=baseTexLayout_tmp;
int l9_1633=l9_1631;
float2 l9_1634=l9_1412;
bool l9_1635=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1636=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_1637=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1638=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1639=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_1640=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1641=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_1642=0.0;
bool l9_1643=l9_1640&&(!l9_1638);
float l9_1644=1.0;
float l9_1645=l9_1634.x;
int l9_1646=l9_1637.x;
if (l9_1646==1)
{
l9_1645=fract(l9_1645);
}
else
{
if (l9_1646==2)
{
float l9_1647=fract(l9_1645);
float l9_1648=l9_1645-l9_1647;
float l9_1649=step(0.25,fract(l9_1648*0.5));
l9_1645=mix(l9_1647,1.0-l9_1647,fast::clamp(l9_1649,0.0,1.0));
}
}
l9_1634.x=l9_1645;
float l9_1650=l9_1634.y;
int l9_1651=l9_1637.y;
if (l9_1651==1)
{
l9_1650=fract(l9_1650);
}
else
{
if (l9_1651==2)
{
float l9_1652=fract(l9_1650);
float l9_1653=l9_1650-l9_1652;
float l9_1654=step(0.25,fract(l9_1653*0.5));
l9_1650=mix(l9_1652,1.0-l9_1652,fast::clamp(l9_1654,0.0,1.0));
}
}
l9_1634.y=l9_1650;
if (l9_1638)
{
bool l9_1655=l9_1640;
bool l9_1656;
if (l9_1655)
{
l9_1656=l9_1637.x==3;
}
else
{
l9_1656=l9_1655;
}
float l9_1657=l9_1634.x;
float l9_1658=l9_1639.x;
float l9_1659=l9_1639.z;
bool l9_1660=l9_1656;
float l9_1661=l9_1644;
float l9_1662=fast::clamp(l9_1657,l9_1658,l9_1659);
float l9_1663=step(abs(l9_1657-l9_1662),9.9999997e-06);
l9_1661*=(l9_1663+((1.0-float(l9_1660))*(1.0-l9_1663)));
l9_1657=l9_1662;
l9_1634.x=l9_1657;
l9_1644=l9_1661;
bool l9_1664=l9_1640;
bool l9_1665;
if (l9_1664)
{
l9_1665=l9_1637.y==3;
}
else
{
l9_1665=l9_1664;
}
float l9_1666=l9_1634.y;
float l9_1667=l9_1639.y;
float l9_1668=l9_1639.w;
bool l9_1669=l9_1665;
float l9_1670=l9_1644;
float l9_1671=fast::clamp(l9_1666,l9_1667,l9_1668);
float l9_1672=step(abs(l9_1666-l9_1671),9.9999997e-06);
l9_1670*=(l9_1672+((1.0-float(l9_1669))*(1.0-l9_1672)));
l9_1666=l9_1671;
l9_1634.y=l9_1666;
l9_1644=l9_1670;
}
float2 l9_1673=l9_1634;
bool l9_1674=l9_1635;
float3x3 l9_1675=l9_1636;
if (l9_1674)
{
l9_1673=float2((l9_1675*float3(l9_1673,1.0)).xy);
}
float2 l9_1676=l9_1673;
float2 l9_1677=l9_1676;
float2 l9_1678=l9_1677;
l9_1634=l9_1678;
float l9_1679=l9_1634.x;
int l9_1680=l9_1637.x;
bool l9_1681=l9_1643;
float l9_1682=l9_1644;
if ((l9_1680==0)||(l9_1680==3))
{
float l9_1683=l9_1679;
float l9_1684=0.0;
float l9_1685=1.0;
bool l9_1686=l9_1681;
float l9_1687=l9_1682;
float l9_1688=fast::clamp(l9_1683,l9_1684,l9_1685);
float l9_1689=step(abs(l9_1683-l9_1688),9.9999997e-06);
l9_1687*=(l9_1689+((1.0-float(l9_1686))*(1.0-l9_1689)));
l9_1683=l9_1688;
l9_1679=l9_1683;
l9_1682=l9_1687;
}
l9_1634.x=l9_1679;
l9_1644=l9_1682;
float l9_1690=l9_1634.y;
int l9_1691=l9_1637.y;
bool l9_1692=l9_1643;
float l9_1693=l9_1644;
if ((l9_1691==0)||(l9_1691==3))
{
float l9_1694=l9_1690;
float l9_1695=0.0;
float l9_1696=1.0;
bool l9_1697=l9_1692;
float l9_1698=l9_1693;
float l9_1699=fast::clamp(l9_1694,l9_1695,l9_1696);
float l9_1700=step(abs(l9_1694-l9_1699),9.9999997e-06);
l9_1698*=(l9_1700+((1.0-float(l9_1697))*(1.0-l9_1700)));
l9_1694=l9_1699;
l9_1690=l9_1694;
l9_1693=l9_1698;
}
l9_1634.y=l9_1690;
l9_1644=l9_1693;
float2 l9_1701=l9_1634;
int l9_1702=l9_1632;
int l9_1703=l9_1633;
float l9_1704=l9_1642;
float2 l9_1705=l9_1701;
int l9_1706=l9_1702;
int l9_1707=l9_1703;
float3 l9_1708=float3(0.0);
if (l9_1706==0)
{
l9_1708=float3(l9_1705,0.0);
}
else
{
if (l9_1706==1)
{
l9_1708=float3(l9_1705.x,(l9_1705.y*0.5)+(0.5-(float(l9_1707)*0.5)),0.0);
}
else
{
l9_1708=float3(l9_1705,float(l9_1707));
}
}
float3 l9_1709=l9_1708;
float3 l9_1710=l9_1709;
float2 l9_1711=l9_1710.xy;
float l9_1712=l9_1704;
float4 l9_1713=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1711,bias(l9_1712));
float4 l9_1714=l9_1713;
float4 l9_1715=l9_1714;
if (l9_1640)
{
l9_1715=mix(l9_1641,l9_1715,float4(l9_1644));
}
float4 l9_1716=l9_1715;
l9_1625=l9_1716;
param_14=l9_1625;
param_16=param_14;
}
else
{
param_16=param_15;
}
Result_N369=param_16;
float4 Output_N148=float4(0.0);
Output_N148=Value_N384*Result_N369;
float4 Export_N385=float4(0.0);
Export_N385=Output_N148;
float4 Value_N166=float4(0.0);
Value_N166=Export_N385;
float Output_N168=0.0;
Output_N168=Value_N166.w;
float Result_N204=0.0;
float param_18=0.0;
float param_19=(*sc_set2.UserUniforms).Port_Default_N204;
ssGlobals param_21=Globals;
float param_20;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
float2 l9_1717=float2(0.0);
float2 l9_1718=float2(0.0);
float2 l9_1719=float2(0.0);
float2 l9_1720=float2(0.0);
float2 l9_1721=float2(0.0);
float2 l9_1722=float2(0.0);
ssGlobals l9_1723=param_21;
float2 l9_1724;
if (NODE_69_DROPLIST_ITEM_tmp==0)
{
float2 l9_1725=float2(0.0);
l9_1725=l9_1723.Surface_UVCoord0;
l9_1718=l9_1725;
l9_1724=l9_1718;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==1)
{
float2 l9_1726=float2(0.0);
l9_1726=l9_1723.Surface_UVCoord1;
l9_1719=l9_1726;
l9_1724=l9_1719;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==2)
{
float2 l9_1727=float2(0.0);
float2 l9_1728=float2(0.0);
float2 l9_1729=float2(0.0);
ssGlobals l9_1730=l9_1723;
float2 l9_1731;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1732=float2(0.0);
float2 l9_1733=float2(0.0);
float2 l9_1734=float2(0.0);
ssGlobals l9_1735=l9_1730;
float2 l9_1736;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1737=float2(0.0);
float2 l9_1738=float2(0.0);
float2 l9_1739=float2(0.0);
float2 l9_1740=float2(0.0);
float2 l9_1741=float2(0.0);
ssGlobals l9_1742=l9_1735;
float2 l9_1743;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1744=float2(0.0);
l9_1744=l9_1742.Surface_UVCoord0;
l9_1738=l9_1744;
l9_1743=l9_1738;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1745=float2(0.0);
l9_1745=l9_1742.Surface_UVCoord1;
l9_1739=l9_1745;
l9_1743=l9_1739;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1746=float2(0.0);
l9_1746=l9_1742.gScreenCoord;
l9_1740=l9_1746;
l9_1743=l9_1740;
}
else
{
float2 l9_1747=float2(0.0);
l9_1747=l9_1742.Surface_UVCoord0;
l9_1741=l9_1747;
l9_1743=l9_1741;
}
}
}
l9_1737=l9_1743;
float2 l9_1748=float2(0.0);
float2 l9_1749=(*sc_set2.UserUniforms).uv2Scale;
l9_1748=l9_1749;
float2 l9_1750=float2(0.0);
l9_1750=l9_1748;
float2 l9_1751=float2(0.0);
float2 l9_1752=(*sc_set2.UserUniforms).uv2Offset;
l9_1751=l9_1752;
float2 l9_1753=float2(0.0);
l9_1753=l9_1751;
float2 l9_1754=float2(0.0);
l9_1754=(l9_1737*l9_1750)+l9_1753;
float2 l9_1755=float2(0.0);
l9_1755=l9_1754+(l9_1753*(l9_1735.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1733=l9_1755;
l9_1736=l9_1733;
}
else
{
float2 l9_1756=float2(0.0);
float2 l9_1757=float2(0.0);
float2 l9_1758=float2(0.0);
float2 l9_1759=float2(0.0);
float2 l9_1760=float2(0.0);
ssGlobals l9_1761=l9_1735;
float2 l9_1762;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1763=float2(0.0);
l9_1763=l9_1761.Surface_UVCoord0;
l9_1757=l9_1763;
l9_1762=l9_1757;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1764=float2(0.0);
l9_1764=l9_1761.Surface_UVCoord1;
l9_1758=l9_1764;
l9_1762=l9_1758;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1765=float2(0.0);
l9_1765=l9_1761.gScreenCoord;
l9_1759=l9_1765;
l9_1762=l9_1759;
}
else
{
float2 l9_1766=float2(0.0);
l9_1766=l9_1761.Surface_UVCoord0;
l9_1760=l9_1766;
l9_1762=l9_1760;
}
}
}
l9_1756=l9_1762;
float2 l9_1767=float2(0.0);
float2 l9_1768=(*sc_set2.UserUniforms).uv2Scale;
l9_1767=l9_1768;
float2 l9_1769=float2(0.0);
l9_1769=l9_1767;
float2 l9_1770=float2(0.0);
float2 l9_1771=(*sc_set2.UserUniforms).uv2Offset;
l9_1770=l9_1771;
float2 l9_1772=float2(0.0);
l9_1772=l9_1770;
float2 l9_1773=float2(0.0);
l9_1773=(l9_1756*l9_1769)+l9_1772;
l9_1734=l9_1773;
l9_1736=l9_1734;
}
l9_1732=l9_1736;
l9_1728=l9_1732;
l9_1731=l9_1728;
}
else
{
float2 l9_1774=float2(0.0);
l9_1774=l9_1730.Surface_UVCoord0;
l9_1729=l9_1774;
l9_1731=l9_1729;
}
l9_1727=l9_1731;
float2 l9_1775=float2(0.0);
l9_1775=l9_1727;
float2 l9_1776=float2(0.0);
l9_1776=l9_1775;
l9_1720=l9_1776;
l9_1724=l9_1720;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==3)
{
float2 l9_1777=float2(0.0);
float2 l9_1778=float2(0.0);
float2 l9_1779=float2(0.0);
ssGlobals l9_1780=l9_1723;
float2 l9_1781;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_1782=float2(0.0);
float2 l9_1783=float2(0.0);
float2 l9_1784=float2(0.0);
ssGlobals l9_1785=l9_1780;
float2 l9_1786;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_1787=float2(0.0);
float2 l9_1788=float2(0.0);
float2 l9_1789=float2(0.0);
float2 l9_1790=float2(0.0);
float2 l9_1791=float2(0.0);
float2 l9_1792=float2(0.0);
ssGlobals l9_1793=l9_1785;
float2 l9_1794;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1795=float2(0.0);
l9_1795=l9_1793.Surface_UVCoord0;
l9_1788=l9_1795;
l9_1794=l9_1788;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1796=float2(0.0);
l9_1796=l9_1793.Surface_UVCoord1;
l9_1789=l9_1796;
l9_1794=l9_1789;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1797=float2(0.0);
l9_1797=l9_1793.gScreenCoord;
l9_1790=l9_1797;
l9_1794=l9_1790;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1798=float2(0.0);
float2 l9_1799=float2(0.0);
float2 l9_1800=float2(0.0);
ssGlobals l9_1801=l9_1793;
float2 l9_1802;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1803=float2(0.0);
float2 l9_1804=float2(0.0);
float2 l9_1805=float2(0.0);
ssGlobals l9_1806=l9_1801;
float2 l9_1807;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1808=float2(0.0);
float2 l9_1809=float2(0.0);
float2 l9_1810=float2(0.0);
float2 l9_1811=float2(0.0);
float2 l9_1812=float2(0.0);
ssGlobals l9_1813=l9_1806;
float2 l9_1814;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1815=float2(0.0);
l9_1815=l9_1813.Surface_UVCoord0;
l9_1809=l9_1815;
l9_1814=l9_1809;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1816=float2(0.0);
l9_1816=l9_1813.Surface_UVCoord1;
l9_1810=l9_1816;
l9_1814=l9_1810;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1817=float2(0.0);
l9_1817=l9_1813.gScreenCoord;
l9_1811=l9_1817;
l9_1814=l9_1811;
}
else
{
float2 l9_1818=float2(0.0);
l9_1818=l9_1813.Surface_UVCoord0;
l9_1812=l9_1818;
l9_1814=l9_1812;
}
}
}
l9_1808=l9_1814;
float2 l9_1819=float2(0.0);
float2 l9_1820=(*sc_set2.UserUniforms).uv2Scale;
l9_1819=l9_1820;
float2 l9_1821=float2(0.0);
l9_1821=l9_1819;
float2 l9_1822=float2(0.0);
float2 l9_1823=(*sc_set2.UserUniforms).uv2Offset;
l9_1822=l9_1823;
float2 l9_1824=float2(0.0);
l9_1824=l9_1822;
float2 l9_1825=float2(0.0);
l9_1825=(l9_1808*l9_1821)+l9_1824;
float2 l9_1826=float2(0.0);
l9_1826=l9_1825+(l9_1824*(l9_1806.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1804=l9_1826;
l9_1807=l9_1804;
}
else
{
float2 l9_1827=float2(0.0);
float2 l9_1828=float2(0.0);
float2 l9_1829=float2(0.0);
float2 l9_1830=float2(0.0);
float2 l9_1831=float2(0.0);
ssGlobals l9_1832=l9_1806;
float2 l9_1833;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1834=float2(0.0);
l9_1834=l9_1832.Surface_UVCoord0;
l9_1828=l9_1834;
l9_1833=l9_1828;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1835=float2(0.0);
l9_1835=l9_1832.Surface_UVCoord1;
l9_1829=l9_1835;
l9_1833=l9_1829;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1836=float2(0.0);
l9_1836=l9_1832.gScreenCoord;
l9_1830=l9_1836;
l9_1833=l9_1830;
}
else
{
float2 l9_1837=float2(0.0);
l9_1837=l9_1832.Surface_UVCoord0;
l9_1831=l9_1837;
l9_1833=l9_1831;
}
}
}
l9_1827=l9_1833;
float2 l9_1838=float2(0.0);
float2 l9_1839=(*sc_set2.UserUniforms).uv2Scale;
l9_1838=l9_1839;
float2 l9_1840=float2(0.0);
l9_1840=l9_1838;
float2 l9_1841=float2(0.0);
float2 l9_1842=(*sc_set2.UserUniforms).uv2Offset;
l9_1841=l9_1842;
float2 l9_1843=float2(0.0);
l9_1843=l9_1841;
float2 l9_1844=float2(0.0);
l9_1844=(l9_1827*l9_1840)+l9_1843;
l9_1805=l9_1844;
l9_1807=l9_1805;
}
l9_1803=l9_1807;
l9_1799=l9_1803;
l9_1802=l9_1799;
}
else
{
float2 l9_1845=float2(0.0);
l9_1845=l9_1801.Surface_UVCoord0;
l9_1800=l9_1845;
l9_1802=l9_1800;
}
l9_1798=l9_1802;
float2 l9_1846=float2(0.0);
l9_1846=l9_1798;
float2 l9_1847=float2(0.0);
l9_1847=l9_1846;
l9_1791=l9_1847;
l9_1794=l9_1791;
}
else
{
float2 l9_1848=float2(0.0);
l9_1848=l9_1793.Surface_UVCoord0;
l9_1792=l9_1848;
l9_1794=l9_1792;
}
}
}
}
l9_1787=l9_1794;
float2 l9_1849=float2(0.0);
float2 l9_1850=(*sc_set2.UserUniforms).uv3Scale;
l9_1849=l9_1850;
float2 l9_1851=float2(0.0);
l9_1851=l9_1849;
float2 l9_1852=float2(0.0);
float2 l9_1853=(*sc_set2.UserUniforms).uv3Offset;
l9_1852=l9_1853;
float2 l9_1854=float2(0.0);
l9_1854=l9_1852;
float2 l9_1855=float2(0.0);
l9_1855=(l9_1787*l9_1851)+l9_1854;
float2 l9_1856=float2(0.0);
l9_1856=l9_1855+(l9_1854*(l9_1785.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_1783=l9_1856;
l9_1786=l9_1783;
}
else
{
float2 l9_1857=float2(0.0);
float2 l9_1858=float2(0.0);
float2 l9_1859=float2(0.0);
float2 l9_1860=float2(0.0);
float2 l9_1861=float2(0.0);
float2 l9_1862=float2(0.0);
ssGlobals l9_1863=l9_1785;
float2 l9_1864;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1865=float2(0.0);
l9_1865=l9_1863.Surface_UVCoord0;
l9_1858=l9_1865;
l9_1864=l9_1858;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1866=float2(0.0);
l9_1866=l9_1863.Surface_UVCoord1;
l9_1859=l9_1866;
l9_1864=l9_1859;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1867=float2(0.0);
l9_1867=l9_1863.gScreenCoord;
l9_1860=l9_1867;
l9_1864=l9_1860;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1868=float2(0.0);
float2 l9_1869=float2(0.0);
float2 l9_1870=float2(0.0);
ssGlobals l9_1871=l9_1863;
float2 l9_1872;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_1873=float2(0.0);
float2 l9_1874=float2(0.0);
float2 l9_1875=float2(0.0);
ssGlobals l9_1876=l9_1871;
float2 l9_1877;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_1878=float2(0.0);
float2 l9_1879=float2(0.0);
float2 l9_1880=float2(0.0);
float2 l9_1881=float2(0.0);
float2 l9_1882=float2(0.0);
ssGlobals l9_1883=l9_1876;
float2 l9_1884;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1885=float2(0.0);
l9_1885=l9_1883.Surface_UVCoord0;
l9_1879=l9_1885;
l9_1884=l9_1879;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1886=float2(0.0);
l9_1886=l9_1883.Surface_UVCoord1;
l9_1880=l9_1886;
l9_1884=l9_1880;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1887=float2(0.0);
l9_1887=l9_1883.gScreenCoord;
l9_1881=l9_1887;
l9_1884=l9_1881;
}
else
{
float2 l9_1888=float2(0.0);
l9_1888=l9_1883.Surface_UVCoord0;
l9_1882=l9_1888;
l9_1884=l9_1882;
}
}
}
l9_1878=l9_1884;
float2 l9_1889=float2(0.0);
float2 l9_1890=(*sc_set2.UserUniforms).uv2Scale;
l9_1889=l9_1890;
float2 l9_1891=float2(0.0);
l9_1891=l9_1889;
float2 l9_1892=float2(0.0);
float2 l9_1893=(*sc_set2.UserUniforms).uv2Offset;
l9_1892=l9_1893;
float2 l9_1894=float2(0.0);
l9_1894=l9_1892;
float2 l9_1895=float2(0.0);
l9_1895=(l9_1878*l9_1891)+l9_1894;
float2 l9_1896=float2(0.0);
l9_1896=l9_1895+(l9_1894*(l9_1876.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_1874=l9_1896;
l9_1877=l9_1874;
}
else
{
float2 l9_1897=float2(0.0);
float2 l9_1898=float2(0.0);
float2 l9_1899=float2(0.0);
float2 l9_1900=float2(0.0);
float2 l9_1901=float2(0.0);
ssGlobals l9_1902=l9_1876;
float2 l9_1903;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1904=float2(0.0);
l9_1904=l9_1902.Surface_UVCoord0;
l9_1898=l9_1904;
l9_1903=l9_1898;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1905=float2(0.0);
l9_1905=l9_1902.Surface_UVCoord1;
l9_1899=l9_1905;
l9_1903=l9_1899;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1906=float2(0.0);
l9_1906=l9_1902.gScreenCoord;
l9_1900=l9_1906;
l9_1903=l9_1900;
}
else
{
float2 l9_1907=float2(0.0);
l9_1907=l9_1902.Surface_UVCoord0;
l9_1901=l9_1907;
l9_1903=l9_1901;
}
}
}
l9_1897=l9_1903;
float2 l9_1908=float2(0.0);
float2 l9_1909=(*sc_set2.UserUniforms).uv2Scale;
l9_1908=l9_1909;
float2 l9_1910=float2(0.0);
l9_1910=l9_1908;
float2 l9_1911=float2(0.0);
float2 l9_1912=(*sc_set2.UserUniforms).uv2Offset;
l9_1911=l9_1912;
float2 l9_1913=float2(0.0);
l9_1913=l9_1911;
float2 l9_1914=float2(0.0);
l9_1914=(l9_1897*l9_1910)+l9_1913;
l9_1875=l9_1914;
l9_1877=l9_1875;
}
l9_1873=l9_1877;
l9_1869=l9_1873;
l9_1872=l9_1869;
}
else
{
float2 l9_1915=float2(0.0);
l9_1915=l9_1871.Surface_UVCoord0;
l9_1870=l9_1915;
l9_1872=l9_1870;
}
l9_1868=l9_1872;
float2 l9_1916=float2(0.0);
l9_1916=l9_1868;
float2 l9_1917=float2(0.0);
l9_1917=l9_1916;
l9_1861=l9_1917;
l9_1864=l9_1861;
}
else
{
float2 l9_1918=float2(0.0);
l9_1918=l9_1863.Surface_UVCoord0;
l9_1862=l9_1918;
l9_1864=l9_1862;
}
}
}
}
l9_1857=l9_1864;
float2 l9_1919=float2(0.0);
float2 l9_1920=(*sc_set2.UserUniforms).uv3Scale;
l9_1919=l9_1920;
float2 l9_1921=float2(0.0);
l9_1921=l9_1919;
float2 l9_1922=float2(0.0);
float2 l9_1923=(*sc_set2.UserUniforms).uv3Offset;
l9_1922=l9_1923;
float2 l9_1924=float2(0.0);
l9_1924=l9_1922;
float2 l9_1925=float2(0.0);
l9_1925=(l9_1857*l9_1921)+l9_1924;
l9_1784=l9_1925;
l9_1786=l9_1784;
}
l9_1782=l9_1786;
l9_1778=l9_1782;
l9_1781=l9_1778;
}
else
{
float2 l9_1926=float2(0.0);
l9_1926=l9_1780.Surface_UVCoord0;
l9_1779=l9_1926;
l9_1781=l9_1779;
}
l9_1777=l9_1781;
float2 l9_1927=float2(0.0);
l9_1927=l9_1777;
float2 l9_1928=float2(0.0);
l9_1928=l9_1927;
l9_1721=l9_1928;
l9_1724=l9_1721;
}
else
{
float2 l9_1929=float2(0.0);
l9_1929=l9_1723.Surface_UVCoord0;
l9_1722=l9_1929;
l9_1724=l9_1722;
}
}
}
}
l9_1717=l9_1724;
float4 l9_1930=float4(0.0);
int l9_1931=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_1932=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1932=0;
}
else
{
l9_1932=in.varStereoViewID;
}
int l9_1933=l9_1932;
l9_1931=1-l9_1933;
}
else
{
int l9_1934=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1934=0;
}
else
{
l9_1934=in.varStereoViewID;
}
int l9_1935=l9_1934;
l9_1931=l9_1935;
}
int l9_1936=l9_1931;
int l9_1937=opacityTexLayout_tmp;
int l9_1938=l9_1936;
float2 l9_1939=l9_1717;
bool l9_1940=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_1941=(*sc_set2.UserUniforms).opacityTexTransform;
int2 l9_1942=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_1943=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_1944=(*sc_set2.UserUniforms).opacityTexUvMinMax;
bool l9_1945=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_1946=(*sc_set2.UserUniforms).opacityTexBorderColor;
float l9_1947=0.0;
bool l9_1948=l9_1945&&(!l9_1943);
float l9_1949=1.0;
float l9_1950=l9_1939.x;
int l9_1951=l9_1942.x;
if (l9_1951==1)
{
l9_1950=fract(l9_1950);
}
else
{
if (l9_1951==2)
{
float l9_1952=fract(l9_1950);
float l9_1953=l9_1950-l9_1952;
float l9_1954=step(0.25,fract(l9_1953*0.5));
l9_1950=mix(l9_1952,1.0-l9_1952,fast::clamp(l9_1954,0.0,1.0));
}
}
l9_1939.x=l9_1950;
float l9_1955=l9_1939.y;
int l9_1956=l9_1942.y;
if (l9_1956==1)
{
l9_1955=fract(l9_1955);
}
else
{
if (l9_1956==2)
{
float l9_1957=fract(l9_1955);
float l9_1958=l9_1955-l9_1957;
float l9_1959=step(0.25,fract(l9_1958*0.5));
l9_1955=mix(l9_1957,1.0-l9_1957,fast::clamp(l9_1959,0.0,1.0));
}
}
l9_1939.y=l9_1955;
if (l9_1943)
{
bool l9_1960=l9_1945;
bool l9_1961;
if (l9_1960)
{
l9_1961=l9_1942.x==3;
}
else
{
l9_1961=l9_1960;
}
float l9_1962=l9_1939.x;
float l9_1963=l9_1944.x;
float l9_1964=l9_1944.z;
bool l9_1965=l9_1961;
float l9_1966=l9_1949;
float l9_1967=fast::clamp(l9_1962,l9_1963,l9_1964);
float l9_1968=step(abs(l9_1962-l9_1967),9.9999997e-06);
l9_1966*=(l9_1968+((1.0-float(l9_1965))*(1.0-l9_1968)));
l9_1962=l9_1967;
l9_1939.x=l9_1962;
l9_1949=l9_1966;
bool l9_1969=l9_1945;
bool l9_1970;
if (l9_1969)
{
l9_1970=l9_1942.y==3;
}
else
{
l9_1970=l9_1969;
}
float l9_1971=l9_1939.y;
float l9_1972=l9_1944.y;
float l9_1973=l9_1944.w;
bool l9_1974=l9_1970;
float l9_1975=l9_1949;
float l9_1976=fast::clamp(l9_1971,l9_1972,l9_1973);
float l9_1977=step(abs(l9_1971-l9_1976),9.9999997e-06);
l9_1975*=(l9_1977+((1.0-float(l9_1974))*(1.0-l9_1977)));
l9_1971=l9_1976;
l9_1939.y=l9_1971;
l9_1949=l9_1975;
}
float2 l9_1978=l9_1939;
bool l9_1979=l9_1940;
float3x3 l9_1980=l9_1941;
if (l9_1979)
{
l9_1978=float2((l9_1980*float3(l9_1978,1.0)).xy);
}
float2 l9_1981=l9_1978;
float2 l9_1982=l9_1981;
float2 l9_1983=l9_1982;
l9_1939=l9_1983;
float l9_1984=l9_1939.x;
int l9_1985=l9_1942.x;
bool l9_1986=l9_1948;
float l9_1987=l9_1949;
if ((l9_1985==0)||(l9_1985==3))
{
float l9_1988=l9_1984;
float l9_1989=0.0;
float l9_1990=1.0;
bool l9_1991=l9_1986;
float l9_1992=l9_1987;
float l9_1993=fast::clamp(l9_1988,l9_1989,l9_1990);
float l9_1994=step(abs(l9_1988-l9_1993),9.9999997e-06);
l9_1992*=(l9_1994+((1.0-float(l9_1991))*(1.0-l9_1994)));
l9_1988=l9_1993;
l9_1984=l9_1988;
l9_1987=l9_1992;
}
l9_1939.x=l9_1984;
l9_1949=l9_1987;
float l9_1995=l9_1939.y;
int l9_1996=l9_1942.y;
bool l9_1997=l9_1948;
float l9_1998=l9_1949;
if ((l9_1996==0)||(l9_1996==3))
{
float l9_1999=l9_1995;
float l9_2000=0.0;
float l9_2001=1.0;
bool l9_2002=l9_1997;
float l9_2003=l9_1998;
float l9_2004=fast::clamp(l9_1999,l9_2000,l9_2001);
float l9_2005=step(abs(l9_1999-l9_2004),9.9999997e-06);
l9_2003*=(l9_2005+((1.0-float(l9_2002))*(1.0-l9_2005)));
l9_1999=l9_2004;
l9_1995=l9_1999;
l9_1998=l9_2003;
}
l9_1939.y=l9_1995;
l9_1949=l9_1998;
float2 l9_2006=l9_1939;
int l9_2007=l9_1937;
int l9_2008=l9_1938;
float l9_2009=l9_1947;
float2 l9_2010=l9_2006;
int l9_2011=l9_2007;
int l9_2012=l9_2008;
float3 l9_2013=float3(0.0);
if (l9_2011==0)
{
l9_2013=float3(l9_2010,0.0);
}
else
{
if (l9_2011==1)
{
l9_2013=float3(l9_2010.x,(l9_2010.y*0.5)+(0.5-(float(l9_2012)*0.5)),0.0);
}
else
{
l9_2013=float3(l9_2010,float(l9_2012));
}
}
float3 l9_2014=l9_2013;
float3 l9_2015=l9_2014;
float2 l9_2016=l9_2015.xy;
float l9_2017=l9_2009;
float4 l9_2018=sc_set2.opacityTex.sample(sc_set2.opacityTexSmpSC,l9_2016,bias(l9_2017));
float4 l9_2019=l9_2018;
float4 l9_2020=l9_2019;
if (l9_1945)
{
l9_2020=mix(l9_1946,l9_2020,float4(l9_1949));
}
float4 l9_2021=l9_2020;
l9_1930=l9_2021;
float l9_2022=0.0;
l9_2022=l9_1930.x;
param_18=l9_2022;
param_20=param_18;
}
else
{
param_20=param_19;
}
Result_N204=param_20;
float Output_N72=0.0;
float param_22=1.0;
float param_23=(*sc_set2.UserUniforms).Port_Input2_N072;
ssGlobals param_25=Globals;
float param_24;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_2023=float4(0.0);
l9_2023=param_25.VertexColor;
float l9_2024=0.0;
l9_2024=l9_2023.w;
param_22=l9_2024;
param_24=param_22;
}
else
{
param_24=param_23;
}
Output_N72=param_24;
float Output_N205=0.0;
Output_N205=(Output_N168*Result_N204)*Output_N72;
float Export_N158=0.0;
Export_N158=Output_N205;
float3 Result_N337=float3(0.0);
float3 param_26=float3(0.0);
float3 param_27=float3(0.0);
ssGlobals param_29=Globals;
float3 param_28;
if ((int(ENABLE_NORMALMAP_tmp)!=0))
{
float3 l9_2025=float3(0.0);
l9_2025=param_29.VertexTangent_WorldSpace;
float3 l9_2026=float3(0.0);
l9_2026=param_29.VertexBinormal_WorldSpace;
float3 l9_2027=float3(0.0);
l9_2027=param_29.VertexNormal_WorldSpace;
float3x3 l9_2028=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_2028=float3x3(float3(l9_2025),float3(l9_2026),float3(l9_2027));
float2 l9_2029=float2(0.0);
float2 l9_2030=float2(0.0);
float2 l9_2031=float2(0.0);
float2 l9_2032=float2(0.0);
float2 l9_2033=float2(0.0);
float2 l9_2034=float2(0.0);
ssGlobals l9_2035=param_29;
float2 l9_2036;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_2037=float2(0.0);
l9_2037=l9_2035.Surface_UVCoord0;
l9_2030=l9_2037;
l9_2036=l9_2030;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_2038=float2(0.0);
l9_2038=l9_2035.Surface_UVCoord1;
l9_2031=l9_2038;
l9_2036=l9_2031;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_2039=float2(0.0);
float2 l9_2040=float2(0.0);
float2 l9_2041=float2(0.0);
ssGlobals l9_2042=l9_2035;
float2 l9_2043;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2044=float2(0.0);
float2 l9_2045=float2(0.0);
float2 l9_2046=float2(0.0);
ssGlobals l9_2047=l9_2042;
float2 l9_2048;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2049=float2(0.0);
float2 l9_2050=float2(0.0);
float2 l9_2051=float2(0.0);
float2 l9_2052=float2(0.0);
float2 l9_2053=float2(0.0);
ssGlobals l9_2054=l9_2047;
float2 l9_2055;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2056=float2(0.0);
l9_2056=l9_2054.Surface_UVCoord0;
l9_2050=l9_2056;
l9_2055=l9_2050;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2057=float2(0.0);
l9_2057=l9_2054.Surface_UVCoord1;
l9_2051=l9_2057;
l9_2055=l9_2051;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2058=float2(0.0);
l9_2058=l9_2054.gScreenCoord;
l9_2052=l9_2058;
l9_2055=l9_2052;
}
else
{
float2 l9_2059=float2(0.0);
l9_2059=l9_2054.Surface_UVCoord0;
l9_2053=l9_2059;
l9_2055=l9_2053;
}
}
}
l9_2049=l9_2055;
float2 l9_2060=float2(0.0);
float2 l9_2061=(*sc_set2.UserUniforms).uv2Scale;
l9_2060=l9_2061;
float2 l9_2062=float2(0.0);
l9_2062=l9_2060;
float2 l9_2063=float2(0.0);
float2 l9_2064=(*sc_set2.UserUniforms).uv2Offset;
l9_2063=l9_2064;
float2 l9_2065=float2(0.0);
l9_2065=l9_2063;
float2 l9_2066=float2(0.0);
l9_2066=(l9_2049*l9_2062)+l9_2065;
float2 l9_2067=float2(0.0);
l9_2067=l9_2066+(l9_2065*(l9_2047.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2045=l9_2067;
l9_2048=l9_2045;
}
else
{
float2 l9_2068=float2(0.0);
float2 l9_2069=float2(0.0);
float2 l9_2070=float2(0.0);
float2 l9_2071=float2(0.0);
float2 l9_2072=float2(0.0);
ssGlobals l9_2073=l9_2047;
float2 l9_2074;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2075=float2(0.0);
l9_2075=l9_2073.Surface_UVCoord0;
l9_2069=l9_2075;
l9_2074=l9_2069;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2076=float2(0.0);
l9_2076=l9_2073.Surface_UVCoord1;
l9_2070=l9_2076;
l9_2074=l9_2070;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2077=float2(0.0);
l9_2077=l9_2073.gScreenCoord;
l9_2071=l9_2077;
l9_2074=l9_2071;
}
else
{
float2 l9_2078=float2(0.0);
l9_2078=l9_2073.Surface_UVCoord0;
l9_2072=l9_2078;
l9_2074=l9_2072;
}
}
}
l9_2068=l9_2074;
float2 l9_2079=float2(0.0);
float2 l9_2080=(*sc_set2.UserUniforms).uv2Scale;
l9_2079=l9_2080;
float2 l9_2081=float2(0.0);
l9_2081=l9_2079;
float2 l9_2082=float2(0.0);
float2 l9_2083=(*sc_set2.UserUniforms).uv2Offset;
l9_2082=l9_2083;
float2 l9_2084=float2(0.0);
l9_2084=l9_2082;
float2 l9_2085=float2(0.0);
l9_2085=(l9_2068*l9_2081)+l9_2084;
l9_2046=l9_2085;
l9_2048=l9_2046;
}
l9_2044=l9_2048;
l9_2040=l9_2044;
l9_2043=l9_2040;
}
else
{
float2 l9_2086=float2(0.0);
l9_2086=l9_2042.Surface_UVCoord0;
l9_2041=l9_2086;
l9_2043=l9_2041;
}
l9_2039=l9_2043;
float2 l9_2087=float2(0.0);
l9_2087=l9_2039;
float2 l9_2088=float2(0.0);
l9_2088=l9_2087;
l9_2032=l9_2088;
l9_2036=l9_2032;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_2089=float2(0.0);
float2 l9_2090=float2(0.0);
float2 l9_2091=float2(0.0);
ssGlobals l9_2092=l9_2035;
float2 l9_2093;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2094=float2(0.0);
float2 l9_2095=float2(0.0);
float2 l9_2096=float2(0.0);
ssGlobals l9_2097=l9_2092;
float2 l9_2098;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_2099=float2(0.0);
float2 l9_2100=float2(0.0);
float2 l9_2101=float2(0.0);
float2 l9_2102=float2(0.0);
float2 l9_2103=float2(0.0);
float2 l9_2104=float2(0.0);
ssGlobals l9_2105=l9_2097;
float2 l9_2106;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2107=float2(0.0);
l9_2107=l9_2105.Surface_UVCoord0;
l9_2100=l9_2107;
l9_2106=l9_2100;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2108=float2(0.0);
l9_2108=l9_2105.Surface_UVCoord1;
l9_2101=l9_2108;
l9_2106=l9_2101;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2109=float2(0.0);
l9_2109=l9_2105.gScreenCoord;
l9_2102=l9_2109;
l9_2106=l9_2102;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2110=float2(0.0);
float2 l9_2111=float2(0.0);
float2 l9_2112=float2(0.0);
ssGlobals l9_2113=l9_2105;
float2 l9_2114;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2115=float2(0.0);
float2 l9_2116=float2(0.0);
float2 l9_2117=float2(0.0);
ssGlobals l9_2118=l9_2113;
float2 l9_2119;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2120=float2(0.0);
float2 l9_2121=float2(0.0);
float2 l9_2122=float2(0.0);
float2 l9_2123=float2(0.0);
float2 l9_2124=float2(0.0);
ssGlobals l9_2125=l9_2118;
float2 l9_2126;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2127=float2(0.0);
l9_2127=l9_2125.Surface_UVCoord0;
l9_2121=l9_2127;
l9_2126=l9_2121;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2128=float2(0.0);
l9_2128=l9_2125.Surface_UVCoord1;
l9_2122=l9_2128;
l9_2126=l9_2122;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2129=float2(0.0);
l9_2129=l9_2125.gScreenCoord;
l9_2123=l9_2129;
l9_2126=l9_2123;
}
else
{
float2 l9_2130=float2(0.0);
l9_2130=l9_2125.Surface_UVCoord0;
l9_2124=l9_2130;
l9_2126=l9_2124;
}
}
}
l9_2120=l9_2126;
float2 l9_2131=float2(0.0);
float2 l9_2132=(*sc_set2.UserUniforms).uv2Scale;
l9_2131=l9_2132;
float2 l9_2133=float2(0.0);
l9_2133=l9_2131;
float2 l9_2134=float2(0.0);
float2 l9_2135=(*sc_set2.UserUniforms).uv2Offset;
l9_2134=l9_2135;
float2 l9_2136=float2(0.0);
l9_2136=l9_2134;
float2 l9_2137=float2(0.0);
l9_2137=(l9_2120*l9_2133)+l9_2136;
float2 l9_2138=float2(0.0);
l9_2138=l9_2137+(l9_2136*(l9_2118.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2116=l9_2138;
l9_2119=l9_2116;
}
else
{
float2 l9_2139=float2(0.0);
float2 l9_2140=float2(0.0);
float2 l9_2141=float2(0.0);
float2 l9_2142=float2(0.0);
float2 l9_2143=float2(0.0);
ssGlobals l9_2144=l9_2118;
float2 l9_2145;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2146=float2(0.0);
l9_2146=l9_2144.Surface_UVCoord0;
l9_2140=l9_2146;
l9_2145=l9_2140;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2147=float2(0.0);
l9_2147=l9_2144.Surface_UVCoord1;
l9_2141=l9_2147;
l9_2145=l9_2141;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2148=float2(0.0);
l9_2148=l9_2144.gScreenCoord;
l9_2142=l9_2148;
l9_2145=l9_2142;
}
else
{
float2 l9_2149=float2(0.0);
l9_2149=l9_2144.Surface_UVCoord0;
l9_2143=l9_2149;
l9_2145=l9_2143;
}
}
}
l9_2139=l9_2145;
float2 l9_2150=float2(0.0);
float2 l9_2151=(*sc_set2.UserUniforms).uv2Scale;
l9_2150=l9_2151;
float2 l9_2152=float2(0.0);
l9_2152=l9_2150;
float2 l9_2153=float2(0.0);
float2 l9_2154=(*sc_set2.UserUniforms).uv2Offset;
l9_2153=l9_2154;
float2 l9_2155=float2(0.0);
l9_2155=l9_2153;
float2 l9_2156=float2(0.0);
l9_2156=(l9_2139*l9_2152)+l9_2155;
l9_2117=l9_2156;
l9_2119=l9_2117;
}
l9_2115=l9_2119;
l9_2111=l9_2115;
l9_2114=l9_2111;
}
else
{
float2 l9_2157=float2(0.0);
l9_2157=l9_2113.Surface_UVCoord0;
l9_2112=l9_2157;
l9_2114=l9_2112;
}
l9_2110=l9_2114;
float2 l9_2158=float2(0.0);
l9_2158=l9_2110;
float2 l9_2159=float2(0.0);
l9_2159=l9_2158;
l9_2103=l9_2159;
l9_2106=l9_2103;
}
else
{
float2 l9_2160=float2(0.0);
l9_2160=l9_2105.Surface_UVCoord0;
l9_2104=l9_2160;
l9_2106=l9_2104;
}
}
}
}
l9_2099=l9_2106;
float2 l9_2161=float2(0.0);
float2 l9_2162=(*sc_set2.UserUniforms).uv3Scale;
l9_2161=l9_2162;
float2 l9_2163=float2(0.0);
l9_2163=l9_2161;
float2 l9_2164=float2(0.0);
float2 l9_2165=(*sc_set2.UserUniforms).uv3Offset;
l9_2164=l9_2165;
float2 l9_2166=float2(0.0);
l9_2166=l9_2164;
float2 l9_2167=float2(0.0);
l9_2167=(l9_2099*l9_2163)+l9_2166;
float2 l9_2168=float2(0.0);
l9_2168=l9_2167+(l9_2166*(l9_2097.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_2095=l9_2168;
l9_2098=l9_2095;
}
else
{
float2 l9_2169=float2(0.0);
float2 l9_2170=float2(0.0);
float2 l9_2171=float2(0.0);
float2 l9_2172=float2(0.0);
float2 l9_2173=float2(0.0);
float2 l9_2174=float2(0.0);
ssGlobals l9_2175=l9_2097;
float2 l9_2176;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2177=float2(0.0);
l9_2177=l9_2175.Surface_UVCoord0;
l9_2170=l9_2177;
l9_2176=l9_2170;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2178=float2(0.0);
l9_2178=l9_2175.Surface_UVCoord1;
l9_2171=l9_2178;
l9_2176=l9_2171;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2179=float2(0.0);
l9_2179=l9_2175.gScreenCoord;
l9_2172=l9_2179;
l9_2176=l9_2172;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2180=float2(0.0);
float2 l9_2181=float2(0.0);
float2 l9_2182=float2(0.0);
ssGlobals l9_2183=l9_2175;
float2 l9_2184;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2185=float2(0.0);
float2 l9_2186=float2(0.0);
float2 l9_2187=float2(0.0);
ssGlobals l9_2188=l9_2183;
float2 l9_2189;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2190=float2(0.0);
float2 l9_2191=float2(0.0);
float2 l9_2192=float2(0.0);
float2 l9_2193=float2(0.0);
float2 l9_2194=float2(0.0);
ssGlobals l9_2195=l9_2188;
float2 l9_2196;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2197=float2(0.0);
l9_2197=l9_2195.Surface_UVCoord0;
l9_2191=l9_2197;
l9_2196=l9_2191;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2198=float2(0.0);
l9_2198=l9_2195.Surface_UVCoord1;
l9_2192=l9_2198;
l9_2196=l9_2192;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2199=float2(0.0);
l9_2199=l9_2195.gScreenCoord;
l9_2193=l9_2199;
l9_2196=l9_2193;
}
else
{
float2 l9_2200=float2(0.0);
l9_2200=l9_2195.Surface_UVCoord0;
l9_2194=l9_2200;
l9_2196=l9_2194;
}
}
}
l9_2190=l9_2196;
float2 l9_2201=float2(0.0);
float2 l9_2202=(*sc_set2.UserUniforms).uv2Scale;
l9_2201=l9_2202;
float2 l9_2203=float2(0.0);
l9_2203=l9_2201;
float2 l9_2204=float2(0.0);
float2 l9_2205=(*sc_set2.UserUniforms).uv2Offset;
l9_2204=l9_2205;
float2 l9_2206=float2(0.0);
l9_2206=l9_2204;
float2 l9_2207=float2(0.0);
l9_2207=(l9_2190*l9_2203)+l9_2206;
float2 l9_2208=float2(0.0);
l9_2208=l9_2207+(l9_2206*(l9_2188.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2186=l9_2208;
l9_2189=l9_2186;
}
else
{
float2 l9_2209=float2(0.0);
float2 l9_2210=float2(0.0);
float2 l9_2211=float2(0.0);
float2 l9_2212=float2(0.0);
float2 l9_2213=float2(0.0);
ssGlobals l9_2214=l9_2188;
float2 l9_2215;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2216=float2(0.0);
l9_2216=l9_2214.Surface_UVCoord0;
l9_2210=l9_2216;
l9_2215=l9_2210;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2217=float2(0.0);
l9_2217=l9_2214.Surface_UVCoord1;
l9_2211=l9_2217;
l9_2215=l9_2211;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2218=float2(0.0);
l9_2218=l9_2214.gScreenCoord;
l9_2212=l9_2218;
l9_2215=l9_2212;
}
else
{
float2 l9_2219=float2(0.0);
l9_2219=l9_2214.Surface_UVCoord0;
l9_2213=l9_2219;
l9_2215=l9_2213;
}
}
}
l9_2209=l9_2215;
float2 l9_2220=float2(0.0);
float2 l9_2221=(*sc_set2.UserUniforms).uv2Scale;
l9_2220=l9_2221;
float2 l9_2222=float2(0.0);
l9_2222=l9_2220;
float2 l9_2223=float2(0.0);
float2 l9_2224=(*sc_set2.UserUniforms).uv2Offset;
l9_2223=l9_2224;
float2 l9_2225=float2(0.0);
l9_2225=l9_2223;
float2 l9_2226=float2(0.0);
l9_2226=(l9_2209*l9_2222)+l9_2225;
l9_2187=l9_2226;
l9_2189=l9_2187;
}
l9_2185=l9_2189;
l9_2181=l9_2185;
l9_2184=l9_2181;
}
else
{
float2 l9_2227=float2(0.0);
l9_2227=l9_2183.Surface_UVCoord0;
l9_2182=l9_2227;
l9_2184=l9_2182;
}
l9_2180=l9_2184;
float2 l9_2228=float2(0.0);
l9_2228=l9_2180;
float2 l9_2229=float2(0.0);
l9_2229=l9_2228;
l9_2173=l9_2229;
l9_2176=l9_2173;
}
else
{
float2 l9_2230=float2(0.0);
l9_2230=l9_2175.Surface_UVCoord0;
l9_2174=l9_2230;
l9_2176=l9_2174;
}
}
}
}
l9_2169=l9_2176;
float2 l9_2231=float2(0.0);
float2 l9_2232=(*sc_set2.UserUniforms).uv3Scale;
l9_2231=l9_2232;
float2 l9_2233=float2(0.0);
l9_2233=l9_2231;
float2 l9_2234=float2(0.0);
float2 l9_2235=(*sc_set2.UserUniforms).uv3Offset;
l9_2234=l9_2235;
float2 l9_2236=float2(0.0);
l9_2236=l9_2234;
float2 l9_2237=float2(0.0);
l9_2237=(l9_2169*l9_2233)+l9_2236;
l9_2096=l9_2237;
l9_2098=l9_2096;
}
l9_2094=l9_2098;
l9_2090=l9_2094;
l9_2093=l9_2090;
}
else
{
float2 l9_2238=float2(0.0);
l9_2238=l9_2092.Surface_UVCoord0;
l9_2091=l9_2238;
l9_2093=l9_2091;
}
l9_2089=l9_2093;
float2 l9_2239=float2(0.0);
l9_2239=l9_2089;
float2 l9_2240=float2(0.0);
l9_2240=l9_2239;
l9_2033=l9_2240;
l9_2036=l9_2033;
}
else
{
float2 l9_2241=float2(0.0);
l9_2241=l9_2035.Surface_UVCoord0;
l9_2034=l9_2241;
l9_2036=l9_2034;
}
}
}
}
l9_2029=l9_2036;
float4 l9_2242=float4(0.0);
float2 l9_2243=l9_2029;
int l9_2244=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_2245=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2245=0;
}
else
{
l9_2245=in.varStereoViewID;
}
int l9_2246=l9_2245;
l9_2244=1-l9_2246;
}
else
{
int l9_2247=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2247=0;
}
else
{
l9_2247=in.varStereoViewID;
}
int l9_2248=l9_2247;
l9_2244=l9_2248;
}
int l9_2249=l9_2244;
int l9_2250=normalTexLayout_tmp;
int l9_2251=l9_2249;
float2 l9_2252=l9_2243;
bool l9_2253=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_2254=(*sc_set2.UserUniforms).normalTexTransform;
int2 l9_2255=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_2256=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_2257=(*sc_set2.UserUniforms).normalTexUvMinMax;
bool l9_2258=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_2259=(*sc_set2.UserUniforms).normalTexBorderColor;
float l9_2260=0.0;
bool l9_2261=l9_2258&&(!l9_2256);
float l9_2262=1.0;
float l9_2263=l9_2252.x;
int l9_2264=l9_2255.x;
if (l9_2264==1)
{
l9_2263=fract(l9_2263);
}
else
{
if (l9_2264==2)
{
float l9_2265=fract(l9_2263);
float l9_2266=l9_2263-l9_2265;
float l9_2267=step(0.25,fract(l9_2266*0.5));
l9_2263=mix(l9_2265,1.0-l9_2265,fast::clamp(l9_2267,0.0,1.0));
}
}
l9_2252.x=l9_2263;
float l9_2268=l9_2252.y;
int l9_2269=l9_2255.y;
if (l9_2269==1)
{
l9_2268=fract(l9_2268);
}
else
{
if (l9_2269==2)
{
float l9_2270=fract(l9_2268);
float l9_2271=l9_2268-l9_2270;
float l9_2272=step(0.25,fract(l9_2271*0.5));
l9_2268=mix(l9_2270,1.0-l9_2270,fast::clamp(l9_2272,0.0,1.0));
}
}
l9_2252.y=l9_2268;
if (l9_2256)
{
bool l9_2273=l9_2258;
bool l9_2274;
if (l9_2273)
{
l9_2274=l9_2255.x==3;
}
else
{
l9_2274=l9_2273;
}
float l9_2275=l9_2252.x;
float l9_2276=l9_2257.x;
float l9_2277=l9_2257.z;
bool l9_2278=l9_2274;
float l9_2279=l9_2262;
float l9_2280=fast::clamp(l9_2275,l9_2276,l9_2277);
float l9_2281=step(abs(l9_2275-l9_2280),9.9999997e-06);
l9_2279*=(l9_2281+((1.0-float(l9_2278))*(1.0-l9_2281)));
l9_2275=l9_2280;
l9_2252.x=l9_2275;
l9_2262=l9_2279;
bool l9_2282=l9_2258;
bool l9_2283;
if (l9_2282)
{
l9_2283=l9_2255.y==3;
}
else
{
l9_2283=l9_2282;
}
float l9_2284=l9_2252.y;
float l9_2285=l9_2257.y;
float l9_2286=l9_2257.w;
bool l9_2287=l9_2283;
float l9_2288=l9_2262;
float l9_2289=fast::clamp(l9_2284,l9_2285,l9_2286);
float l9_2290=step(abs(l9_2284-l9_2289),9.9999997e-06);
l9_2288*=(l9_2290+((1.0-float(l9_2287))*(1.0-l9_2290)));
l9_2284=l9_2289;
l9_2252.y=l9_2284;
l9_2262=l9_2288;
}
float2 l9_2291=l9_2252;
bool l9_2292=l9_2253;
float3x3 l9_2293=l9_2254;
if (l9_2292)
{
l9_2291=float2((l9_2293*float3(l9_2291,1.0)).xy);
}
float2 l9_2294=l9_2291;
float2 l9_2295=l9_2294;
float2 l9_2296=l9_2295;
l9_2252=l9_2296;
float l9_2297=l9_2252.x;
int l9_2298=l9_2255.x;
bool l9_2299=l9_2261;
float l9_2300=l9_2262;
if ((l9_2298==0)||(l9_2298==3))
{
float l9_2301=l9_2297;
float l9_2302=0.0;
float l9_2303=1.0;
bool l9_2304=l9_2299;
float l9_2305=l9_2300;
float l9_2306=fast::clamp(l9_2301,l9_2302,l9_2303);
float l9_2307=step(abs(l9_2301-l9_2306),9.9999997e-06);
l9_2305*=(l9_2307+((1.0-float(l9_2304))*(1.0-l9_2307)));
l9_2301=l9_2306;
l9_2297=l9_2301;
l9_2300=l9_2305;
}
l9_2252.x=l9_2297;
l9_2262=l9_2300;
float l9_2308=l9_2252.y;
int l9_2309=l9_2255.y;
bool l9_2310=l9_2261;
float l9_2311=l9_2262;
if ((l9_2309==0)||(l9_2309==3))
{
float l9_2312=l9_2308;
float l9_2313=0.0;
float l9_2314=1.0;
bool l9_2315=l9_2310;
float l9_2316=l9_2311;
float l9_2317=fast::clamp(l9_2312,l9_2313,l9_2314);
float l9_2318=step(abs(l9_2312-l9_2317),9.9999997e-06);
l9_2316*=(l9_2318+((1.0-float(l9_2315))*(1.0-l9_2318)));
l9_2312=l9_2317;
l9_2308=l9_2312;
l9_2311=l9_2316;
}
l9_2252.y=l9_2308;
l9_2262=l9_2311;
float2 l9_2319=l9_2252;
int l9_2320=l9_2250;
int l9_2321=l9_2251;
float l9_2322=l9_2260;
float2 l9_2323=l9_2319;
int l9_2324=l9_2320;
int l9_2325=l9_2321;
float3 l9_2326=float3(0.0);
if (l9_2324==0)
{
l9_2326=float3(l9_2323,0.0);
}
else
{
if (l9_2324==1)
{
l9_2326=float3(l9_2323.x,(l9_2323.y*0.5)+(0.5-(float(l9_2325)*0.5)),0.0);
}
else
{
l9_2326=float3(l9_2323,float(l9_2325));
}
}
float3 l9_2327=l9_2326;
float3 l9_2328=l9_2327;
float2 l9_2329=l9_2328.xy;
float l9_2330=l9_2322;
float4 l9_2331=sc_set2.normalTex.sample(sc_set2.normalTexSmpSC,l9_2329,bias(l9_2330));
float4 l9_2332=l9_2331;
float4 l9_2333=l9_2332;
if (l9_2258)
{
l9_2333=mix(l9_2259,l9_2333,float4(l9_2262));
}
float4 l9_2334=l9_2333;
float4 l9_2335=l9_2334;
float3 l9_2336=(l9_2335.xyz*1.9921875)-float3(1.0);
l9_2335=float4(l9_2336.x,l9_2336.y,l9_2336.z,l9_2335.w);
l9_2242=l9_2335;
float3 l9_2337=float3(0.0);
float3 l9_2338=float3(0.0);
float3 l9_2339=(*sc_set2.UserUniforms).Port_Default_N113;
ssGlobals l9_2340=param_29;
float3 l9_2341;
if ((int(ENABLE_DETAIL_NORMAL_tmp)!=0))
{
float2 l9_2342=float2(0.0);
float2 l9_2343=float2(0.0);
float2 l9_2344=float2(0.0);
float2 l9_2345=float2(0.0);
float2 l9_2346=float2(0.0);
float2 l9_2347=float2(0.0);
ssGlobals l9_2348=l9_2340;
float2 l9_2349;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_2350=float2(0.0);
l9_2350=l9_2348.Surface_UVCoord0;
l9_2343=l9_2350;
l9_2349=l9_2343;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_2351=float2(0.0);
l9_2351=l9_2348.Surface_UVCoord1;
l9_2344=l9_2351;
l9_2349=l9_2344;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_2352=float2(0.0);
float2 l9_2353=float2(0.0);
float2 l9_2354=float2(0.0);
ssGlobals l9_2355=l9_2348;
float2 l9_2356;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2357=float2(0.0);
float2 l9_2358=float2(0.0);
float2 l9_2359=float2(0.0);
ssGlobals l9_2360=l9_2355;
float2 l9_2361;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2362=float2(0.0);
float2 l9_2363=float2(0.0);
float2 l9_2364=float2(0.0);
float2 l9_2365=float2(0.0);
float2 l9_2366=float2(0.0);
ssGlobals l9_2367=l9_2360;
float2 l9_2368;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2369=float2(0.0);
l9_2369=l9_2367.Surface_UVCoord0;
l9_2363=l9_2369;
l9_2368=l9_2363;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2370=float2(0.0);
l9_2370=l9_2367.Surface_UVCoord1;
l9_2364=l9_2370;
l9_2368=l9_2364;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2371=float2(0.0);
l9_2371=l9_2367.gScreenCoord;
l9_2365=l9_2371;
l9_2368=l9_2365;
}
else
{
float2 l9_2372=float2(0.0);
l9_2372=l9_2367.Surface_UVCoord0;
l9_2366=l9_2372;
l9_2368=l9_2366;
}
}
}
l9_2362=l9_2368;
float2 l9_2373=float2(0.0);
float2 l9_2374=(*sc_set2.UserUniforms).uv2Scale;
l9_2373=l9_2374;
float2 l9_2375=float2(0.0);
l9_2375=l9_2373;
float2 l9_2376=float2(0.0);
float2 l9_2377=(*sc_set2.UserUniforms).uv2Offset;
l9_2376=l9_2377;
float2 l9_2378=float2(0.0);
l9_2378=l9_2376;
float2 l9_2379=float2(0.0);
l9_2379=(l9_2362*l9_2375)+l9_2378;
float2 l9_2380=float2(0.0);
l9_2380=l9_2379+(l9_2378*(l9_2360.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2358=l9_2380;
l9_2361=l9_2358;
}
else
{
float2 l9_2381=float2(0.0);
float2 l9_2382=float2(0.0);
float2 l9_2383=float2(0.0);
float2 l9_2384=float2(0.0);
float2 l9_2385=float2(0.0);
ssGlobals l9_2386=l9_2360;
float2 l9_2387;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2388=float2(0.0);
l9_2388=l9_2386.Surface_UVCoord0;
l9_2382=l9_2388;
l9_2387=l9_2382;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2389=float2(0.0);
l9_2389=l9_2386.Surface_UVCoord1;
l9_2383=l9_2389;
l9_2387=l9_2383;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2390=float2(0.0);
l9_2390=l9_2386.gScreenCoord;
l9_2384=l9_2390;
l9_2387=l9_2384;
}
else
{
float2 l9_2391=float2(0.0);
l9_2391=l9_2386.Surface_UVCoord0;
l9_2385=l9_2391;
l9_2387=l9_2385;
}
}
}
l9_2381=l9_2387;
float2 l9_2392=float2(0.0);
float2 l9_2393=(*sc_set2.UserUniforms).uv2Scale;
l9_2392=l9_2393;
float2 l9_2394=float2(0.0);
l9_2394=l9_2392;
float2 l9_2395=float2(0.0);
float2 l9_2396=(*sc_set2.UserUniforms).uv2Offset;
l9_2395=l9_2396;
float2 l9_2397=float2(0.0);
l9_2397=l9_2395;
float2 l9_2398=float2(0.0);
l9_2398=(l9_2381*l9_2394)+l9_2397;
l9_2359=l9_2398;
l9_2361=l9_2359;
}
l9_2357=l9_2361;
l9_2353=l9_2357;
l9_2356=l9_2353;
}
else
{
float2 l9_2399=float2(0.0);
l9_2399=l9_2355.Surface_UVCoord0;
l9_2354=l9_2399;
l9_2356=l9_2354;
}
l9_2352=l9_2356;
float2 l9_2400=float2(0.0);
l9_2400=l9_2352;
float2 l9_2401=float2(0.0);
l9_2401=l9_2400;
l9_2345=l9_2401;
l9_2349=l9_2345;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_2402=float2(0.0);
float2 l9_2403=float2(0.0);
float2 l9_2404=float2(0.0);
ssGlobals l9_2405=l9_2348;
float2 l9_2406;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_2407=float2(0.0);
float2 l9_2408=float2(0.0);
float2 l9_2409=float2(0.0);
ssGlobals l9_2410=l9_2405;
float2 l9_2411;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_2412=float2(0.0);
float2 l9_2413=float2(0.0);
float2 l9_2414=float2(0.0);
float2 l9_2415=float2(0.0);
float2 l9_2416=float2(0.0);
float2 l9_2417=float2(0.0);
ssGlobals l9_2418=l9_2410;
float2 l9_2419;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2420=float2(0.0);
l9_2420=l9_2418.Surface_UVCoord0;
l9_2413=l9_2420;
l9_2419=l9_2413;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2421=float2(0.0);
l9_2421=l9_2418.Surface_UVCoord1;
l9_2414=l9_2421;
l9_2419=l9_2414;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2422=float2(0.0);
l9_2422=l9_2418.gScreenCoord;
l9_2415=l9_2422;
l9_2419=l9_2415;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2423=float2(0.0);
float2 l9_2424=float2(0.0);
float2 l9_2425=float2(0.0);
ssGlobals l9_2426=l9_2418;
float2 l9_2427;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2428=float2(0.0);
float2 l9_2429=float2(0.0);
float2 l9_2430=float2(0.0);
ssGlobals l9_2431=l9_2426;
float2 l9_2432;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2433=float2(0.0);
float2 l9_2434=float2(0.0);
float2 l9_2435=float2(0.0);
float2 l9_2436=float2(0.0);
float2 l9_2437=float2(0.0);
ssGlobals l9_2438=l9_2431;
float2 l9_2439;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2440=float2(0.0);
l9_2440=l9_2438.Surface_UVCoord0;
l9_2434=l9_2440;
l9_2439=l9_2434;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2441=float2(0.0);
l9_2441=l9_2438.Surface_UVCoord1;
l9_2435=l9_2441;
l9_2439=l9_2435;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2442=float2(0.0);
l9_2442=l9_2438.gScreenCoord;
l9_2436=l9_2442;
l9_2439=l9_2436;
}
else
{
float2 l9_2443=float2(0.0);
l9_2443=l9_2438.Surface_UVCoord0;
l9_2437=l9_2443;
l9_2439=l9_2437;
}
}
}
l9_2433=l9_2439;
float2 l9_2444=float2(0.0);
float2 l9_2445=(*sc_set2.UserUniforms).uv2Scale;
l9_2444=l9_2445;
float2 l9_2446=float2(0.0);
l9_2446=l9_2444;
float2 l9_2447=float2(0.0);
float2 l9_2448=(*sc_set2.UserUniforms).uv2Offset;
l9_2447=l9_2448;
float2 l9_2449=float2(0.0);
l9_2449=l9_2447;
float2 l9_2450=float2(0.0);
l9_2450=(l9_2433*l9_2446)+l9_2449;
float2 l9_2451=float2(0.0);
l9_2451=l9_2450+(l9_2449*(l9_2431.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2429=l9_2451;
l9_2432=l9_2429;
}
else
{
float2 l9_2452=float2(0.0);
float2 l9_2453=float2(0.0);
float2 l9_2454=float2(0.0);
float2 l9_2455=float2(0.0);
float2 l9_2456=float2(0.0);
ssGlobals l9_2457=l9_2431;
float2 l9_2458;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2459=float2(0.0);
l9_2459=l9_2457.Surface_UVCoord0;
l9_2453=l9_2459;
l9_2458=l9_2453;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2460=float2(0.0);
l9_2460=l9_2457.Surface_UVCoord1;
l9_2454=l9_2460;
l9_2458=l9_2454;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2461=float2(0.0);
l9_2461=l9_2457.gScreenCoord;
l9_2455=l9_2461;
l9_2458=l9_2455;
}
else
{
float2 l9_2462=float2(0.0);
l9_2462=l9_2457.Surface_UVCoord0;
l9_2456=l9_2462;
l9_2458=l9_2456;
}
}
}
l9_2452=l9_2458;
float2 l9_2463=float2(0.0);
float2 l9_2464=(*sc_set2.UserUniforms).uv2Scale;
l9_2463=l9_2464;
float2 l9_2465=float2(0.0);
l9_2465=l9_2463;
float2 l9_2466=float2(0.0);
float2 l9_2467=(*sc_set2.UserUniforms).uv2Offset;
l9_2466=l9_2467;
float2 l9_2468=float2(0.0);
l9_2468=l9_2466;
float2 l9_2469=float2(0.0);
l9_2469=(l9_2452*l9_2465)+l9_2468;
l9_2430=l9_2469;
l9_2432=l9_2430;
}
l9_2428=l9_2432;
l9_2424=l9_2428;
l9_2427=l9_2424;
}
else
{
float2 l9_2470=float2(0.0);
l9_2470=l9_2426.Surface_UVCoord0;
l9_2425=l9_2470;
l9_2427=l9_2425;
}
l9_2423=l9_2427;
float2 l9_2471=float2(0.0);
l9_2471=l9_2423;
float2 l9_2472=float2(0.0);
l9_2472=l9_2471;
l9_2416=l9_2472;
l9_2419=l9_2416;
}
else
{
float2 l9_2473=float2(0.0);
l9_2473=l9_2418.Surface_UVCoord0;
l9_2417=l9_2473;
l9_2419=l9_2417;
}
}
}
}
l9_2412=l9_2419;
float2 l9_2474=float2(0.0);
float2 l9_2475=(*sc_set2.UserUniforms).uv3Scale;
l9_2474=l9_2475;
float2 l9_2476=float2(0.0);
l9_2476=l9_2474;
float2 l9_2477=float2(0.0);
float2 l9_2478=(*sc_set2.UserUniforms).uv3Offset;
l9_2477=l9_2478;
float2 l9_2479=float2(0.0);
l9_2479=l9_2477;
float2 l9_2480=float2(0.0);
l9_2480=(l9_2412*l9_2476)+l9_2479;
float2 l9_2481=float2(0.0);
l9_2481=l9_2480+(l9_2479*(l9_2410.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_2408=l9_2481;
l9_2411=l9_2408;
}
else
{
float2 l9_2482=float2(0.0);
float2 l9_2483=float2(0.0);
float2 l9_2484=float2(0.0);
float2 l9_2485=float2(0.0);
float2 l9_2486=float2(0.0);
float2 l9_2487=float2(0.0);
ssGlobals l9_2488=l9_2410;
float2 l9_2489;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2490=float2(0.0);
l9_2490=l9_2488.Surface_UVCoord0;
l9_2483=l9_2490;
l9_2489=l9_2483;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2491=float2(0.0);
l9_2491=l9_2488.Surface_UVCoord1;
l9_2484=l9_2491;
l9_2489=l9_2484;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2492=float2(0.0);
l9_2492=l9_2488.gScreenCoord;
l9_2485=l9_2492;
l9_2489=l9_2485;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2493=float2(0.0);
float2 l9_2494=float2(0.0);
float2 l9_2495=float2(0.0);
ssGlobals l9_2496=l9_2488;
float2 l9_2497;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_2498=float2(0.0);
float2 l9_2499=float2(0.0);
float2 l9_2500=float2(0.0);
ssGlobals l9_2501=l9_2496;
float2 l9_2502;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_2503=float2(0.0);
float2 l9_2504=float2(0.0);
float2 l9_2505=float2(0.0);
float2 l9_2506=float2(0.0);
float2 l9_2507=float2(0.0);
ssGlobals l9_2508=l9_2501;
float2 l9_2509;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2510=float2(0.0);
l9_2510=l9_2508.Surface_UVCoord0;
l9_2504=l9_2510;
l9_2509=l9_2504;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2511=float2(0.0);
l9_2511=l9_2508.Surface_UVCoord1;
l9_2505=l9_2511;
l9_2509=l9_2505;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2512=float2(0.0);
l9_2512=l9_2508.gScreenCoord;
l9_2506=l9_2512;
l9_2509=l9_2506;
}
else
{
float2 l9_2513=float2(0.0);
l9_2513=l9_2508.Surface_UVCoord0;
l9_2507=l9_2513;
l9_2509=l9_2507;
}
}
}
l9_2503=l9_2509;
float2 l9_2514=float2(0.0);
float2 l9_2515=(*sc_set2.UserUniforms).uv2Scale;
l9_2514=l9_2515;
float2 l9_2516=float2(0.0);
l9_2516=l9_2514;
float2 l9_2517=float2(0.0);
float2 l9_2518=(*sc_set2.UserUniforms).uv2Offset;
l9_2517=l9_2518;
float2 l9_2519=float2(0.0);
l9_2519=l9_2517;
float2 l9_2520=float2(0.0);
l9_2520=(l9_2503*l9_2516)+l9_2519;
float2 l9_2521=float2(0.0);
l9_2521=l9_2520+(l9_2519*(l9_2501.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_2499=l9_2521;
l9_2502=l9_2499;
}
else
{
float2 l9_2522=float2(0.0);
float2 l9_2523=float2(0.0);
float2 l9_2524=float2(0.0);
float2 l9_2525=float2(0.0);
float2 l9_2526=float2(0.0);
ssGlobals l9_2527=l9_2501;
float2 l9_2528;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2529=float2(0.0);
l9_2529=l9_2527.Surface_UVCoord0;
l9_2523=l9_2529;
l9_2528=l9_2523;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2530=float2(0.0);
l9_2530=l9_2527.Surface_UVCoord1;
l9_2524=l9_2530;
l9_2528=l9_2524;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2531=float2(0.0);
l9_2531=l9_2527.gScreenCoord;
l9_2525=l9_2531;
l9_2528=l9_2525;
}
else
{
float2 l9_2532=float2(0.0);
l9_2532=l9_2527.Surface_UVCoord0;
l9_2526=l9_2532;
l9_2528=l9_2526;
}
}
}
l9_2522=l9_2528;
float2 l9_2533=float2(0.0);
float2 l9_2534=(*sc_set2.UserUniforms).uv2Scale;
l9_2533=l9_2534;
float2 l9_2535=float2(0.0);
l9_2535=l9_2533;
float2 l9_2536=float2(0.0);
float2 l9_2537=(*sc_set2.UserUniforms).uv2Offset;
l9_2536=l9_2537;
float2 l9_2538=float2(0.0);
l9_2538=l9_2536;
float2 l9_2539=float2(0.0);
l9_2539=(l9_2522*l9_2535)+l9_2538;
l9_2500=l9_2539;
l9_2502=l9_2500;
}
l9_2498=l9_2502;
l9_2494=l9_2498;
l9_2497=l9_2494;
}
else
{
float2 l9_2540=float2(0.0);
l9_2540=l9_2496.Surface_UVCoord0;
l9_2495=l9_2540;
l9_2497=l9_2495;
}
l9_2493=l9_2497;
float2 l9_2541=float2(0.0);
l9_2541=l9_2493;
float2 l9_2542=float2(0.0);
l9_2542=l9_2541;
l9_2486=l9_2542;
l9_2489=l9_2486;
}
else
{
float2 l9_2543=float2(0.0);
l9_2543=l9_2488.Surface_UVCoord0;
l9_2487=l9_2543;
l9_2489=l9_2487;
}
}
}
}
l9_2482=l9_2489;
float2 l9_2544=float2(0.0);
float2 l9_2545=(*sc_set2.UserUniforms).uv3Scale;
l9_2544=l9_2545;
float2 l9_2546=float2(0.0);
l9_2546=l9_2544;
float2 l9_2547=float2(0.0);
float2 l9_2548=(*sc_set2.UserUniforms).uv3Offset;
l9_2547=l9_2548;
float2 l9_2549=float2(0.0);
l9_2549=l9_2547;
float2 l9_2550=float2(0.0);
l9_2550=(l9_2482*l9_2546)+l9_2549;
l9_2409=l9_2550;
l9_2411=l9_2409;
}
l9_2407=l9_2411;
l9_2403=l9_2407;
l9_2406=l9_2403;
}
else
{
float2 l9_2551=float2(0.0);
l9_2551=l9_2405.Surface_UVCoord0;
l9_2404=l9_2551;
l9_2406=l9_2404;
}
l9_2402=l9_2406;
float2 l9_2552=float2(0.0);
l9_2552=l9_2402;
float2 l9_2553=float2(0.0);
l9_2553=l9_2552;
l9_2346=l9_2553;
l9_2349=l9_2346;
}
else
{
float2 l9_2554=float2(0.0);
l9_2554=l9_2348.Surface_UVCoord0;
l9_2347=l9_2554;
l9_2349=l9_2347;
}
}
}
}
l9_2342=l9_2349;
float4 l9_2555=float4(0.0);
float2 l9_2556=l9_2342;
int l9_2557=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_2558=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2558=0;
}
else
{
l9_2558=in.varStereoViewID;
}
int l9_2559=l9_2558;
l9_2557=1-l9_2559;
}
else
{
int l9_2560=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2560=0;
}
else
{
l9_2560=in.varStereoViewID;
}
int l9_2561=l9_2560;
l9_2557=l9_2561;
}
int l9_2562=l9_2557;
int l9_2563=detailNormalTexLayout_tmp;
int l9_2564=l9_2562;
float2 l9_2565=l9_2556;
bool l9_2566=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_2567=(*sc_set2.UserUniforms).detailNormalTexTransform;
int2 l9_2568=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_2569=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_2570=(*sc_set2.UserUniforms).detailNormalTexUvMinMax;
bool l9_2571=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_2572=(*sc_set2.UserUniforms).detailNormalTexBorderColor;
float l9_2573=0.0;
bool l9_2574=l9_2571&&(!l9_2569);
float l9_2575=1.0;
float l9_2576=l9_2565.x;
int l9_2577=l9_2568.x;
if (l9_2577==1)
{
l9_2576=fract(l9_2576);
}
else
{
if (l9_2577==2)
{
float l9_2578=fract(l9_2576);
float l9_2579=l9_2576-l9_2578;
float l9_2580=step(0.25,fract(l9_2579*0.5));
l9_2576=mix(l9_2578,1.0-l9_2578,fast::clamp(l9_2580,0.0,1.0));
}
}
l9_2565.x=l9_2576;
float l9_2581=l9_2565.y;
int l9_2582=l9_2568.y;
if (l9_2582==1)
{
l9_2581=fract(l9_2581);
}
else
{
if (l9_2582==2)
{
float l9_2583=fract(l9_2581);
float l9_2584=l9_2581-l9_2583;
float l9_2585=step(0.25,fract(l9_2584*0.5));
l9_2581=mix(l9_2583,1.0-l9_2583,fast::clamp(l9_2585,0.0,1.0));
}
}
l9_2565.y=l9_2581;
if (l9_2569)
{
bool l9_2586=l9_2571;
bool l9_2587;
if (l9_2586)
{
l9_2587=l9_2568.x==3;
}
else
{
l9_2587=l9_2586;
}
float l9_2588=l9_2565.x;
float l9_2589=l9_2570.x;
float l9_2590=l9_2570.z;
bool l9_2591=l9_2587;
float l9_2592=l9_2575;
float l9_2593=fast::clamp(l9_2588,l9_2589,l9_2590);
float l9_2594=step(abs(l9_2588-l9_2593),9.9999997e-06);
l9_2592*=(l9_2594+((1.0-float(l9_2591))*(1.0-l9_2594)));
l9_2588=l9_2593;
l9_2565.x=l9_2588;
l9_2575=l9_2592;
bool l9_2595=l9_2571;
bool l9_2596;
if (l9_2595)
{
l9_2596=l9_2568.y==3;
}
else
{
l9_2596=l9_2595;
}
float l9_2597=l9_2565.y;
float l9_2598=l9_2570.y;
float l9_2599=l9_2570.w;
bool l9_2600=l9_2596;
float l9_2601=l9_2575;
float l9_2602=fast::clamp(l9_2597,l9_2598,l9_2599);
float l9_2603=step(abs(l9_2597-l9_2602),9.9999997e-06);
l9_2601*=(l9_2603+((1.0-float(l9_2600))*(1.0-l9_2603)));
l9_2597=l9_2602;
l9_2565.y=l9_2597;
l9_2575=l9_2601;
}
float2 l9_2604=l9_2565;
bool l9_2605=l9_2566;
float3x3 l9_2606=l9_2567;
if (l9_2605)
{
l9_2604=float2((l9_2606*float3(l9_2604,1.0)).xy);
}
float2 l9_2607=l9_2604;
float2 l9_2608=l9_2607;
float2 l9_2609=l9_2608;
l9_2565=l9_2609;
float l9_2610=l9_2565.x;
int l9_2611=l9_2568.x;
bool l9_2612=l9_2574;
float l9_2613=l9_2575;
if ((l9_2611==0)||(l9_2611==3))
{
float l9_2614=l9_2610;
float l9_2615=0.0;
float l9_2616=1.0;
bool l9_2617=l9_2612;
float l9_2618=l9_2613;
float l9_2619=fast::clamp(l9_2614,l9_2615,l9_2616);
float l9_2620=step(abs(l9_2614-l9_2619),9.9999997e-06);
l9_2618*=(l9_2620+((1.0-float(l9_2617))*(1.0-l9_2620)));
l9_2614=l9_2619;
l9_2610=l9_2614;
l9_2613=l9_2618;
}
l9_2565.x=l9_2610;
l9_2575=l9_2613;
float l9_2621=l9_2565.y;
int l9_2622=l9_2568.y;
bool l9_2623=l9_2574;
float l9_2624=l9_2575;
if ((l9_2622==0)||(l9_2622==3))
{
float l9_2625=l9_2621;
float l9_2626=0.0;
float l9_2627=1.0;
bool l9_2628=l9_2623;
float l9_2629=l9_2624;
float l9_2630=fast::clamp(l9_2625,l9_2626,l9_2627);
float l9_2631=step(abs(l9_2625-l9_2630),9.9999997e-06);
l9_2629*=(l9_2631+((1.0-float(l9_2628))*(1.0-l9_2631)));
l9_2625=l9_2630;
l9_2621=l9_2625;
l9_2624=l9_2629;
}
l9_2565.y=l9_2621;
l9_2575=l9_2624;
float2 l9_2632=l9_2565;
int l9_2633=l9_2563;
int l9_2634=l9_2564;
float l9_2635=l9_2573;
float2 l9_2636=l9_2632;
int l9_2637=l9_2633;
int l9_2638=l9_2634;
float3 l9_2639=float3(0.0);
if (l9_2637==0)
{
l9_2639=float3(l9_2636,0.0);
}
else
{
if (l9_2637==1)
{
l9_2639=float3(l9_2636.x,(l9_2636.y*0.5)+(0.5-(float(l9_2638)*0.5)),0.0);
}
else
{
l9_2639=float3(l9_2636,float(l9_2638));
}
}
float3 l9_2640=l9_2639;
float3 l9_2641=l9_2640;
float2 l9_2642=l9_2641.xy;
float l9_2643=l9_2635;
float4 l9_2644=sc_set2.detailNormalTex.sample(sc_set2.detailNormalTexSmpSC,l9_2642,bias(l9_2643));
float4 l9_2645=l9_2644;
float4 l9_2646=l9_2645;
if (l9_2571)
{
l9_2646=mix(l9_2572,l9_2646,float4(l9_2575));
}
float4 l9_2647=l9_2646;
float4 l9_2648=l9_2647;
float3 l9_2649=(l9_2648.xyz*1.9921875)-float3(1.0);
l9_2648=float4(l9_2649.x,l9_2649.y,l9_2649.z,l9_2648.w);
l9_2555=l9_2648;
l9_2338=l9_2555.xyz;
l9_2341=l9_2338;
}
else
{
l9_2341=l9_2339;
}
l9_2337=l9_2341;
float3 l9_2650=float3(0.0);
float3 l9_2651=l9_2242.xyz;
float l9_2652=(*sc_set2.UserUniforms).Port_Strength1_N200;
float3 l9_2653=l9_2337;
float l9_2654=(*sc_set2.UserUniforms).Port_Strength2_N200;
float3 l9_2655=l9_2651;
float l9_2656=l9_2652;
float3 l9_2657=l9_2653;
float l9_2658=l9_2654;
float3 l9_2659=mix(float3(0.0,0.0,1.0),l9_2655,float3(l9_2656))+float3(0.0,0.0,1.0);
float3 l9_2660=mix(float3(0.0,0.0,1.0),l9_2657,float3(l9_2658))*float3(-1.0,-1.0,1.0);
float3 l9_2661=normalize((l9_2659*dot(l9_2659,l9_2660))-(l9_2660*l9_2659.z));
l9_2653=l9_2661;
float3 l9_2662=l9_2653;
l9_2650=l9_2662;
float3 l9_2663=float3(0.0);
l9_2663=l9_2028*l9_2650;
float3 l9_2664=float3(0.0);
float3 l9_2665=l9_2663;
float l9_2666=dot(l9_2665,l9_2665);
float l9_2667;
if (l9_2666>0.0)
{
l9_2667=1.0/sqrt(l9_2666);
}
else
{
l9_2667=0.0;
}
float l9_2668=l9_2667;
float3 l9_2669=l9_2665*l9_2668;
l9_2664=l9_2669;
param_26=l9_2664;
param_28=param_26;
}
else
{
float3 l9_2670=float3(0.0);
l9_2670=param_29.VertexNormal_WorldSpace;
float3 l9_2671=float3(0.0);
float3 l9_2672=l9_2670;
float l9_2673=dot(l9_2672,l9_2672);
float l9_2674;
if (l9_2673>0.0)
{
l9_2674=1.0/sqrt(l9_2673);
}
else
{
l9_2674=0.0;
}
float l9_2675=l9_2674;
float3 l9_2676=l9_2672*l9_2675;
l9_2671=l9_2676;
param_27=l9_2671;
param_28=param_27;
}
Result_N337=param_28;
float3 Export_N334=float3(0.0);
Export_N334=Result_N337;
float4 Output_N36=float4(0.0);
float3 param_30=Export_N364.xyz;
float param_31=Export_N158;
float3 param_32=Export_N334;
float3 param_33=(*sc_set2.UserUniforms).Port_Emissive_N036;
float3 param_34=(*sc_set2.UserUniforms).Port_AO_N036;
ssGlobals param_36=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_36.BumpedNormal=param_32;
}
param_31=fast::clamp(param_31,0.0,1.0);
float l9_2677=param_31;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_2677<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_2678=gl_FragCoord;
float2 l9_2679=floor(mod(l9_2678.xy,float2(4.0)));
float l9_2680=(mod(dot(l9_2679,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_2677<l9_2680)
{
discard_fragment();
}
}
param_30=fast::max(param_30,float3(0.0));
float4 param_35;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_35=float4(param_30,param_31);
}
else
{
float l9_2681=0.0;
float l9_2682=1.0;
float3 l9_2683=float3(1.0);
float3 l9_2684=param_30;
float l9_2685=param_31;
float3 l9_2686=param_36.BumpedNormal;
float3 l9_2687=param_36.PositionWS;
float3 l9_2688=param_36.ViewDirWS;
float3 l9_2689=param_33;
float l9_2690=l9_2681;
float l9_2691=l9_2682;
float3 l9_2692=param_34;
float3 l9_2693=l9_2683;
param_35=ngsCalculateLighting(l9_2684,l9_2685,l9_2686,l9_2687,l9_2688,l9_2689,l9_2690,l9_2691,l9_2692,l9_2693,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.sc_EnvmapDiffuse,sc_set2.sc_EnvmapDiffuseSmpSC,sc_set2.sc_EnvmapSpecular,sc_set2.sc_EnvmapSpecularSmpSC,sc_set2.sc_ScreenTexture,sc_set2.sc_ScreenTextureSmpSC,sc_set2.sc_ShadowTexture,sc_set2.sc_ShadowTextureSmpSC,sc_set2.sc_SSAOTexture,sc_set2.sc_SSAOTextureSmpSC,sc_set2.sc_RayTracedShadowTexture,sc_set2.sc_RayTracedShadowTextureSmpSC,sc_set2.sc_RayTracedDiffIndTexture,sc_set2.sc_RayTracedDiffIndTextureSmpSC,sc_set2.sc_RayTracedAoTexture,sc_set2.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
param_35=fast::max(param_35,float4(0.0));
Output_N36=param_35;
float Output_N66=0.0;
float param_37=(*sc_set2.UserUniforms).colorMultiplier;
Output_N66=param_37;
float Output_N70=0.0;
Output_N70=Output_N66+1.0;
float4 Output_N74=float4(0.0);
Output_N74=Output_N36*float4(Output_N70);
float Value4_N75=0.0;
float4 param_38=Output_N36;
float param_39=param_38.w;
Value4_N75=param_39;
float4 Value_N76=float4(0.0);
Value_N76=float4(Output_N74.xyz.x,Output_N74.xyz.y,Output_N74.xyz.z,Value_N76.w);
Value_N76.w=Value4_N75;
FinalColor=Value_N76;
bool l9_2694=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_2694)
{
float4 param_40=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_40.w=1.0;
}
float4 l9_2695=fast::max(param_40,float4(0.0));
float4 param_41=l9_2695;
out.FragColor0=param_41;
return out;
}
float4 param_42=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_2696=param_42;
float4 l9_2697=l9_2696;
float l9_2698=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_2698=l9_2697.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_2698=fast::clamp(l9_2697.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_2698=fast::clamp(dot(l9_2697.xyz,float3(l9_2697.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_2698=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_2698=(1.0-dot(l9_2697.xyz,float3(0.33333001)))*l9_2697.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_2698=(1.0-fast::clamp(dot(l9_2697.xyz,float3(1.0)),0.0,1.0))*l9_2697.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_2698=fast::clamp(dot(l9_2697.xyz,float3(1.0)),0.0,1.0)*l9_2697.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_2698=fast::clamp(dot(l9_2697.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_2698=fast::clamp(dot(l9_2697.xyz,float3(1.0)),0.0,1.0)*l9_2697.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_2698=dot(l9_2697.xyz,float3(0.33333001))*l9_2697.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_2698=1.0-fast::clamp(dot(l9_2697.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_2698=fast::clamp(dot(l9_2697.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_2699=l9_2698;
float l9_2700=l9_2699;
float l9_2701=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_2700;
float3 l9_2702=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_2696.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_2703=float4(l9_2702.x,l9_2702.y,l9_2702.z,l9_2701);
param_42=l9_2703;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_42=float4(param_42.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_2704=param_42;
float4 l9_2705=float4(0.0);
float4 l9_2706=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_2707=out.FragColor0;
float4 l9_2708=l9_2707;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_2708.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_2709=l9_2708;
l9_2706=l9_2709;
}
else
{
float4 l9_2710=gl_FragCoord;
float2 l9_2711=l9_2710.xy*(*sc_set2.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_2712=l9_2711;
float2 l9_2713=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_2714=1;
int l9_2715=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2715=0;
}
else
{
l9_2715=in.varStereoViewID;
}
int l9_2716=l9_2715;
int l9_2717=l9_2716;
float3 l9_2718=float3(l9_2712,0.0);
int l9_2719=l9_2714;
int l9_2720=l9_2717;
if (l9_2719==1)
{
l9_2718.y=((2.0*l9_2718.y)+float(l9_2720))-1.0;
}
float2 l9_2721=l9_2718.xy;
l9_2713=l9_2721;
}
else
{
l9_2713=l9_2712;
}
float2 l9_2722=l9_2713;
float2 l9_2723=l9_2722;
float2 l9_2724=l9_2723;
int l9_2725=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_2726=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2726=0;
}
else
{
l9_2726=in.varStereoViewID;
}
int l9_2727=l9_2726;
l9_2725=1-l9_2727;
}
else
{
int l9_2728=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2728=0;
}
else
{
l9_2728=in.varStereoViewID;
}
int l9_2729=l9_2728;
l9_2725=l9_2729;
}
int l9_2730=l9_2725;
float2 l9_2731=l9_2724;
int l9_2732=l9_2730;
float2 l9_2733=l9_2731;
int l9_2734=l9_2732;
float l9_2735=0.0;
float4 l9_2736=float4(0.0);
float2 l9_2737=l9_2733;
int l9_2738=sc_ScreenTextureLayout_tmp;
int l9_2739=l9_2734;
float l9_2740=l9_2735;
float2 l9_2741=l9_2737;
int l9_2742=l9_2738;
int l9_2743=l9_2739;
float3 l9_2744=float3(0.0);
if (l9_2742==0)
{
l9_2744=float3(l9_2741,0.0);
}
else
{
if (l9_2742==1)
{
l9_2744=float3(l9_2741.x,(l9_2741.y*0.5)+(0.5-(float(l9_2743)*0.5)),0.0);
}
else
{
l9_2744=float3(l9_2741,float(l9_2743));
}
}
float3 l9_2745=l9_2744;
float3 l9_2746=l9_2745;
float2 l9_2747=l9_2746.xy;
float l9_2748=l9_2740;
float4 l9_2749=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_2747,bias(l9_2748));
float4 l9_2750=l9_2749;
l9_2736=l9_2750;
float4 l9_2751=l9_2736;
float4 l9_2752=l9_2751;
float4 l9_2753=l9_2752;
l9_2706=l9_2753;
}
float4 l9_2754=l9_2706;
float4 l9_2755=l9_2754;
float3 l9_2756=l9_2755.xyz;
float3 l9_2757=l9_2756;
float3 l9_2758=l9_2704.xyz;
float3 l9_2759=definedBlend(l9_2757,l9_2758,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
l9_2705=float4(l9_2759.x,l9_2759.y,l9_2759.z,l9_2705.w);
float3 l9_2760=mix(l9_2756,l9_2705.xyz,float3(l9_2704.w));
l9_2705=float4(l9_2760.x,l9_2760.y,l9_2760.z,l9_2705.w);
l9_2705.w=1.0;
float4 l9_2761=l9_2705;
param_42=l9_2761;
}
else
{
float4 l9_2762=param_42;
float4 l9_2763=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_2763=float4(mix(float3(1.0),l9_2762.xyz,float3(l9_2762.w)),l9_2762.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_2764=l9_2762.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_2764=fast::clamp(l9_2764,0.0,1.0);
}
l9_2763=float4(l9_2762.xyz*l9_2764,l9_2764);
}
else
{
l9_2763=l9_2762;
}
}
float4 l9_2765=l9_2763;
param_42=l9_2765;
}
}
}
float4 l9_2766=param_42;
FinalColor=l9_2766;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_2767=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_2767=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_2767=float4(0.0);
}
float4 l9_2768=l9_2767;
float4 Cost=l9_2768;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_43=in.varPos;
float4 param_44=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_43,param_44,in.varStereoViewID,(*sc_set2.UserUniforms));
float4 param_45=FinalColor;
float4 l9_2769=param_45;
out.FragColor0=l9_2769;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float3 recolorRed;
float4 Tweak_N81;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float4 opacityTexSize;
float4 opacityTexDims;
float4 opacityTexView;
float3x3 opacityTexTransform;
float4 opacityTexUvMinMax;
float4 opacityTexBorderColor;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float colorMultiplier;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float Port_Position1_N078;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N012;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float2 Port_Import_N254;
float Port_Import_N065;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float4 Port_Import_N166;
float Port_Import_N206;
float Port_Import_N043;
float2 Port_Import_N151;
float2 Port_Import_N155;
float Port_Default_N204;
float Port_Import_N047;
float Port_Input1_N002;
float Port_Input2_N072;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float3 Port_Emissive_N036;
float3 Port_AO_N036;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> normalTex [[id(7)]];
texture2d<float> opacityTex [[id(8)]];
texture2d<float> sc_EnvmapDiffuse [[id(9)]];
texture2d<float> sc_EnvmapSpecular [[id(10)]];
texture2d<float> sc_RayTracedAoTexture [[id(19)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(20)]];
texture2d<float> sc_RayTracedShadowTexture [[id(22)]];
texture2d<float> sc_SSAOTexture [[id(23)]];
texture2d<float> sc_ScreenTexture [[id(24)]];
texture2d<float> sc_ShadowTexture [[id(25)]];
texture2d<uint> z_hitIdAndBarycentric [[id(27)]];
texture2d<float> z_rayDirections [[id(28)]];
sampler baseTexSmpSC [[id(29)]];
sampler detailNormalTexSmpSC [[id(30)]];
sampler intensityTextureSmpSC [[id(31)]];
sampler normalTexSmpSC [[id(32)]];
sampler opacityTexSmpSC [[id(33)]];
sampler sc_EnvmapDiffuseSmpSC [[id(34)]];
sampler sc_EnvmapSpecularSmpSC [[id(35)]];
sampler sc_RayTracedAoTextureSmpSC [[id(37)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(38)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(40)]];
sampler sc_SSAOTextureSmpSC [[id(41)]];
sampler sc_ScreenTextureSmpSC [[id(42)]];
sampler sc_ShadowTextureSmpSC [[id(43)]];
sampler z_hitIdAndBarycentricSmp [[id(45)]];
sampler z_rayDirectionsSmpSC [[id(46)]];
constant userUniformsObj* UserUniforms [[id(47)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
float l9_0;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set2.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_2=gl_FragCoord;
float2 l9_3=l9_2.xy*(*sc_set2.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_4=l9_3;
float2 l9_5=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_6=1;
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
int l9_9=l9_8;
float3 l9_10=float3(l9_4,0.0);
int l9_11=l9_6;
int l9_12=l9_9;
if (l9_11==1)
{
l9_10.y=((2.0*l9_10.y)+float(l9_12))-1.0;
}
float2 l9_13=l9_10.xy;
l9_5=l9_13;
}
else
{
l9_5=l9_4;
}
float2 l9_14=l9_5;
float2 l9_15=l9_14;
Globals.gScreenCoord=l9_15;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
float2 UVCoord_N77=float2(0.0);
UVCoord_N77=Globals.Surface_UVCoord0;
float Value2_N79=0.0;
float4 param=float4(UVCoord_N77,0.0,0.0);
float param_1=param.y;
Value2_N79=param_1;
float4 Output_N81=float4(0.0);
float4 param_2=(*sc_set2.UserUniforms).Tweak_N81;
Output_N81=param_2;
float4 Output_N5=float4(0.0);
float4 param_3=(*sc_set2.UserUniforms).baseColor;
Output_N5=param_3;
float4 Value_N78=float4(0.0);
float param_4=Value2_N79;
float4 param_5=Output_N81;
float param_6=(*sc_set2.UserUniforms).Port_Position1_N078;
float4 param_7=Output_N81;
float4 param_8=Output_N5;
param_4=fast::clamp(param_4,0.0,1.0);
float4 param_9;
if (param_4<param_6)
{
param_9=mix(param_5,param_7,float4(fast::clamp(param_4/param_6,0.0,1.0)));
}
else
{
param_9=mix(param_7,param_8,float4(fast::clamp((param_4-param_6)/(1.0-param_6),0.0,1.0)));
}
Value_N78=param_9;
float4 Value_N384=float4(0.0);
Value_N384=Value_N78;
float4 Result_N369=float4(0.0);
float4 param_10=float4(0.0);
float4 param_11=(*sc_set2.UserUniforms).Port_Default_N369;
ssGlobals param_13=Globals;
float4 param_12;
if ((int(ENABLE_BASE_TEX_tmp)!=0))
{
float2 l9_16=float2(0.0);
float2 l9_17=float2(0.0);
float2 l9_18=float2(0.0);
float2 l9_19=float2(0.0);
float2 l9_20=float2(0.0);
float2 l9_21=float2(0.0);
ssGlobals l9_22=param_13;
float2 l9_23;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_24=float2(0.0);
l9_24=l9_22.Surface_UVCoord0;
l9_17=l9_24;
l9_23=l9_17;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_25=float2(0.0);
l9_25=l9_22.Surface_UVCoord1;
l9_18=l9_25;
l9_23=l9_18;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_26=float2(0.0);
float2 l9_27=float2(0.0);
float2 l9_28=float2(0.0);
ssGlobals l9_29=l9_22;
float2 l9_30;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_31=float2(0.0);
float2 l9_32=float2(0.0);
float2 l9_33=float2(0.0);
ssGlobals l9_34=l9_29;
float2 l9_35;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_36=float2(0.0);
float2 l9_37=float2(0.0);
float2 l9_38=float2(0.0);
float2 l9_39=float2(0.0);
float2 l9_40=float2(0.0);
ssGlobals l9_41=l9_34;
float2 l9_42;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_43=float2(0.0);
l9_43=l9_41.Surface_UVCoord0;
l9_37=l9_43;
l9_42=l9_37;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_44=float2(0.0);
l9_44=l9_41.Surface_UVCoord1;
l9_38=l9_44;
l9_42=l9_38;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_45=float2(0.0);
l9_45=l9_41.gScreenCoord;
l9_39=l9_45;
l9_42=l9_39;
}
else
{
float2 l9_46=float2(0.0);
l9_46=l9_41.Surface_UVCoord0;
l9_40=l9_46;
l9_42=l9_40;
}
}
}
l9_36=l9_42;
float2 l9_47=float2(0.0);
float2 l9_48=(*sc_set2.UserUniforms).uv2Scale;
l9_47=l9_48;
float2 l9_49=float2(0.0);
l9_49=l9_47;
float2 l9_50=float2(0.0);
float2 l9_51=(*sc_set2.UserUniforms).uv2Offset;
l9_50=l9_51;
float2 l9_52=float2(0.0);
l9_52=l9_50;
float2 l9_53=float2(0.0);
l9_53=(l9_36*l9_49)+l9_52;
float2 l9_54=float2(0.0);
l9_54=l9_53+(l9_52*(l9_34.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_32=l9_54;
l9_35=l9_32;
}
else
{
float2 l9_55=float2(0.0);
float2 l9_56=float2(0.0);
float2 l9_57=float2(0.0);
float2 l9_58=float2(0.0);
float2 l9_59=float2(0.0);
ssGlobals l9_60=l9_34;
float2 l9_61;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_62=float2(0.0);
l9_62=l9_60.Surface_UVCoord0;
l9_56=l9_62;
l9_61=l9_56;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_63=float2(0.0);
l9_63=l9_60.Surface_UVCoord1;
l9_57=l9_63;
l9_61=l9_57;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_64=float2(0.0);
l9_64=l9_60.gScreenCoord;
l9_58=l9_64;
l9_61=l9_58;
}
else
{
float2 l9_65=float2(0.0);
l9_65=l9_60.Surface_UVCoord0;
l9_59=l9_65;
l9_61=l9_59;
}
}
}
l9_55=l9_61;
float2 l9_66=float2(0.0);
float2 l9_67=(*sc_set2.UserUniforms).uv2Scale;
l9_66=l9_67;
float2 l9_68=float2(0.0);
l9_68=l9_66;
float2 l9_69=float2(0.0);
float2 l9_70=(*sc_set2.UserUniforms).uv2Offset;
l9_69=l9_70;
float2 l9_71=float2(0.0);
l9_71=l9_69;
float2 l9_72=float2(0.0);
l9_72=(l9_55*l9_68)+l9_71;
l9_33=l9_72;
l9_35=l9_33;
}
l9_31=l9_35;
l9_27=l9_31;
l9_30=l9_27;
}
else
{
float2 l9_73=float2(0.0);
l9_73=l9_29.Surface_UVCoord0;
l9_28=l9_73;
l9_30=l9_28;
}
l9_26=l9_30;
float2 l9_74=float2(0.0);
l9_74=l9_26;
float2 l9_75=float2(0.0);
l9_75=l9_74;
l9_19=l9_75;
l9_23=l9_19;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_76=float2(0.0);
float2 l9_77=float2(0.0);
float2 l9_78=float2(0.0);
ssGlobals l9_79=l9_22;
float2 l9_80;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_81=float2(0.0);
float2 l9_82=float2(0.0);
float2 l9_83=float2(0.0);
ssGlobals l9_84=l9_79;
float2 l9_85;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_86=float2(0.0);
float2 l9_87=float2(0.0);
float2 l9_88=float2(0.0);
float2 l9_89=float2(0.0);
float2 l9_90=float2(0.0);
float2 l9_91=float2(0.0);
ssGlobals l9_92=l9_84;
float2 l9_93;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_94=float2(0.0);
l9_94=l9_92.Surface_UVCoord0;
l9_87=l9_94;
l9_93=l9_87;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_95=float2(0.0);
l9_95=l9_92.Surface_UVCoord1;
l9_88=l9_95;
l9_93=l9_88;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_96=float2(0.0);
l9_96=l9_92.gScreenCoord;
l9_89=l9_96;
l9_93=l9_89;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_97=float2(0.0);
float2 l9_98=float2(0.0);
float2 l9_99=float2(0.0);
ssGlobals l9_100=l9_92;
float2 l9_101;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_102=float2(0.0);
float2 l9_103=float2(0.0);
float2 l9_104=float2(0.0);
ssGlobals l9_105=l9_100;
float2 l9_106;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_107=float2(0.0);
float2 l9_108=float2(0.0);
float2 l9_109=float2(0.0);
float2 l9_110=float2(0.0);
float2 l9_111=float2(0.0);
ssGlobals l9_112=l9_105;
float2 l9_113;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_114=float2(0.0);
l9_114=l9_112.Surface_UVCoord0;
l9_108=l9_114;
l9_113=l9_108;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_115=float2(0.0);
l9_115=l9_112.Surface_UVCoord1;
l9_109=l9_115;
l9_113=l9_109;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_116=float2(0.0);
l9_116=l9_112.gScreenCoord;
l9_110=l9_116;
l9_113=l9_110;
}
else
{
float2 l9_117=float2(0.0);
l9_117=l9_112.Surface_UVCoord0;
l9_111=l9_117;
l9_113=l9_111;
}
}
}
l9_107=l9_113;
float2 l9_118=float2(0.0);
float2 l9_119=(*sc_set2.UserUniforms).uv2Scale;
l9_118=l9_119;
float2 l9_120=float2(0.0);
l9_120=l9_118;
float2 l9_121=float2(0.0);
float2 l9_122=(*sc_set2.UserUniforms).uv2Offset;
l9_121=l9_122;
float2 l9_123=float2(0.0);
l9_123=l9_121;
float2 l9_124=float2(0.0);
l9_124=(l9_107*l9_120)+l9_123;
float2 l9_125=float2(0.0);
l9_125=l9_124+(l9_123*(l9_105.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_103=l9_125;
l9_106=l9_103;
}
else
{
float2 l9_126=float2(0.0);
float2 l9_127=float2(0.0);
float2 l9_128=float2(0.0);
float2 l9_129=float2(0.0);
float2 l9_130=float2(0.0);
ssGlobals l9_131=l9_105;
float2 l9_132;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_133=float2(0.0);
l9_133=l9_131.Surface_UVCoord0;
l9_127=l9_133;
l9_132=l9_127;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_134=float2(0.0);
l9_134=l9_131.Surface_UVCoord1;
l9_128=l9_134;
l9_132=l9_128;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_135=float2(0.0);
l9_135=l9_131.gScreenCoord;
l9_129=l9_135;
l9_132=l9_129;
}
else
{
float2 l9_136=float2(0.0);
l9_136=l9_131.Surface_UVCoord0;
l9_130=l9_136;
l9_132=l9_130;
}
}
}
l9_126=l9_132;
float2 l9_137=float2(0.0);
float2 l9_138=(*sc_set2.UserUniforms).uv2Scale;
l9_137=l9_138;
float2 l9_139=float2(0.0);
l9_139=l9_137;
float2 l9_140=float2(0.0);
float2 l9_141=(*sc_set2.UserUniforms).uv2Offset;
l9_140=l9_141;
float2 l9_142=float2(0.0);
l9_142=l9_140;
float2 l9_143=float2(0.0);
l9_143=(l9_126*l9_139)+l9_142;
l9_104=l9_143;
l9_106=l9_104;
}
l9_102=l9_106;
l9_98=l9_102;
l9_101=l9_98;
}
else
{
float2 l9_144=float2(0.0);
l9_144=l9_100.Surface_UVCoord0;
l9_99=l9_144;
l9_101=l9_99;
}
l9_97=l9_101;
float2 l9_145=float2(0.0);
l9_145=l9_97;
float2 l9_146=float2(0.0);
l9_146=l9_145;
l9_90=l9_146;
l9_93=l9_90;
}
else
{
float2 l9_147=float2(0.0);
l9_147=l9_92.Surface_UVCoord0;
l9_91=l9_147;
l9_93=l9_91;
}
}
}
}
l9_86=l9_93;
float2 l9_148=float2(0.0);
float2 l9_149=(*sc_set2.UserUniforms).uv3Scale;
l9_148=l9_149;
float2 l9_150=float2(0.0);
l9_150=l9_148;
float2 l9_151=float2(0.0);
float2 l9_152=(*sc_set2.UserUniforms).uv3Offset;
l9_151=l9_152;
float2 l9_153=float2(0.0);
l9_153=l9_151;
float2 l9_154=float2(0.0);
l9_154=(l9_86*l9_150)+l9_153;
float2 l9_155=float2(0.0);
l9_155=l9_154+(l9_153*(l9_84.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_82=l9_155;
l9_85=l9_82;
}
else
{
float2 l9_156=float2(0.0);
float2 l9_157=float2(0.0);
float2 l9_158=float2(0.0);
float2 l9_159=float2(0.0);
float2 l9_160=float2(0.0);
float2 l9_161=float2(0.0);
ssGlobals l9_162=l9_84;
float2 l9_163;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_164=float2(0.0);
l9_164=l9_162.Surface_UVCoord0;
l9_157=l9_164;
l9_163=l9_157;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_165=float2(0.0);
l9_165=l9_162.Surface_UVCoord1;
l9_158=l9_165;
l9_163=l9_158;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_166=float2(0.0);
l9_166=l9_162.gScreenCoord;
l9_159=l9_166;
l9_163=l9_159;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_167=float2(0.0);
float2 l9_168=float2(0.0);
float2 l9_169=float2(0.0);
ssGlobals l9_170=l9_162;
float2 l9_171;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_172=float2(0.0);
float2 l9_173=float2(0.0);
float2 l9_174=float2(0.0);
ssGlobals l9_175=l9_170;
float2 l9_176;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_177=float2(0.0);
float2 l9_178=float2(0.0);
float2 l9_179=float2(0.0);
float2 l9_180=float2(0.0);
float2 l9_181=float2(0.0);
ssGlobals l9_182=l9_175;
float2 l9_183;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_184=float2(0.0);
l9_184=l9_182.Surface_UVCoord0;
l9_178=l9_184;
l9_183=l9_178;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_185=float2(0.0);
l9_185=l9_182.Surface_UVCoord1;
l9_179=l9_185;
l9_183=l9_179;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_186=float2(0.0);
l9_186=l9_182.gScreenCoord;
l9_180=l9_186;
l9_183=l9_180;
}
else
{
float2 l9_187=float2(0.0);
l9_187=l9_182.Surface_UVCoord0;
l9_181=l9_187;
l9_183=l9_181;
}
}
}
l9_177=l9_183;
float2 l9_188=float2(0.0);
float2 l9_189=(*sc_set2.UserUniforms).uv2Scale;
l9_188=l9_189;
float2 l9_190=float2(0.0);
l9_190=l9_188;
float2 l9_191=float2(0.0);
float2 l9_192=(*sc_set2.UserUniforms).uv2Offset;
l9_191=l9_192;
float2 l9_193=float2(0.0);
l9_193=l9_191;
float2 l9_194=float2(0.0);
l9_194=(l9_177*l9_190)+l9_193;
float2 l9_195=float2(0.0);
l9_195=l9_194+(l9_193*(l9_175.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_173=l9_195;
l9_176=l9_173;
}
else
{
float2 l9_196=float2(0.0);
float2 l9_197=float2(0.0);
float2 l9_198=float2(0.0);
float2 l9_199=float2(0.0);
float2 l9_200=float2(0.0);
ssGlobals l9_201=l9_175;
float2 l9_202;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_203=float2(0.0);
l9_203=l9_201.Surface_UVCoord0;
l9_197=l9_203;
l9_202=l9_197;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_204=float2(0.0);
l9_204=l9_201.Surface_UVCoord1;
l9_198=l9_204;
l9_202=l9_198;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_205=float2(0.0);
l9_205=l9_201.gScreenCoord;
l9_199=l9_205;
l9_202=l9_199;
}
else
{
float2 l9_206=float2(0.0);
l9_206=l9_201.Surface_UVCoord0;
l9_200=l9_206;
l9_202=l9_200;
}
}
}
l9_196=l9_202;
float2 l9_207=float2(0.0);
float2 l9_208=(*sc_set2.UserUniforms).uv2Scale;
l9_207=l9_208;
float2 l9_209=float2(0.0);
l9_209=l9_207;
float2 l9_210=float2(0.0);
float2 l9_211=(*sc_set2.UserUniforms).uv2Offset;
l9_210=l9_211;
float2 l9_212=float2(0.0);
l9_212=l9_210;
float2 l9_213=float2(0.0);
l9_213=(l9_196*l9_209)+l9_212;
l9_174=l9_213;
l9_176=l9_174;
}
l9_172=l9_176;
l9_168=l9_172;
l9_171=l9_168;
}
else
{
float2 l9_214=float2(0.0);
l9_214=l9_170.Surface_UVCoord0;
l9_169=l9_214;
l9_171=l9_169;
}
l9_167=l9_171;
float2 l9_215=float2(0.0);
l9_215=l9_167;
float2 l9_216=float2(0.0);
l9_216=l9_215;
l9_160=l9_216;
l9_163=l9_160;
}
else
{
float2 l9_217=float2(0.0);
l9_217=l9_162.Surface_UVCoord0;
l9_161=l9_217;
l9_163=l9_161;
}
}
}
}
l9_156=l9_163;
float2 l9_218=float2(0.0);
float2 l9_219=(*sc_set2.UserUniforms).uv3Scale;
l9_218=l9_219;
float2 l9_220=float2(0.0);
l9_220=l9_218;
float2 l9_221=float2(0.0);
float2 l9_222=(*sc_set2.UserUniforms).uv3Offset;
l9_221=l9_222;
float2 l9_223=float2(0.0);
l9_223=l9_221;
float2 l9_224=float2(0.0);
l9_224=(l9_156*l9_220)+l9_223;
l9_83=l9_224;
l9_85=l9_83;
}
l9_81=l9_85;
l9_77=l9_81;
l9_80=l9_77;
}
else
{
float2 l9_225=float2(0.0);
l9_225=l9_79.Surface_UVCoord0;
l9_78=l9_225;
l9_80=l9_78;
}
l9_76=l9_80;
float2 l9_226=float2(0.0);
l9_226=l9_76;
float2 l9_227=float2(0.0);
l9_227=l9_226;
l9_20=l9_227;
l9_23=l9_20;
}
else
{
float2 l9_228=float2(0.0);
l9_228=l9_22.Surface_UVCoord0;
l9_21=l9_228;
l9_23=l9_21;
}
}
}
}
l9_16=l9_23;
float4 l9_229=float4(0.0);
int l9_230=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=in.varStereoViewID;
}
int l9_232=l9_231;
l9_230=1-l9_232;
}
else
{
int l9_233=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_233=0;
}
else
{
l9_233=in.varStereoViewID;
}
int l9_234=l9_233;
l9_230=l9_234;
}
int l9_235=l9_230;
int l9_236=baseTexLayout_tmp;
int l9_237=l9_235;
float2 l9_238=l9_16;
bool l9_239=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_240=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_241=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_242=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_243=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_244=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_245=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_246=0.0;
bool l9_247=l9_244&&(!l9_242);
float l9_248=1.0;
float l9_249=l9_238.x;
int l9_250=l9_241.x;
if (l9_250==1)
{
l9_249=fract(l9_249);
}
else
{
if (l9_250==2)
{
float l9_251=fract(l9_249);
float l9_252=l9_249-l9_251;
float l9_253=step(0.25,fract(l9_252*0.5));
l9_249=mix(l9_251,1.0-l9_251,fast::clamp(l9_253,0.0,1.0));
}
}
l9_238.x=l9_249;
float l9_254=l9_238.y;
int l9_255=l9_241.y;
if (l9_255==1)
{
l9_254=fract(l9_254);
}
else
{
if (l9_255==2)
{
float l9_256=fract(l9_254);
float l9_257=l9_254-l9_256;
float l9_258=step(0.25,fract(l9_257*0.5));
l9_254=mix(l9_256,1.0-l9_256,fast::clamp(l9_258,0.0,1.0));
}
}
l9_238.y=l9_254;
if (l9_242)
{
bool l9_259=l9_244;
bool l9_260;
if (l9_259)
{
l9_260=l9_241.x==3;
}
else
{
l9_260=l9_259;
}
float l9_261=l9_238.x;
float l9_262=l9_243.x;
float l9_263=l9_243.z;
bool l9_264=l9_260;
float l9_265=l9_248;
float l9_266=fast::clamp(l9_261,l9_262,l9_263);
float l9_267=step(abs(l9_261-l9_266),9.9999997e-06);
l9_265*=(l9_267+((1.0-float(l9_264))*(1.0-l9_267)));
l9_261=l9_266;
l9_238.x=l9_261;
l9_248=l9_265;
bool l9_268=l9_244;
bool l9_269;
if (l9_268)
{
l9_269=l9_241.y==3;
}
else
{
l9_269=l9_268;
}
float l9_270=l9_238.y;
float l9_271=l9_243.y;
float l9_272=l9_243.w;
bool l9_273=l9_269;
float l9_274=l9_248;
float l9_275=fast::clamp(l9_270,l9_271,l9_272);
float l9_276=step(abs(l9_270-l9_275),9.9999997e-06);
l9_274*=(l9_276+((1.0-float(l9_273))*(1.0-l9_276)));
l9_270=l9_275;
l9_238.y=l9_270;
l9_248=l9_274;
}
float2 l9_277=l9_238;
bool l9_278=l9_239;
float3x3 l9_279=l9_240;
if (l9_278)
{
l9_277=float2((l9_279*float3(l9_277,1.0)).xy);
}
float2 l9_280=l9_277;
float2 l9_281=l9_280;
float2 l9_282=l9_281;
l9_238=l9_282;
float l9_283=l9_238.x;
int l9_284=l9_241.x;
bool l9_285=l9_247;
float l9_286=l9_248;
if ((l9_284==0)||(l9_284==3))
{
float l9_287=l9_283;
float l9_288=0.0;
float l9_289=1.0;
bool l9_290=l9_285;
float l9_291=l9_286;
float l9_292=fast::clamp(l9_287,l9_288,l9_289);
float l9_293=step(abs(l9_287-l9_292),9.9999997e-06);
l9_291*=(l9_293+((1.0-float(l9_290))*(1.0-l9_293)));
l9_287=l9_292;
l9_283=l9_287;
l9_286=l9_291;
}
l9_238.x=l9_283;
l9_248=l9_286;
float l9_294=l9_238.y;
int l9_295=l9_241.y;
bool l9_296=l9_247;
float l9_297=l9_248;
if ((l9_295==0)||(l9_295==3))
{
float l9_298=l9_294;
float l9_299=0.0;
float l9_300=1.0;
bool l9_301=l9_296;
float l9_302=l9_297;
float l9_303=fast::clamp(l9_298,l9_299,l9_300);
float l9_304=step(abs(l9_298-l9_303),9.9999997e-06);
l9_302*=(l9_304+((1.0-float(l9_301))*(1.0-l9_304)));
l9_298=l9_303;
l9_294=l9_298;
l9_297=l9_302;
}
l9_238.y=l9_294;
l9_248=l9_297;
float2 l9_305=l9_238;
int l9_306=l9_236;
int l9_307=l9_237;
float l9_308=l9_246;
float2 l9_309=l9_305;
int l9_310=l9_306;
int l9_311=l9_307;
float3 l9_312=float3(0.0);
if (l9_310==0)
{
l9_312=float3(l9_309,0.0);
}
else
{
if (l9_310==1)
{
l9_312=float3(l9_309.x,(l9_309.y*0.5)+(0.5-(float(l9_311)*0.5)),0.0);
}
else
{
l9_312=float3(l9_309,float(l9_311));
}
}
float3 l9_313=l9_312;
float3 l9_314=l9_313;
float2 l9_315=l9_314.xy;
float l9_316=l9_308;
float4 l9_317=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_315,bias(l9_316));
float4 l9_318=l9_317;
float4 l9_319=l9_318;
if (l9_244)
{
l9_319=mix(l9_245,l9_319,float4(l9_248));
}
float4 l9_320=l9_319;
l9_229=l9_320;
param_10=l9_229;
param_12=param_10;
}
else
{
param_12=param_11;
}
Result_N369=param_12;
float4 Output_N148=float4(0.0);
Output_N148=Value_N384*Result_N369;
float4 Export_N385=float4(0.0);
Export_N385=Output_N148;
float4 Value_N166=float4(0.0);
Value_N166=Export_N385;
float Output_N168=0.0;
Output_N168=Value_N166.w;
float Result_N204=0.0;
float param_14=0.0;
float param_15=(*sc_set2.UserUniforms).Port_Default_N204;
ssGlobals param_17=Globals;
float param_16;
if ((int(ENABLE_OPACITY_TEX_tmp)!=0))
{
float2 l9_321=float2(0.0);
float2 l9_322=float2(0.0);
float2 l9_323=float2(0.0);
float2 l9_324=float2(0.0);
float2 l9_325=float2(0.0);
float2 l9_326=float2(0.0);
ssGlobals l9_327=param_17;
float2 l9_328;
if (NODE_69_DROPLIST_ITEM_tmp==0)
{
float2 l9_329=float2(0.0);
l9_329=l9_327.Surface_UVCoord0;
l9_322=l9_329;
l9_328=l9_322;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==1)
{
float2 l9_330=float2(0.0);
l9_330=l9_327.Surface_UVCoord1;
l9_323=l9_330;
l9_328=l9_323;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==2)
{
float2 l9_331=float2(0.0);
float2 l9_332=float2(0.0);
float2 l9_333=float2(0.0);
ssGlobals l9_334=l9_327;
float2 l9_335;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_336=float2(0.0);
float2 l9_337=float2(0.0);
float2 l9_338=float2(0.0);
ssGlobals l9_339=l9_334;
float2 l9_340;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_341=float2(0.0);
float2 l9_342=float2(0.0);
float2 l9_343=float2(0.0);
float2 l9_344=float2(0.0);
float2 l9_345=float2(0.0);
ssGlobals l9_346=l9_339;
float2 l9_347;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_348=float2(0.0);
l9_348=l9_346.Surface_UVCoord0;
l9_342=l9_348;
l9_347=l9_342;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_349=float2(0.0);
l9_349=l9_346.Surface_UVCoord1;
l9_343=l9_349;
l9_347=l9_343;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_350=float2(0.0);
l9_350=l9_346.gScreenCoord;
l9_344=l9_350;
l9_347=l9_344;
}
else
{
float2 l9_351=float2(0.0);
l9_351=l9_346.Surface_UVCoord0;
l9_345=l9_351;
l9_347=l9_345;
}
}
}
l9_341=l9_347;
float2 l9_352=float2(0.0);
float2 l9_353=(*sc_set2.UserUniforms).uv2Scale;
l9_352=l9_353;
float2 l9_354=float2(0.0);
l9_354=l9_352;
float2 l9_355=float2(0.0);
float2 l9_356=(*sc_set2.UserUniforms).uv2Offset;
l9_355=l9_356;
float2 l9_357=float2(0.0);
l9_357=l9_355;
float2 l9_358=float2(0.0);
l9_358=(l9_341*l9_354)+l9_357;
float2 l9_359=float2(0.0);
l9_359=l9_358+(l9_357*(l9_339.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_337=l9_359;
l9_340=l9_337;
}
else
{
float2 l9_360=float2(0.0);
float2 l9_361=float2(0.0);
float2 l9_362=float2(0.0);
float2 l9_363=float2(0.0);
float2 l9_364=float2(0.0);
ssGlobals l9_365=l9_339;
float2 l9_366;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_367=float2(0.0);
l9_367=l9_365.Surface_UVCoord0;
l9_361=l9_367;
l9_366=l9_361;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_368=float2(0.0);
l9_368=l9_365.Surface_UVCoord1;
l9_362=l9_368;
l9_366=l9_362;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_369=float2(0.0);
l9_369=l9_365.gScreenCoord;
l9_363=l9_369;
l9_366=l9_363;
}
else
{
float2 l9_370=float2(0.0);
l9_370=l9_365.Surface_UVCoord0;
l9_364=l9_370;
l9_366=l9_364;
}
}
}
l9_360=l9_366;
float2 l9_371=float2(0.0);
float2 l9_372=(*sc_set2.UserUniforms).uv2Scale;
l9_371=l9_372;
float2 l9_373=float2(0.0);
l9_373=l9_371;
float2 l9_374=float2(0.0);
float2 l9_375=(*sc_set2.UserUniforms).uv2Offset;
l9_374=l9_375;
float2 l9_376=float2(0.0);
l9_376=l9_374;
float2 l9_377=float2(0.0);
l9_377=(l9_360*l9_373)+l9_376;
l9_338=l9_377;
l9_340=l9_338;
}
l9_336=l9_340;
l9_332=l9_336;
l9_335=l9_332;
}
else
{
float2 l9_378=float2(0.0);
l9_378=l9_334.Surface_UVCoord0;
l9_333=l9_378;
l9_335=l9_333;
}
l9_331=l9_335;
float2 l9_379=float2(0.0);
l9_379=l9_331;
float2 l9_380=float2(0.0);
l9_380=l9_379;
l9_324=l9_380;
l9_328=l9_324;
}
else
{
if (NODE_69_DROPLIST_ITEM_tmp==3)
{
float2 l9_381=float2(0.0);
float2 l9_382=float2(0.0);
float2 l9_383=float2(0.0);
ssGlobals l9_384=l9_327;
float2 l9_385;
if ((int(ENABLE_UV3_tmp)!=0))
{
float2 l9_386=float2(0.0);
float2 l9_387=float2(0.0);
float2 l9_388=float2(0.0);
ssGlobals l9_389=l9_384;
float2 l9_390;
if ((int(ENABLE_UV3_ANIMATION_tmp)!=0))
{
float2 l9_391=float2(0.0);
float2 l9_392=float2(0.0);
float2 l9_393=float2(0.0);
float2 l9_394=float2(0.0);
float2 l9_395=float2(0.0);
float2 l9_396=float2(0.0);
ssGlobals l9_397=l9_389;
float2 l9_398;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_399=float2(0.0);
l9_399=l9_397.Surface_UVCoord0;
l9_392=l9_399;
l9_398=l9_392;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_400=float2(0.0);
l9_400=l9_397.Surface_UVCoord1;
l9_393=l9_400;
l9_398=l9_393;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_401=float2(0.0);
l9_401=l9_397.gScreenCoord;
l9_394=l9_401;
l9_398=l9_394;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_402=float2(0.0);
float2 l9_403=float2(0.0);
float2 l9_404=float2(0.0);
ssGlobals l9_405=l9_397;
float2 l9_406;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_407=float2(0.0);
float2 l9_408=float2(0.0);
float2 l9_409=float2(0.0);
ssGlobals l9_410=l9_405;
float2 l9_411;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_412=float2(0.0);
float2 l9_413=float2(0.0);
float2 l9_414=float2(0.0);
float2 l9_415=float2(0.0);
float2 l9_416=float2(0.0);
ssGlobals l9_417=l9_410;
float2 l9_418;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_419=float2(0.0);
l9_419=l9_417.Surface_UVCoord0;
l9_413=l9_419;
l9_418=l9_413;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_420=float2(0.0);
l9_420=l9_417.Surface_UVCoord1;
l9_414=l9_420;
l9_418=l9_414;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_421=float2(0.0);
l9_421=l9_417.gScreenCoord;
l9_415=l9_421;
l9_418=l9_415;
}
else
{
float2 l9_422=float2(0.0);
l9_422=l9_417.Surface_UVCoord0;
l9_416=l9_422;
l9_418=l9_416;
}
}
}
l9_412=l9_418;
float2 l9_423=float2(0.0);
float2 l9_424=(*sc_set2.UserUniforms).uv2Scale;
l9_423=l9_424;
float2 l9_425=float2(0.0);
l9_425=l9_423;
float2 l9_426=float2(0.0);
float2 l9_427=(*sc_set2.UserUniforms).uv2Offset;
l9_426=l9_427;
float2 l9_428=float2(0.0);
l9_428=l9_426;
float2 l9_429=float2(0.0);
l9_429=(l9_412*l9_425)+l9_428;
float2 l9_430=float2(0.0);
l9_430=l9_429+(l9_428*(l9_410.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_408=l9_430;
l9_411=l9_408;
}
else
{
float2 l9_431=float2(0.0);
float2 l9_432=float2(0.0);
float2 l9_433=float2(0.0);
float2 l9_434=float2(0.0);
float2 l9_435=float2(0.0);
ssGlobals l9_436=l9_410;
float2 l9_437;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_438=float2(0.0);
l9_438=l9_436.Surface_UVCoord0;
l9_432=l9_438;
l9_437=l9_432;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_439=float2(0.0);
l9_439=l9_436.Surface_UVCoord1;
l9_433=l9_439;
l9_437=l9_433;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_440=float2(0.0);
l9_440=l9_436.gScreenCoord;
l9_434=l9_440;
l9_437=l9_434;
}
else
{
float2 l9_441=float2(0.0);
l9_441=l9_436.Surface_UVCoord0;
l9_435=l9_441;
l9_437=l9_435;
}
}
}
l9_431=l9_437;
float2 l9_442=float2(0.0);
float2 l9_443=(*sc_set2.UserUniforms).uv2Scale;
l9_442=l9_443;
float2 l9_444=float2(0.0);
l9_444=l9_442;
float2 l9_445=float2(0.0);
float2 l9_446=(*sc_set2.UserUniforms).uv2Offset;
l9_445=l9_446;
float2 l9_447=float2(0.0);
l9_447=l9_445;
float2 l9_448=float2(0.0);
l9_448=(l9_431*l9_444)+l9_447;
l9_409=l9_448;
l9_411=l9_409;
}
l9_407=l9_411;
l9_403=l9_407;
l9_406=l9_403;
}
else
{
float2 l9_449=float2(0.0);
l9_449=l9_405.Surface_UVCoord0;
l9_404=l9_449;
l9_406=l9_404;
}
l9_402=l9_406;
float2 l9_450=float2(0.0);
l9_450=l9_402;
float2 l9_451=float2(0.0);
l9_451=l9_450;
l9_395=l9_451;
l9_398=l9_395;
}
else
{
float2 l9_452=float2(0.0);
l9_452=l9_397.Surface_UVCoord0;
l9_396=l9_452;
l9_398=l9_396;
}
}
}
}
l9_391=l9_398;
float2 l9_453=float2(0.0);
float2 l9_454=(*sc_set2.UserUniforms).uv3Scale;
l9_453=l9_454;
float2 l9_455=float2(0.0);
l9_455=l9_453;
float2 l9_456=float2(0.0);
float2 l9_457=(*sc_set2.UserUniforms).uv3Offset;
l9_456=l9_457;
float2 l9_458=float2(0.0);
l9_458=l9_456;
float2 l9_459=float2(0.0);
l9_459=(l9_391*l9_455)+l9_458;
float2 l9_460=float2(0.0);
l9_460=l9_459+(l9_458*(l9_389.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N063));
l9_387=l9_460;
l9_390=l9_387;
}
else
{
float2 l9_461=float2(0.0);
float2 l9_462=float2(0.0);
float2 l9_463=float2(0.0);
float2 l9_464=float2(0.0);
float2 l9_465=float2(0.0);
float2 l9_466=float2(0.0);
ssGlobals l9_467=l9_389;
float2 l9_468;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_469=float2(0.0);
l9_469=l9_467.Surface_UVCoord0;
l9_462=l9_469;
l9_468=l9_462;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_470=float2(0.0);
l9_470=l9_467.Surface_UVCoord1;
l9_463=l9_470;
l9_468=l9_463;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_471=float2(0.0);
l9_471=l9_467.gScreenCoord;
l9_464=l9_471;
l9_468=l9_464;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_472=float2(0.0);
float2 l9_473=float2(0.0);
float2 l9_474=float2(0.0);
ssGlobals l9_475=l9_467;
float2 l9_476;
if ((int(ENABLE_UV2_tmp)!=0))
{
float2 l9_477=float2(0.0);
float2 l9_478=float2(0.0);
float2 l9_479=float2(0.0);
ssGlobals l9_480=l9_475;
float2 l9_481;
if ((int(ENABLE_UV2_ANIMATION_tmp)!=0))
{
float2 l9_482=float2(0.0);
float2 l9_483=float2(0.0);
float2 l9_484=float2(0.0);
float2 l9_485=float2(0.0);
float2 l9_486=float2(0.0);
ssGlobals l9_487=l9_480;
float2 l9_488;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_489=float2(0.0);
l9_489=l9_487.Surface_UVCoord0;
l9_483=l9_489;
l9_488=l9_483;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_490=float2(0.0);
l9_490=l9_487.Surface_UVCoord1;
l9_484=l9_490;
l9_488=l9_484;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_491=float2(0.0);
l9_491=l9_487.gScreenCoord;
l9_485=l9_491;
l9_488=l9_485;
}
else
{
float2 l9_492=float2(0.0);
l9_492=l9_487.Surface_UVCoord0;
l9_486=l9_492;
l9_488=l9_486;
}
}
}
l9_482=l9_488;
float2 l9_493=float2(0.0);
float2 l9_494=(*sc_set2.UserUniforms).uv2Scale;
l9_493=l9_494;
float2 l9_495=float2(0.0);
l9_495=l9_493;
float2 l9_496=float2(0.0);
float2 l9_497=(*sc_set2.UserUniforms).uv2Offset;
l9_496=l9_497;
float2 l9_498=float2(0.0);
l9_498=l9_496;
float2 l9_499=float2(0.0);
l9_499=(l9_482*l9_495)+l9_498;
float2 l9_500=float2(0.0);
l9_500=l9_499+(l9_498*(l9_480.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N022));
l9_478=l9_500;
l9_481=l9_478;
}
else
{
float2 l9_501=float2(0.0);
float2 l9_502=float2(0.0);
float2 l9_503=float2(0.0);
float2 l9_504=float2(0.0);
float2 l9_505=float2(0.0);
ssGlobals l9_506=l9_480;
float2 l9_507;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_508=float2(0.0);
l9_508=l9_506.Surface_UVCoord0;
l9_502=l9_508;
l9_507=l9_502;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_509=float2(0.0);
l9_509=l9_506.Surface_UVCoord1;
l9_503=l9_509;
l9_507=l9_503;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_510=float2(0.0);
l9_510=l9_506.gScreenCoord;
l9_504=l9_510;
l9_507=l9_504;
}
else
{
float2 l9_511=float2(0.0);
l9_511=l9_506.Surface_UVCoord0;
l9_505=l9_511;
l9_507=l9_505;
}
}
}
l9_501=l9_507;
float2 l9_512=float2(0.0);
float2 l9_513=(*sc_set2.UserUniforms).uv2Scale;
l9_512=l9_513;
float2 l9_514=float2(0.0);
l9_514=l9_512;
float2 l9_515=float2(0.0);
float2 l9_516=(*sc_set2.UserUniforms).uv2Offset;
l9_515=l9_516;
float2 l9_517=float2(0.0);
l9_517=l9_515;
float2 l9_518=float2(0.0);
l9_518=(l9_501*l9_514)+l9_517;
l9_479=l9_518;
l9_481=l9_479;
}
l9_477=l9_481;
l9_473=l9_477;
l9_476=l9_473;
}
else
{
float2 l9_519=float2(0.0);
l9_519=l9_475.Surface_UVCoord0;
l9_474=l9_519;
l9_476=l9_474;
}
l9_472=l9_476;
float2 l9_520=float2(0.0);
l9_520=l9_472;
float2 l9_521=float2(0.0);
l9_521=l9_520;
l9_465=l9_521;
l9_468=l9_465;
}
else
{
float2 l9_522=float2(0.0);
l9_522=l9_467.Surface_UVCoord0;
l9_466=l9_522;
l9_468=l9_466;
}
}
}
}
l9_461=l9_468;
float2 l9_523=float2(0.0);
float2 l9_524=(*sc_set2.UserUniforms).uv3Scale;
l9_523=l9_524;
float2 l9_525=float2(0.0);
l9_525=l9_523;
float2 l9_526=float2(0.0);
float2 l9_527=(*sc_set2.UserUniforms).uv3Offset;
l9_526=l9_527;
float2 l9_528=float2(0.0);
l9_528=l9_526;
float2 l9_529=float2(0.0);
l9_529=(l9_461*l9_525)+l9_528;
l9_388=l9_529;
l9_390=l9_388;
}
l9_386=l9_390;
l9_382=l9_386;
l9_385=l9_382;
}
else
{
float2 l9_530=float2(0.0);
l9_530=l9_384.Surface_UVCoord0;
l9_383=l9_530;
l9_385=l9_383;
}
l9_381=l9_385;
float2 l9_531=float2(0.0);
l9_531=l9_381;
float2 l9_532=float2(0.0);
l9_532=l9_531;
l9_325=l9_532;
l9_328=l9_325;
}
else
{
float2 l9_533=float2(0.0);
l9_533=l9_327.Surface_UVCoord0;
l9_326=l9_533;
l9_328=l9_326;
}
}
}
}
l9_321=l9_328;
float4 l9_534=float4(0.0);
int l9_535=0;
if ((int(opacityTexHasSwappedViews_tmp)!=0))
{
int l9_536=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_536=0;
}
else
{
l9_536=in.varStereoViewID;
}
int l9_537=l9_536;
l9_535=1-l9_537;
}
else
{
int l9_538=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_538=0;
}
else
{
l9_538=in.varStereoViewID;
}
int l9_539=l9_538;
l9_535=l9_539;
}
int l9_540=l9_535;
int l9_541=opacityTexLayout_tmp;
int l9_542=l9_540;
float2 l9_543=l9_321;
bool l9_544=(int(SC_USE_UV_TRANSFORM_opacityTex_tmp)!=0);
float3x3 l9_545=(*sc_set2.UserUniforms).opacityTexTransform;
int2 l9_546=int2(SC_SOFTWARE_WRAP_MODE_U_opacityTex_tmp,SC_SOFTWARE_WRAP_MODE_V_opacityTex_tmp);
bool l9_547=(int(SC_USE_UV_MIN_MAX_opacityTex_tmp)!=0);
float4 l9_548=(*sc_set2.UserUniforms).opacityTexUvMinMax;
bool l9_549=(int(SC_USE_CLAMP_TO_BORDER_opacityTex_tmp)!=0);
float4 l9_550=(*sc_set2.UserUniforms).opacityTexBorderColor;
float l9_551=0.0;
bool l9_552=l9_549&&(!l9_547);
float l9_553=1.0;
float l9_554=l9_543.x;
int l9_555=l9_546.x;
if (l9_555==1)
{
l9_554=fract(l9_554);
}
else
{
if (l9_555==2)
{
float l9_556=fract(l9_554);
float l9_557=l9_554-l9_556;
float l9_558=step(0.25,fract(l9_557*0.5));
l9_554=mix(l9_556,1.0-l9_556,fast::clamp(l9_558,0.0,1.0));
}
}
l9_543.x=l9_554;
float l9_559=l9_543.y;
int l9_560=l9_546.y;
if (l9_560==1)
{
l9_559=fract(l9_559);
}
else
{
if (l9_560==2)
{
float l9_561=fract(l9_559);
float l9_562=l9_559-l9_561;
float l9_563=step(0.25,fract(l9_562*0.5));
l9_559=mix(l9_561,1.0-l9_561,fast::clamp(l9_563,0.0,1.0));
}
}
l9_543.y=l9_559;
if (l9_547)
{
bool l9_564=l9_549;
bool l9_565;
if (l9_564)
{
l9_565=l9_546.x==3;
}
else
{
l9_565=l9_564;
}
float l9_566=l9_543.x;
float l9_567=l9_548.x;
float l9_568=l9_548.z;
bool l9_569=l9_565;
float l9_570=l9_553;
float l9_571=fast::clamp(l9_566,l9_567,l9_568);
float l9_572=step(abs(l9_566-l9_571),9.9999997e-06);
l9_570*=(l9_572+((1.0-float(l9_569))*(1.0-l9_572)));
l9_566=l9_571;
l9_543.x=l9_566;
l9_553=l9_570;
bool l9_573=l9_549;
bool l9_574;
if (l9_573)
{
l9_574=l9_546.y==3;
}
else
{
l9_574=l9_573;
}
float l9_575=l9_543.y;
float l9_576=l9_548.y;
float l9_577=l9_548.w;
bool l9_578=l9_574;
float l9_579=l9_553;
float l9_580=fast::clamp(l9_575,l9_576,l9_577);
float l9_581=step(abs(l9_575-l9_580),9.9999997e-06);
l9_579*=(l9_581+((1.0-float(l9_578))*(1.0-l9_581)));
l9_575=l9_580;
l9_543.y=l9_575;
l9_553=l9_579;
}
float2 l9_582=l9_543;
bool l9_583=l9_544;
float3x3 l9_584=l9_545;
if (l9_583)
{
l9_582=float2((l9_584*float3(l9_582,1.0)).xy);
}
float2 l9_585=l9_582;
float2 l9_586=l9_585;
float2 l9_587=l9_586;
l9_543=l9_587;
float l9_588=l9_543.x;
int l9_589=l9_546.x;
bool l9_590=l9_552;
float l9_591=l9_553;
if ((l9_589==0)||(l9_589==3))
{
float l9_592=l9_588;
float l9_593=0.0;
float l9_594=1.0;
bool l9_595=l9_590;
float l9_596=l9_591;
float l9_597=fast::clamp(l9_592,l9_593,l9_594);
float l9_598=step(abs(l9_592-l9_597),9.9999997e-06);
l9_596*=(l9_598+((1.0-float(l9_595))*(1.0-l9_598)));
l9_592=l9_597;
l9_588=l9_592;
l9_591=l9_596;
}
l9_543.x=l9_588;
l9_553=l9_591;
float l9_599=l9_543.y;
int l9_600=l9_546.y;
bool l9_601=l9_552;
float l9_602=l9_553;
if ((l9_600==0)||(l9_600==3))
{
float l9_603=l9_599;
float l9_604=0.0;
float l9_605=1.0;
bool l9_606=l9_601;
float l9_607=l9_602;
float l9_608=fast::clamp(l9_603,l9_604,l9_605);
float l9_609=step(abs(l9_603-l9_608),9.9999997e-06);
l9_607*=(l9_609+((1.0-float(l9_606))*(1.0-l9_609)));
l9_603=l9_608;
l9_599=l9_603;
l9_602=l9_607;
}
l9_543.y=l9_599;
l9_553=l9_602;
float2 l9_610=l9_543;
int l9_611=l9_541;
int l9_612=l9_542;
float l9_613=l9_551;
float2 l9_614=l9_610;
int l9_615=l9_611;
int l9_616=l9_612;
float3 l9_617=float3(0.0);
if (l9_615==0)
{
l9_617=float3(l9_614,0.0);
}
else
{
if (l9_615==1)
{
l9_617=float3(l9_614.x,(l9_614.y*0.5)+(0.5-(float(l9_616)*0.5)),0.0);
}
else
{
l9_617=float3(l9_614,float(l9_616));
}
}
float3 l9_618=l9_617;
float3 l9_619=l9_618;
float2 l9_620=l9_619.xy;
float l9_621=l9_613;
float4 l9_622=sc_set2.opacityTex.sample(sc_set2.opacityTexSmpSC,l9_620,bias(l9_621));
float4 l9_623=l9_622;
float4 l9_624=l9_623;
if (l9_549)
{
l9_624=mix(l9_550,l9_624,float4(l9_553));
}
float4 l9_625=l9_624;
l9_534=l9_625;
float l9_626=0.0;
l9_626=l9_534.x;
param_14=l9_626;
param_16=param_14;
}
else
{
param_16=param_15;
}
Result_N204=param_16;
float Output_N72=0.0;
float param_18=1.0;
float param_19=(*sc_set2.UserUniforms).Port_Input2_N072;
ssGlobals param_21=Globals;
float param_20;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_627=float4(0.0);
l9_627=param_21.VertexColor;
float l9_628=0.0;
l9_628=l9_627.w;
param_18=l9_628;
param_20=param_18;
}
else
{
param_20=param_19;
}
Output_N72=param_20;
float Output_N205=0.0;
Output_N205=(Output_N168*Result_N204)*Output_N72;
float Export_N158=0.0;
Export_N158=Output_N205;
float param_22=Export_N158;
param_22=fast::clamp(param_22,0.0,1.0);
float l9_629=param_22;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_629<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_630=gl_FragCoord;
float2 l9_631=floor(mod(l9_630.xy,float2(4.0)));
float l9_632=(mod(dot(l9_631,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_629<l9_632)
{
discard_fragment();
}
}
return out;
}
} // RECEIVER MODE SHADER
