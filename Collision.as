﻿package  {		import flash.events.Event;	import flash.display.MovieClip;		public class Collision extends MovieClip{				public function Collision() {			// constructor code			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		}				public function onAddedToStage(event:Event)		{			//remove the intializer			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			this.addEventListener(Event.ENTER_FRAME, onTick);		}				public function onTick(event:Event){			 			 var hero = Game.gameContainer.hero;			 var levelMap = Game.gameContainer.levelMap;						//Check Collsion First						if (levelMap.collsion_mc.hitTestPoint(hero.x + hero.DownBumpPoint.x,hero.y + hero.DownBumpPoint.y,true))			{				hero.DownBump = true;			}			else			{				hero.DownBump = false;			}			if (levelMap.collsion_mc.hitTestPoint(hero.x + hero.UpBumpPoint.x,hero.y + hero.UpBumpPoint.y,true))			{				hero.UpBump = true;			}			else			{				hero.UpBump = false;			}			if (levelMap.collsion_mc.hitTestPoint(hero.x + hero.LeftBumpPoint.x,hero.y + hero.LeftBumpPoint.y,true))			{				hero.LeftBump = true;			}			else			{				hero.LeftBump = false;			}			if (levelMap.collsion_mc.hitTestPoint(hero.x + hero.RightBumpPoint.x,hero.y + hero.RightBumpPoint.y,true))			{						hero.RightBump = true;			}			else			{				hero.RightBump = false;			}		}	}	}