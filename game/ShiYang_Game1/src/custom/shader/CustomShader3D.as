package custom.shader
{
	import custom.shader.materials.DistortionBlinnPhongMaterial;
	
	import laya.d3.core.SkinnedMeshSprite3D;
	import laya.d3.graphics.Vertex.VertexMesh;
	import laya.d3.shader.Shader3D;
	import laya.d3.shader.SubShader;

	public class CustomShader3D
	{
		public function CustomShader3D()
		{
		}
		
		public static function init():void
		{
			
//			Shader3D.debugMode = true;
			
			var vs:String,ps:String;
			var attributeMap:Object,uniformMap:Object;
			
			vs = __INCLUDESTR__("DistortionBlinnPhong.vs");
			ps = __INCLUDESTR__("DistortionBlinnPhong.ps");
			
			attributeMap = {
				'a_Position': VertexMesh.MESH_POSITION0, 
				'a_Color': VertexMesh.MESH_COLOR0, 
				'a_Normal': VertexMesh.MESH_NORMAL0, 
				'a_Texcoord0': VertexMesh.MESH_TEXTURECOORDINATE0, 
				'a_Texcoord1': VertexMesh.MESH_TEXTURECOORDINATE1, 
				'a_BoneWeights': VertexMesh.MESH_BLENDWEIGHT0, 
				'a_BoneIndices': VertexMesh.MESH_BLENDINDICES0, 
				'a_Tangent0': VertexMesh.MESH_TANGENT0};
			uniformMap = {
				'u_Bones': Shader3D.PERIOD_CUSTOM, 
				'u_DiffuseTexture': Shader3D.PERIOD_MATERIAL, 
				'u_SpecularTexture': Shader3D.PERIOD_MATERIAL, 
				'u_NormalTexture': Shader3D.PERIOD_MATERIAL, 
				'u_AlphaTestValue': Shader3D.PERIOD_MATERIAL, 
				'u_DiffuseColor': Shader3D.PERIOD_MATERIAL, 
				'u_MaterialSpecular': Shader3D.PERIOD_MATERIAL, 
				'u_Shininess': Shader3D.PERIOD_MATERIAL, 
				'u_TilingOffset': Shader3D.PERIOD_MATERIAL,
				
				'u_WorldMat': Shader3D.PERIOD_SPRITE, 
				'u_MvpMatrix': Shader3D.PERIOD_SPRITE, 
				'u_LightmapScaleOffset':Shader3D.PERIOD_SPRITE, 
				'u_LightMap':  Shader3D.PERIOD_SPRITE,
				
				'u_CameraPos': Shader3D.PERIOD_CAMERA, 
				
				'u_ReflectTexture': Shader3D.PERIOD_SCENE, 
				'u_ReflectIntensity': Shader3D.PERIOD_SCENE, 
				'u_FogStart':Shader3D.PERIOD_SCENE, 
				'u_FogRange': Shader3D.PERIOD_SCENE, 
				'u_FogColor': Shader3D.PERIOD_SCENE, 
				'u_DirectionLight.Color': Shader3D.PERIOD_SCENE,
				'u_DirectionLight.Direction': Shader3D.PERIOD_SCENE,  
				'u_PointLight.Position':  Shader3D.PERIOD_SCENE, 
				'u_PointLight.Range': Shader3D.PERIOD_SCENE, 
				'u_PointLight.Color': Shader3D.PERIOD_SCENE, 
				'u_SpotLight.Position':Shader3D.PERIOD_SCENE, 
				'u_SpotLight.Direction':Shader3D.PERIOD_SCENE, 
				'u_SpotLight.Range':Shader3D.PERIOD_SCENE, 
				'u_SpotLight.Spot':  Shader3D.PERIOD_SCENE, 
				'u_SpotLight.Color': Shader3D.PERIOD_SCENE, 
				'u_AmbientColor': Shader3D.PERIOD_SCENE,
				'u_shadowMap1': Shader3D.PERIOD_SCENE, 
				'u_shadowMap2': Shader3D.PERIOD_SCENE, 
				'u_shadowMap3': Shader3D.PERIOD_SCENE, 
				'u_shadowPSSMDistance':  Shader3D.PERIOD_SCENE, 
				'u_lightShadowVP':  Shader3D.PERIOD_SCENE, 
				'u_shadowPCFoffset': Shader3D.PERIOD_SCENE,
				'u_CurveX':Shader3D.PERIOD_MATERIAL,
				'u_CurveY':Shader3D.PERIOD_MATERIAL
				};
			
			DistortionBlinnPhongMaterial.__init__();
			
			var shader:Shader3D = Shader3D.add("DISTORTIONBLINNPHONG");
			var subShader:SubShader = new SubShader(attributeMap, uniformMap, SkinnedMeshSprite3D.shaderDefines, DistortionBlinnPhongMaterial.shaderDefines);
			shader.addSubShader(subShader);
			subShader.addShaderPass(vs,ps);
			
			
			
			
//			var shader:Shader3D = Shader3D.add("distortion");
//			var subShader:SubShader = new SubShader(attributeMap,uniformMap);
//			shader.addSubShader(subShader);
//			subShader.addShaderPass(vs,ps);
		}
		
	}
}