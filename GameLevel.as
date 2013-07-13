package 
{
	import flash.events.Event;

	public class GameLevel extends Game
	{	
		//Setting up variables
		var level:Number;
		
		//Setting up Platforms
		var ground:Platform;

		public function GameLevel()
		{
			// constructor code
			this.addEventListener(event.Event.ADDED_TO_STAGE, onAddedToStage);
		}//end method

		public override function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(event.Event.ADDED_TO_STAGE, onAddedToStage);

			//Set Variables
			level = 1;
			
			//Initializing Ground
			ground = new Platform();
			ground.x = stage.width/2;
			ground.width = stage;
			ground.y = stage.height;
			addChild(ground);		
		}//end Method

	}

}