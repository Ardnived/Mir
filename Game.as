package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Game extends MovieClip
	{
		//Setting up the level
		static var gameContainer:GameLevel;

		//Setting up Characters
		static var hero:Hero;

		public function Game()
		{
			// constructor code
			this.addEventListener(event.Event.ADDED_TO_STAGE, onAddedToStage);
		}//end method

		public function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(event.Event.ADDED_TO_STAGE, onAddedToStage);

			//Initializing Hero
			mir = new Hero();
			mir.x = stage.width / 2;
			mir.y = 0;
			addChild(ground);
		}//end Method
	}
}