package custom.ui
{
	import laya.ui.WXOpenDataViewer;
	
	public class WXOpenDataView extends WXOpenDataViewer
	{
		
		private var loopNum:int;
		private var count:int;
		
		public function WXOpenDataView()
		{
			super();
		}
		
		override public function onEnable():void {
			postMsg({type: "display",rate:Laya.stage.frameRate});
		}
		
		override public function onDisable():void {
			postMsg({type: "undisplay"});
			Laya.timer.clear(this, _onLoop);
		}
		
		public function startLoop(frame:int = 1,loopNum:uint=0,atonce:Boolean=false):void
		{
			if(window.wx && window.sharedCanvas)
			{
				this.loopNum = loopNum;
				count = 0;
				Laya.timer.frameLoop(frame, this, _onLoop);
				if(loopNum > 0)
				{
					atonce && draw();
				}
			}
		}
		
		private function _onLoop():void {
			trace("WXOpenDataView loop");
			draw();
			if(loopNum > 0)
			{
				count++;
				if(count >= loopNum)
				{
					Laya.timer.clear(this, _onLoop);
				}
			}
		}
		
		public function draw():void
		{
			if(texture)
			{
				texture.bitmap.loadImageSource(window.sharedCanvas);
			}
		}
	}
}