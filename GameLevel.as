﻿package 
{
	import flash.events.Event;
	import flash.display.MovieClip;

	public class GameLevel extends MovieClip
	{
		//Setting up variables
		var level:Number;
		
		var levelMap:Layout = new Layout();

		public function GameLevel()
		{
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}//end method

		public function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onTick);

			//Set Variables
			level = 1;
			
			//Initializing Layout
			addChild(levelMap);
		}//end Method

		function onTick(event:Event)
		{
			//Moving the map
			Game.scrollX -=  Game.hero.velocityX;
			Game.scrollY -=  Game.hero.velocityY;

			levelMap.x = Game.scrollX;
			levelMap.y = Game.scrollY;
		}

	}

}