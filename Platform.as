﻿package  {	import flash.display.MovieClip;	import flash.events.Event;		public class Platform extends MovieClip {				public function Platform() {			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		}		public function onAddedToStage(event:Event)		{			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			//this methodchecks if there is a collision			this.addEventListener(Event.ENTER_FRAME, checkCollision);		} //end method				public function checkCollision(event:Event)		{			//if it hits left			if ( this.hitTestObject(Game.hero) ) {				trace("touching");				if (Game.hero.velocityX > 0 && Game.hero.x + Game.hero.width >= this.x )				{					Game.hero.x = this.x - Game.hero.width;				}				//if it hits right				if (Game.hero.velocityX < 0 && Game.hero.x <= this.x + this.width)				{					Game.hero.x = this.x + this.width;				}				//if it hits above				if (Game.hero.velocityY > 0 && Game.hero.y + Game.hero.height >= this.y )				{					Game.hero.y = this.y - Game.hero.height;					Game.hero.isCollidingBelow = true;				}else{					Game.hero.isCollidingBelow = false;				}				//if it hits below				if (Game.hero.velocityY < 0 && Game.hero.y <= this.y + this.height )				{					Game.hero.y = this.y + this.height;				}			}		}//end method	}	}