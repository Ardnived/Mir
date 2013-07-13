package 
{
	import flash.display.MovieClip;

	public class Game extends MovieClip
	{
		public static const gameContainer:GameLevel;

		public function Game()
		{
			// constructor code
			gameContainer = new GameLevel();
			addChild(gameContainer);			
		}

	}

}