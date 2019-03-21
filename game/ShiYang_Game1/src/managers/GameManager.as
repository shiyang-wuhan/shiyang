package managers
{
	public class GameManager
	{
		public function GameManager()
		{
		}
		
		/**游戏暂停**/
		public function pause():void
		{
			Laya.stage.renderingEnabled = false;
		}
		
		/**游戏恢复**/
		public function resume():void
		{
			Laya.stage.renderingEnabled = true;
		}
	}
}