<<<<<<< HEAD
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
=======
﻿package {	import flash.events.Event;	import flash.geom.Point;	public class GrapplePoint extends GrappleItem	{		public function GrapplePoint()		{			// constructor code			this.addEventListener(Event.ENTER_FRAME,onTick);		}		function onTick(event:Event)		{				trace(Game.gameContainer.levelMap.x + " : " + Game.gameContainer.levelMap.y);			if (this.hitTestObject(Game.gameContainer.hook))			{				var Pos = new Point(this.x + Game.gameContainer.levelMap.x,this.y + Game.gameContainer.levelMap.y);				Game.gameContainer.set(Pos.x,Pos.y);			}		}	}}
>>>>>>> f8d270004fb906f768abe3205f73d4343b2c1ea8
