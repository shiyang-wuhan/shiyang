package scripts
{
	import laya.d3.component.Script3D;
	import laya.d3.core.BaseCamera;
	import laya.d3.core.Camera;
	import laya.d3.core.MeshSprite3D;
	import laya.d3.core.material.SkyProceduralMaterial;
	import laya.d3.core.scene.Scene3D;
	import laya.d3.math.Vector3;
	import laya.d3.resource.models.SkyBox;
	import laya.d3.resource.models.SkyDome;
	import laya.d3.resource.models.SkyRenderer;
	import laya.events.Event;
	import laya.events.Keyboard;
	
	public class GameScript extends Script3D
	{
		
		private var scene3D:Scene3D;
		private var camera:Camera;
		private var road1:MeshSprite3D;
		private var road2:MeshSprite3D;
		private var road3:MeshSprite3D;
		private var proad:MeshSprite3D;
		private var croad:MeshSprite3D;
		private var nroad:MeshSprite3D;
		private var cDir:Number;
		
		private var out:Vector3 = new Vector3();
		
		public function GameScript()
		{
			super();
		}
		
		override public function onAwake():void
		{
			scene3D = owner as Scene3D;
			
			camera = scene3D.getChildByName("Main Camera") as Camera;
			road1 = scene3D.getChildByName("Road1") as MeshSprite3D;
			road2 = scene3D.getChildByName("Road2") as MeshSprite3D;
			road3 = scene3D.getChildByName("Road3") as MeshSprite3D;
			
			cDir = road1.transform.position.z - camera.transform.position.z;
			
			croad = road1;
			
			Laya.stage.on(Event.KEY_DOWN,this,onKeyHandler);
		}
		
		override public function onUpdate():void
		{
			updateRoad();
		}
		
		private function updateRoad():void
		{
			var currentZ:Number = cDir + camera.transform.position.z;
			var targetZ:Number = croad.transform.position.z + 10;
			if(currentZ >= targetZ)
			{
				trace("xxxxxxxxxxxx",currentZ,targetZ);
				if(!proad)
				{
					proad = road1;
					croad = road2;
					nroad = road3;
				}else
				{
					var temp:MeshSprite3D = croad;
					croad = nroad;
					nroad = proad;
					proad = temp;
				}
				
				out.x = 0;
				out.y = 0;
				out.z = nroad.transform.position.z + 10;
				proad.transform.position = out;
			}
		}
		
		private function onKeyHandler(e:Event):void
		{
			switch(e.keyCode)
			{
				case Keyboard.W:
					out.x = 0;
					out.y = 0;
					out.z = 1;
					camera.transform.translate(out,false);
					break;
				case Keyboard.S:
					out.x = 0;
					out.y = 0;
					out.z = -1;
					camera.transform.translate(out,false);
					break;
				case Keyboard.SPACE:
					trace(cDir,camera.transform.position.z,croad.transform.position.z);
					break;
			}
		}
	}
}