package scenes
{
	import laya.display.Scene;
	import laya.ui.ProgressBar;
	import laya.ui.View;
	import laya.utils.Handler;
	
	public class FirstScene extends View
	{
		
		
		private var progressBar:ProgressBar;
		private var progressHandler:Handler;
		private var completeHandler:Handler;
		
		public function FirstScene()
		{
			super();
		}
		
		override public function onAwake():void
		{
			progressHandler = Handler.create(this,onProgress,null,false);
			completeHandler = Handler.create(this,onComplete,null,false);
		}
		
		override public function onEnable():void
		{
			Laya.loader.create(App.asset.getFirstNeedAssetList(),completeHandler,progressHandler);
		}
		
		private function onProgress(value:Number):void
		{
			progressBar.value = value;
		}
		
		private function onComplete():void
		{
			Scene.open("Game.scene");
		}
		
		override public function onDestroy():void
		{
			progressHandler && progressHandler.recover();
			completeHandler && completeHandler.recover();
			progressHandler = null;
			completeHandler = null;
		}
	}
}