﻿package  {	import flash.events.Event;	import flash.events.KeyboardEvent;		public class Hero extends Entity {		public static const speed:Number = 20;		public static const jump:Number = 30;		var isLatch:Boolean = false;		var isCrouch:Boolean = false;				public override function onAddedToStage(event:Event) {			super.onAddedToStage(event);			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);		}				public override function onTick(event:Event) {			//super.onTick();			if (Game.inputManager.isLeft) {				this.velocityX -= Hero.speed;			}			if (Game.inputManager.isRight ) {				this.velocityX += Hero.speed;			}			if (Game.inputManager.isJump ) {				this.velocityY -= Hero.speed;			}		}				public function keyDownHandler(event:KeyboardEvent) {			if (Game.inputManager.CROUCH.indexOf(event.keyCode) ) {				this.isCrouch = true;			}		}				public function keyUpHandler(event:KeyboardEvent) {			if (Game.inputManager.CROUCH.indexOf(event.keyCode) ) {				this.isCrouch = false;			}		}	}	}