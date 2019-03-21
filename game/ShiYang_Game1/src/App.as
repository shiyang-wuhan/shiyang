package
{
	import managers.AssetManager;
	import managers.GameManager;

	public class App
	{
		
		public static const gm:GameManager = new GameManager();
		public static const asset:AssetManager = new AssetManager();
		
		public function App()
		{
		}
	}
}