﻿package  {	import flash.events.Event;	import fl.transitions.Tween;	import fl.transitions.TweenEvent;	import fl.transitions.easing.*;	import flash.display.MovieClip;	import flash.geom.Point;	import flash.events.TimerEvent;	import flash.utils.Timer;			public class GrappleHook extends MovieClip 	{		static const COOLDOWN:Number = 10;		var isHit:Boolean;				var duration:Number = 0.15;		var cooldown:Number = 0;		var isReady:Boolean = true;		var cooldownTimer:Timer;		var initialPos:Point;				//controls the movement		var myMovement:Tween;			public function GrappleHook(){			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		}			public function onAddedToStage(event:Event)		{			initialPos = new Point();			//remove the intializer			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			this.addEventListener(Event.ENTER_FRAME, onTick);						//timer			cooldownTimer = new Timer(COOLDOWN);			cooldownTimer.addEventListener("timer", readyToShoot);					}//end method				public function onTick(event:Event) {			/*			if ( this.hitTestObject(Game.gameContainer.levelMap.collsion_mc) && this.visible ) {				Game.sound.playSound(new Array(SoundManager.MIR_GRAP_HIT_01, SoundManager.MIR_GRAP_HIT_02, SoundManager.MIR_GRAP_HIT_03), SoundManager.EFFECT);				this.visible = false;			}			*/		}//end method		public function readyToShoot(event:TimerEvent){			cooldownTimer.stop();			Game.inputManager.mouseClick = false;			isReady = true;		}				public function fireHook(target:Point)		{				if (isReady)			{								isHit = false;				this.visible = true;				this.x = Game.gameContainer.hero.x;				this.y = Game.gameContainer.hero.y;				initialPos = new Point(Game.gameContainer.hero.x - Game.gameContainer.levelMap.x, 								   Game.gameContainer.hero.y - Game.gameContainer.levelMap.y);				//trace("Pew Pew: " + initialPos + "map: " + Game.gameContainer.levelMap.x +" : " + Game.gameContainer.levelMap.y);				myMovement = new Tween(this,"x",None.easeIn,Game.gameContainer.hero.x, target.x,duration,true);				myMovement = new Tween(this,"y",None.easeIn,Game.gameContainer.hero.y, target.y,duration,true);										myMovement.addEventListener(TweenEvent.MOTION_FINISH, onMotionFinished);								isReady = false;				Game.sound.playSound(SoundManager.MIR_GRAP_FIRE, SoundManager.EFFECT);				cooldownTimer.start();			}					}//end method				function onMotionFinished($evt:TweenEvent):void{			this.visible = false;		}//end method	}//end class}//end package