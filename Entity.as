﻿package 
{
	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Entity extends MovieClip
	{
		//The Force Constants
		public const FRICTION:Number = 0.5;
		public const AIRFRICTION:Number = 0.9;
		public const GRAVITY:Number = 1.8;
		public const MAXSPEED:Number = 30;
		public const SPEED:Number = 10;
		public const JUMP:Number = -40;

		//shoot boolean
		var canShoot:Boolean = false;

		//Shoot timer
		var shootTimer:Timer;

		var velocityX:Number = 0;
		var velocityY:Number = 0;
		var animationFrame:Number;

		public function Entity()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}//end method

		public function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME,onTick);

			//shootTimer
			shootTimer = new Timer(2000);
			shootTimer.addEventListener("timer",readyShoot);
			shootTimer.start();
		}
		//end Method;
		
		function readyShoot(event:TimerEvent){
			//allow to shoot
			canShoot = true;
			shootTimer.stop();
		}
		
		//this method destroys the object
		public function die()
		{
			this.parent.removeChild(this);
		}
		//TODO: Remove all references, particularly event listeners. Or make sure that the references are weak.;

		public function onTick(event:Event)
		{
			this.x +=  this.velocityX;
			this.y +=  this.velocityY;
		}
	}

}