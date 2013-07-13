﻿package 
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

		public function Game()
		{
			// constructor code
			initialize();
		}//end method

		public function initialize()
		{
			//Initializing Input Manager
			inputManager = new InputManager();
			addChild(inputManager);

			//Initializing Game Level
			gameContainer = new GameLevel();
			addChild(gameContainer);

			//Initializing Hero
			hero = new Hero();
			hero.x = stage.width / 2;
			hero.y = 0;
			addChild(hero);
		}//end Method
	}
}