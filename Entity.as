package 
{
	import flash.geom.Point;
	import flash.events.Event;
	import flash.display.MovieClip;

	public class Entity extends MovieClip
	{

		//the friction value
		public const FRICTION:Number = 5;
		public const GRAVITY:Number = 5;
		var velocityX:Number;
		var velocityY:Number;
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


		public function onTick()
		{
			this.x +=  velocityX - FRICTION;
			this.y -=  velocityY + GRAVITY;
		}
	}

}