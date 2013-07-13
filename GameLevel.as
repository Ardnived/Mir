package 
{
	import flash.events.Event;
	import flash.display.MovieClip;

	public class GameLevel extends MovieClip
	{	
		//Setting up variables
		var level:Number;
		
		//Setting up Platforms
		var ground:Platform;

		public function GameLevel()
		{
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}//end method

		public function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

			//Set Variables
			level = 1;
			
			//Initializing Ground
			ground = new Platform();
			ground.x = stage.width/2;
			ground.width = stage.width;
			ground.y = stage.height;
			addChild(ground);
		}//end Method

	}

}