package custom.shader.materials
{
	import laya.d3.core.material.BaseMaterial;
	import laya.d3.math.Vector4;
	import laya.d3.shader.Shader3D;
	import laya.webgl.resource.BaseTexture;
	
	public class DistortionMaterial extends BaseMaterial
	{
		
		public static const DISTORTIONTEXTURE:int = Shader3D.propertyNameToID("u_DistortionTexture");
		public static const DISTORTIONPOS:int = Shader3D.propertyNameToID("u_DistortionPos");
		
		public function DistortionMaterial()
		{
			super();
			this.setShaderName("distortion");
			distortionPos = new Vector4(100,0,0,0);
		}
		
		public function set distortionPos(value:Vector4):void
		{
			_shaderValues.setVector(DISTORTIONPOS,value);
		}
	}
}