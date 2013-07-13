package 
{
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

		}


	}

}