package  {
	
	public class Hero extends Entity {
		var static const speed:Float = 20;
		var static const jump:Float = 30;
		var isLatch:Boolean = false;
		var isCrouch:Boolean = false;
		
		public function Hero() {
			stage.addEventListener(KeyboardEvent.ENTER_FRAME, onTick);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		public function onTick() {
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
			if ( InputManager.CROUCH contains event.keyCode ) {
				this.isCrouch = true;
			}
		}
		
		public function keyUpHandler(event:KeyboardEvent) {
			if ( InputManager.CROUCH contains event.keyCode ) {
				this.isCrouch = false;
			}
		}
	}
	
}
