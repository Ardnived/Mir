package 
{
	//Importing Stuffs
	import flash.events.Event;
	import flash.geom.Point;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.display.MovieClip;

	public class Game extends MovieClip
	{
		//Hero
		static var hero:Hero = new Hero  ;
		//layout
		static var layout:Layout = new Layout  ;

		//Basic Movement
		var isRight:Boolean;
		var isLeft:Boolean;
		var isUp:Boolean;
		var isDown:Boolean;

		//Additional Movement
		var isJump:Boolean;

		//Collsion Detections
		var RightBump:Boolean;
		var LeftBump:Boolean;
		var UpBump:Boolean;
		var DownBump:Boolean;

		var RightBumpPoint:Point = new Point(15,0);
		var LeftBumpPoint:Point = new Point(-15,0);
		var UpBumpPoint:Point = new Point(0,-30);
		var DownBumpPoint:Point = new Point(0,30);

		//Speed Variables
		var xSpeed:Number = 0;
		var ySpeed:Number = 0;

		//Map Position
		var scrollX:Number = 800;
		var scrollY:Number = 140;
		var cameraX:Number = hero.x - scrollX;
		var cameraY:Number = hero.y - scrollY;

		//Force Constants
		var speedConstant:Number = 4;
		var frictionConstant:Number = 0.5;
		var gravityConstant:Number = 1.8;

		var jumpConstant:Number = -32;
		var maxSpeedConstant:Number = 10;

		public function Game()
		{
			// constructor code
			//Event Listeners
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);

			stage.addEventListener(Event.ENTER_FRAME,loop);

			//Spawning Hero
			hero.x = 400;
			hero.y = 275;
			addChild(hero);

			//Spawning Map
			addChild(layout);
		}//end method

		//Loop Function
		function loop(e:Event):void
		{
			//Check Collsion First
			if (layout.collsion_mc.hitTestPoint(hero.x + DownBumpPoint.x,hero.y + DownBumpPoint.y,true))
			{
				DownBump = true;
			}
			else
			{
				DownBump = false;
			}
			if (layout.collsion_mc.hitTestPoint(hero.x + UpBumpPoint.x,hero.y + UpBumpPoint.y,true))
			{
				UpBump = true;
			}
			else
			{
				UpBump = false;
			}
			if (layout.collsion_mc.hitTestPoint(hero.x + LeftBumpPoint.x,hero.y + LeftBumpPoint.y,true))
			{
				LeftBump = true;
			}
			else
			{
				LeftBump = false;
			}
			if (layout.collsion_mc.hitTestPoint(hero.x + RightBumpPoint.x,hero.y + RightBumpPoint.y,true))
			{
				RightBump = true;
			}
			else
			{
				RightBump = false;
			}

			//React to Gravity
			if ((DownBump == true))
			{
				if ((ySpeed > 0))
				{
					ySpeed = 0;//set the y speed to zero
				}
				if (isJump)
				{//and if the up arrow is pressed
					ySpeed = jumpConstant;//set the y speed to the jump constant
				}
			}
			else
			{

				ySpeed +=  gravityConstant;

			}

			//React to Bumps
			if (LeftBump)
			{
				if ((xSpeed < 0))
				{
					xSpeed *=  -0.5;
				}
			}

			if (RightBump)
			{
				if ((xSpeed > 0))
				{
					xSpeed *=  -0.5;
				}
			}

			if (UpBump)
			{
				if ((ySpeed < 0))
				{
					ySpeed *=  -0.5;
				}
			}

			//Moving
			if ((isLeft && ! LeftBump))
			{
				xSpeed -=  speedConstant;
				hero.scaleX = -1;

			}
			if ((isRight && ! RightBump))
			{
				xSpeed +=  speedConstant;
				hero.scaleX = 1;
			}

			//Couching
			if (isDown)
			{
				hero.gotoAndStop("couch");
				RightBumpPoint = new Point(15,15);
				LeftBumpPoint = new Point(-15,15);
			}
			else
			{
				if (hero.currentFrame != 1)
				{
					hero.gotoAndStop("stand");
					RightBumpPoint = new Point(15,0);
					LeftBumpPoint = new Point(-15,0);
				}
			}

			//Ladder
			if (isUp)
			{
			}

			//Scale down if too fast;
			if ((xSpeed > maxSpeedConstant))
			{//moving right
				xSpeed = maxSpeedConstant;
			}
			else if ((xSpeed < (maxSpeedConstant * -1)))
			{//moving left
				xSpeed = (maxSpeedConstant * -1);
			}

			if (Math.abs(xSpeed) < 0.5)
			{
				xSpeed = 0;
			}

			//Adding Friction
			xSpeed *=  frictionConstant;
			ySpeed *=  0.9;

			//Moving the map
			scrollX -=  xSpeed;
			scrollY -=  ySpeed;

			layout.x = scrollX;
			layout.y = scrollY;
		}

		//Keyboard Handler Functions
		function keyDownHandler(e:KeyboardEvent):void
		{
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
				isJump = true;
			}
		}

		function keyUpHandler(e:KeyboardEvent):void
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
				isJump = false;
			}
		}
	}

	public function initialize1()
	{
		//Initializing Input Manager
		inputManager = new InputManager  ;

		//Initializing Keyboard Listeners
		stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
		stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);

		//Initializing Game Level
		gameContainer = new GameLevel  ;
		addChild(gameContainer);

		//Initializing Hero
		hero = new Hero  ;
		hero.x = 0;
		hero.y = 0;
		addChild(hero);
	}//end Method

	//Keyboard Handler Functions
	//Detect if certain key is being press
	public function keyDownHandler1(e:KeyboardEvent):void
	{
		//Debug keyCode
		trace(e.keyCode);
		//WASD
		if (e.keyCode == 65 || e.keyCode == 37)
		{
			inputManager.set(InputManager.LEFT,true);
		}
		if (e.keyCode == 68 || e.keyCode == 39)
		{
			inputManager.set(InputManager.RIGHT,true);
		}
		if (e.keyCode == 87 || e.keyCode == 38)
		{
			inputManager.set(InputManager.UP,true);
		}
		if (e.keyCode == 83 || e.keyCode == 40)
		{
			inputManager.set(InputManager.DOWN,true);
		}
		//SPACEBAR;
		if (e.keyCode == 32)
		{
			inputManager.set(InputManager.JUMP,true);
		}
		//E Key to interact;
		if (e.keyCode == 69)
		{
			inputManager.set(InputManager.INTERACT,true);
		}
		//Escape Key;
		if (e.keyCode == 27)
		{
			inputManager.set(InputManager.PAUSE,true);
		}
	}

	//Detect if certain key is being release
	public function keyUpHandler1(e:KeyboardEvent):void
	{
		//WASD
		if (e.keyCode == 65 || e.keyCode == 37)
		{
			inputManager.set(InputManager.LEFT,false);
		}
		if (e.keyCode == 68 || e.keyCode == 39)
		{
			inputManager.set(InputManager.RIGHT,false);
		}
		if (e.keyCode == 87 || e.keyCode == 38)
		{
			inputManager.set(InputManager.UP,false);
		}
		if (e.keyCode == 83 || e.keyCode == 40)
		{
			inputManager.set(InputManager.DOWN,false);
		}
		//SPACEBAR;
		if (e.keyCode == 32)
		{
			inputManager.set(InputManager.JUMP,false);
		}
		//E Key to interact;
		if (e.keyCode == 69)
		{
			inputManager.set(InputManager.INTERACT,false);
		}
		//Escape Key;
		if (e.keyCode == 27)
		{
			inputManager.set(InputManager.PAUSE,false);
		}
	}
}