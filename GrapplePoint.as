﻿﻿package {	import flash.events.Event;	import flash.geom.Point;	public class GrapplePoint extends GrappleItem	{		public function GrapplePoint()		{			// constructor code			this.addEventListener(Event.ENTER_FRAME,onTick);		}		function onTick(event:Event)		{			trace(this.x,this.y);						if (this.hitTestObject(Game.gameContainer.hook) && !Game.gameContainer.hook.isHit)			{				trace( "this postion: " + this.x + " : " + this.y +					  	" level map: " +Game.gameContainer.levelMap.x + " : " + Game.gameContainer.levelMap.y +						" Hero containter: " +  Game.gameContainer.hero.x  + " : " + Game.gameContainer.hero.y);				/*				Game.gameContainer.set(this.x + this.parent.x - Game.gameContainer.hero.x,									   this.y + this.parent.y - Game.gameContainer.hero.y);				*/								var point:Point = this.parent.localToGlobal(new Point(this.x, this.y));				var hero:Point = this.parent.localToGlobal(new Point(Game.gameContainer.hero.x, Game.gameContainer.hero.y));				Game.gameContainer.move(hero.x - point.x, hero.y - point.y);								Game.gameContainer.hook.isHit = true;			}		}	}}