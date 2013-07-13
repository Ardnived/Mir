﻿package  {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Hero extends Entity {
		public static const speed:Float = 20;
		public static const jump:Float = 30;
		var isLatch:Boolean = false;
		var isCrouch:Boolean = false;
		
		public override function onAddedToStage(event:Event) {
			super.onAddedToStage(event);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		public override function onTick() {
			super.onTick();
			if ( InputManager.isLeft ) {
				this.velocityX -= Hero.speed;
			}
			if ( InputManager.isRight ) {
				this.velocityX += Hero.speed;
			}
			if ( InputManager.isJump ) {
				this.velocityY -= Hero.speed;
			}
		}
		
		public function keyDownHandler(event:KeyboardEvent) {
			if ( InputManager.CROUCH.indexOf(event.keyCode) ) {
				this.isCrouch = true;
			}
		}
		
		public function keyUpHandler(event:KeyboardEvent) {
			if ( InputManager.CROUCH.indexOf(event.keyCode) ) {
				this.isCrouch = false;
			}
		}
	}
	
}
