package 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;

	public class Hero extends Entity
	{
		var isLatch:Boolean = false;
		var isCrouch:Boolean = false;
		var isCollidingBelow:Boolean = false;

		public override function onAddedToStage(event:Event)
		{
			super.onAddedToStage(event);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}

		public override function onTick(event:Event)
		{
			if (Game.inputManager.isPressed[InputManager.LEFT])
			{
				this.velocityX -=  SPEED;
			}
			if (Game.inputManager.isPressed[InputManager.RIGHT])
			{
				this.velocityX +=  SPEED;
			}
		}

		public function keyDownHandler(event:KeyboardEvent)
		{
			if (Game.inputManager.justPressed[InputManager.DOWN])
			{
				this.isCrouch = true;
			}
		}

		public function keyUpHandler(event:KeyboardEvent)
		{
			if (Game.inputManager.justPressed[InputManager.DOWN])
			{
				this.isCrouch = false;
			}

			if (Game.inputManager.justPressed[InputManager.JUMP])
			{
				this.velocityY - JUMP;
			}
		}
	}


}