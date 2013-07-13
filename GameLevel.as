﻿package {	import flash.events.Event;	import flash.display.MovieClip;	import flash.geom.Point;	public class GameLevel extends MovieClip	{		//Setting up variables		var level:Number;		var hero:Hero = new Hero();		var levelMap:Layout = new Layout();		var collision:Collision = new Collision();				//Map Position		var scrollX:Number = 960;		var scrollY:Number = 900;				public function GameLevel()		{			// constructor code			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		}//end method		public function onAddedToStage(event:Event)		{			//remove the intializer			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			this.addEventListener(Event.ENTER_FRAME, onTick);			//Set Variables			level = 1;			//Spawning Hero			hero.x = 400;			hero.y = 275;			addChild(hero);			//Spawning Map			addChild(levelMap);			//TODO: add map coordinates						addChild(collision);					}//end Method		//Loop Function		function onTick(e:Event):void		{			//Moving the map			scrollX -=  hero.velocityX;			scrollY -=  hero.velocityY;			levelMap.x = scrollX;			levelMap.y = scrollY;		}	}}