package 
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;

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

			//Initializing Keyboard Listeners
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);

			//Initializing Game Level
			gameContainer = new GameLevel();
			addChild(gameContainer);

			//Initializing Hero
			hero = new Hero();
			hero.x = 0;
			hero.y = 0;
			addChild(hero);
		}//end Method

		//Keyboard Handler Functions
		//Detect if certain key is being press
		public function keyDownHandler(e:KeyboardEvent):void
		{
			//Debug keyCode
			trace(e.keyCode);
			//WASD
			if (e.keyCode == 65)
			{
				inputManager.isLeft = true;
			}
			if (e.keyCode == 68)
			{
				inputManager.isRight = true;
			}
			if (e.keyCode == 87)
			{
				inputManager.isUp = true;
			}
			if (e.keyCode == 83)
			{
				inputManager.isCrouch = true;
			}
			//ARROW KEYS
			if (e.keyCode == 37)
			{
				inputManager.isLeft = true;
			}
			if (e.keyCode == 39)
			{
				inputManager.isRight = true;
			}
			if (e.keyCode == 38)
			{
				inputManager.isUp = true;
			}
			if (e.keyCode == 40)
			{
				inputManager.isCrouch = true;
			}
			//SPACEBAR
			if (e.keyCode == 32)
			{
				inputManager.isJump = true;
			}
			//E Key to interact
			if (e.keyCode == 69)
			{
				inputManager.isInteract = true;
			}
			//Escape Key
			if (e.keyCode == 27)
			{
				inputManager.isPause = true;
			}
		}

		//Detect if certain key is being release
		public function keyUpHandler(e:KeyboardEvent):void
		{
			//WASD
			if (e.keyCode == 65)
			{
				inputManager.isLeft = false;
			}
			if (e.keyCode == 68)
			{
				inputManager.isRight = false;
			}
			if (e.keyCode == 87)
			{
				inputManager.isUp = false;
			}
			if (e.keyCode == 83)
			{
				inputManager.isCrouch = false;
			}
			//ARROW KEYS
			if (e.keyCode == 37)
			{
				inputManager.isLeft = false;
			}
			if (e.keyCode == 39)
			{
				inputManager.isRight = false;
			}
			if (e.keyCode == 38)
			{
				inputManager.isUp = false;
			}
			if (e.keyCode == 40)
			{
				inputManager.isCrouch = false;
			}
			//SPACEBAR
			if (e.keyCode == 32)
			{
				inputManager.isJump = false;
			}
			//E Key to interact
			if (e.keyCode == 69)
			{
				inputManager.isInteract = false;
			}
			//Escape Key
			if (e.keyCode == 27)
			{
				inputManager.isPause = false;
			}
		}
	}
}