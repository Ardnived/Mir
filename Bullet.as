﻿package {	import flash.events.Event;	import flash.display.MovieClip;		public class Bullet extends MovieClip	{		var dir:int = 0;		var isFired:Boolean;		var speed:int = 0;		var hook:GrappleHook = new GrappleHook();		var range:int = 100;				public function Bullet()		{			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);			//dir = d;		}		public function onAddedToStage(event:Event)		{			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);			//onTick			this.addEventListener(Event.ENTER_FRAME, onTick);			isFired = false;						addChild(hook);		}		public function onTick(event:Event)		{				trace("Bullet pos: "+this.x,this.y);			if(isFired)			{				this.visible = true;				speed = 10;				//change dir				if( Game.gameContainer.guard.x +Game.gameContainer.levelMap.x > Game.gameContainer.hero.x){	dir = 0; trace("shoot to left");}				else {dir = 1;}								this.visible = true;				hook.x = this.x;				hook.y = this.y;					if (this.x >= stage.width - 16000 || this.x <= 0)				{					resetPos();								}				if (this.y >= stage.height || this.y <= 0)				{					resetPos();				}				if (dir == 0)				{					this.x -=  speed;				}				else				{					this.x +=  speed;				}				//this.x - Game.gameContainer.hero.x / 10;					if (this.hitTestObject(Game.gameContainer.hero))				{					Game.gameContainer.hero.die();					resetPos();				}//end if															}//end if		}//end method				public function resetPos(){			this.visible = true ;			isFired = false;			speed = 0;						//this.x = Game.gameContainer.guard.x+Game.gameContainer.levelMap.x;			//this.y = Game.gameContainer.guard.y+Game.gameContainer.levelMap.y;			trace("moved to: "+ this.x,this.y);		}//end emthod	}}