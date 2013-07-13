package 
{
	import flash.display.MovieClip;

	public class Game extends MovieClip
	{
		//Setting up Keyboard Inputs
		static var inputManager:InputManager;
		
		//Setting up the level
		static var gameContainer:GameLevel;

		//Setting up Characters
		static var hero:Hero;
		
		//Setting up Variables
		static var scrollX:Number = 0;
		static var scrollY:Number = 0;

		public function Game()
		{
			// constructor code
			initialize();
		}//end method

		public function initialize()
		{
			//Initializing Input Manager
			inputManager = new InputManager();
			
			//Initializing Game Level
			gameContainer = new GameLevel();
			addChild(gameContainer);
			
			//Initializing Hero
			hero = new Hero();
			hero.x = 0;
			hero.y = 0;
			addChild(hero);
		}//end Method
	}
}