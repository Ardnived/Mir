package 
{
	import flash.events.KeyboardEvent;
	import flash.display.MovieClip;

	public class InputManager extends MovieClip
	{
		//boolean
		var isRight:Boolean = false;
		var isLeft:Boolean = false;
		var isCrouch:Boolean = false;
		var isJump:Boolean = false;
		var isUp:Boolean = false;
		var isInteract:Boolean = false;
		var isPause:Boolean = false;
		public const JUMP:Array = new Array(32);
		public const LEFT:Array = new Array(65,37);
		public const RIGHT:Array = new Array(68,39);
		public const UP:Array = new Array(87,38);
		public const CROUCH:Array = new Array(83,40);
		public const INTERACT:Array = new Array(69);
		public const PAUSE:Array = new Array(27);

		public function InputManager()
		{
			// constructor code
			addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}

		//Keyboard Handler Functions
		//Detect if certain key is being press
		public function keyDownHandler(e:KeyboardEvent):void
		{
			//Debug keyCode
			//trace(e.keyCode);
			//WASD
			if (e.keyCode == 65)
			{
				isLeft = true;
			}
			if (e.keyCode == 68)
			{
				isRight = true;
			}
			if (e.keyCode == 87)
			{
				isUp = true;
			}
			if (e.keyCode == 83)
			{
				isCrouch = true;
			}
			//ARROW KEYS
			if (e.keyCode == 37)
			{
				isLeft = true;
			}
			if (e.keyCode == 39)
			{
				isRight = true;
			}
			if (e.keyCode == 38)
			{
				isUp = true;
			}
			if (e.keyCode == 40)
			{
				isCrouch = true;
			}
			//SPACEBAR
			if (e.keyCode == 32)
			{
				isJump = true;
			}
			//E Key to interact
			if (e.keyCode == 69)
			{
				isInteract = true;
			}
			//Escape Key
			if (e.keyCode == 27)
			{
				isPause = true;
			}
		}

		//Detect if certain key is being release
		public function keyUpHandler(e:KeyboardEvent):void
		{
			//WASD
			if (e.keyCode == 65)
			{
				isLeft = false;
			}
			if (e.keyCode == 68)
			{
				isRight = false;
			}
			if (e.keyCode == 87)
			{
				isUp = false;
			}
			if (e.keyCode == 83)
			{
				isCrouch = false;
			}
			//ARROW KEYS
			if (e.keyCode == 37)
			{
				isLeft = false;
			}
			if (e.keyCode == 39)
			{
				isRight = false;
			}
			if (e.keyCode == 38)
			{
				isUp = false;
			}
			if (e.keyCode == 40)
			{
				isCrouch = false;
			}
			//SPACEBAR
			if (e.keyCode == 32)
			{
				isJump = false;
			}
			//E Key to interact
			if (e.keyCode == 69)
			{
				isInteract = false;
			}
			//Escape Key
			if (e.keyCode == 27)
			{
				isPause = false;
			}
		}

	}

}