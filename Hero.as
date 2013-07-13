package  {
	
	public class Hero extends Entity {
		var static const speed:Float = 1.0;
		var isLatch:Boolean = false;
		var isCrouch:Boolean = false;
		
		public function Hero() {
			stage.addEventListener(KeyboardEvent.ENTER_FRAME, onTick);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
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
		
		public function keyUpHandler() {
			
		}
		
		public function keyDownHandler() {
			
		}
	}
	
}
