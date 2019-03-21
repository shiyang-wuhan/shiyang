package managers
{
	public class AssetManager
	{
		
		public var game_ls:String = "res/scenes/game/Conventional/Game.ls";
		
		public function AssetManager()
		{
		}
		
		public function getFirstNeedAssetList():Array
		{
			var list:Array = [];
			list.push(game_ls);
			return list;
		}
	}
}