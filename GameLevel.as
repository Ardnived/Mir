package 
{

	public class GameLevel extends Game
	{		
		var level:Number;
		//Setting up Characters
		var mir:Hero;
		//Setting up Platforms
		var ground:Platform;

		public function GameLevel()
		{
			// constructor code
			this.addEventListener(event.Event.ADDED_TO_STAGE, onAddedToStage);
		}//end method

		public function onAddedToStage(event:Event)
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
			
			//Initializing Hero
			mir = new Hero();
			mir.x = stage.width/2;
			mir.y = 0;
			addChild(ground);			
		}//end Method

	}

}