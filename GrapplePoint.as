package 
{
	import flash.events.Event;

	public class GrapplePoint extends GrappleItem
	{

		public function GrapplePoint()
		{
			// constructor code
			this.addEventListener(Event.ENTER_FRAME,onTick);
		}

		function onTick(event:Event)
		{
			if (this.hitTestObject(Game.gameContainer.hook))
			{
				Pos = new Point(this.x - Game.gameContainer.levelMap.x,this.y - Game.gameContainer.levelMap.y);
				Game.gameContainer.move(Pos.x,Pos.y);
			}
		}

	}

}