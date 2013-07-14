﻿package 
{
	import flash.events.Event;
	import flash.geom.Point;

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
				var Pos = new Point(this.x - Game.gameContainer.levelMap.x,this.y - Game.gameContainer.levelMap.y);
				Game.gameContainer.move(Pos.x,Pos.y);
			}
		}

	}

}