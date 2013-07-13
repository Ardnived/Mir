﻿package  {
	import flash.display.MovieClip;
	
	public class Platform extends Layout{

		//attach the hero
		var tempPlayer:Hero;
		
		public function Platform() {
			
			//intializer
			this.addEventListener(event.Event.ADDED_TO_STAGE, onAddedToStage);
		}

		public override function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(event.Event.ADDED_TO_STAGE, onAddedToStage);
			//tempPlayer holds the reference to the hero
			tempPlayer = new Hero();
			tempPlayer = Game.GameLevel.Hero;
			//this methodchecks if there is a collision
			this.addEventListener(event.Event.ENTER_FRAME, checkCollision);
		}//end method
		
		public function checkCollision(event:Event)
		{
			//if it hits left
			if(this.hitTestObject(tempPlayer) && tempPlayer.x + tempPlayer.width >= this.x )
			{
				tempPlayer.x = this.x - tempPlayer.width;
			}
			//if it hits right
			if(this.hitTestObject(tempPlayer) && tempPlayer.x <= this.x + this.width)
			{
				tempPlayer.x = this.x + this.width;
			}
			//if it hits above
			if(this.hitTestObject(tempPlayer) && tempPlayer.y + tempPlayer.height >= this.y )
			{
				tempPlayer.y = this.y - tempPlayer.height;
			}
			//if it hits below
			if(this.hitTestObject(tempPlayer) && tempPlayer.y <= this.y + this.height )
			{
				tempPlayer.y = this.y + this.height;
			}
		}//end method
		

	}
	
}
