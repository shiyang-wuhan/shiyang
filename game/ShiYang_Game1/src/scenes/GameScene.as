package scenes
{
	import laya.d3.core.scene.Scene3D;
	import laya.ui.View;
	
	import scripts.GameScript;
	
	public class GameScene extends View
	{
		
		private var scene3D:Scene3D;
		
		public function GameScene()
		{
			super();
		}
		
		override public function onAwake():void
		{
			
		}
		
		override public function onEnable():void
		{
			scene3D = Laya.loader.getRes(App.asset.game_ls) as Scene3D;
			scene3D.addComponent(GameScript);
			this.addChild(scene3D);
		}
		
		override public function onDestroy():void
		{
		
		}
	}
}