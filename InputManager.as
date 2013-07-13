package 
{

	public class InputManager extends Game
	{
		//boolean
		var isRight:Boolean = false;
		var isLeft:Boolean = false;
		var isUp:Boolean = false;
		var isDown:Boolean = false;
		var isSpace:Boolean = false;

		public function InputManager()
		{
			// constructor code
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}

		//Keyboard Handler Functions
		//Detect if certain key is being press
		public function keyDownHandler(e:KeyboardEvent):void
		{
			trace(e.keyCode);
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
				isDown = true;
			}
			if (e.keyCode == 32)
			{
				isSpace = true;
			}
		}

		//Detect if certain key is being release
		public function keyUpHandler(e:KeyboardEvent):void
		{
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
				isDown = false;
			}
			if (e.keyCode == 32)
			{
				isSpace = false;
			}
		}

	}

}