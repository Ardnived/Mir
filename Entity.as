﻿package 
{
	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.MovieClip;

	public class Entity extends MovieClip
	{

		//the friction value
		public const FRICTION:Number = 0;
		public const GRAVITY:Number = 1;
		var velocityX:Number = 0;
		var velocityY:Number = 0;
		var animationFrame:Number;
		var spawnPoint:Point;

		public function Entity()
		{
			//intializer
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}//end method

		public function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onTick);
		}//end Method

		//this method destroys the object
		public function die()
		{
			this.parent.removeChild(this);
		}
		//TODO: Remove all references, particularly event listeners. Or make sure that the references are weak.;
		
		public function onTick(event:Event)
		{
			this.velocityX -= FRICTION;
			this.velocityY += GRAVITY;
			this.x += this.velocityX;
			this.y += this.velocityY;
		}
	}

}