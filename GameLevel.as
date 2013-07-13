package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.geom.Point;

	public class GameLevel extends MovieClip
	{
		//Setting up variables
		var level:Number;

		var hero:Hero = new Hero();
		var levelMap:Layout = new Layout();

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
		var UpBumpPoint:Point = new Point(0,-15);
		var DownBumpPoint:Point = new Point(0,15);

		//Speed Variables
		var xSpeed:Number = 0;
		var ySpeed:Number = 0;

		//Map Position
		var scrollX:Number = 960;
		var scrollY:Number = 900;
		var cameraX:Number = hero.x - scrollX;
		var cameraY:Number = hero.y - scrollY;

		public function GameLevel()
		{
			// constructor code
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}//end method

		public function onAddedToStage(event:Event)
		{
			//remove the intializer
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onTick);

			//Set Variables
			level = 1;

			//Spawning Hero
			hero.x = 400;
			hero.y = 275;
			addChild(hero);

			//Spawning Map
			addChild(levelMap);
		}//end Method

		//Loop Function
		function onTick(e:Event):void
		{
			//Check Collsion First
			if (levelMap.collsion_mc.hitTestPoint(hero.x + DownBumpPoint.x,hero.y + DownBumpPoint.y,true))
			{
				DownBump = true;
			}
			else
			{
				DownBump = false;
			}
			if (levelMap.collsion_mc.hitTestPoint(hero.x + UpBumpPoint.x,hero.y + UpBumpPoint.y,true))
			{
				UpBump = true;
			}
			else
			{
				UpBump = false;
			}
			if (levelMap.collsion_mc.hitTestPoint(hero.x + LeftBumpPoint.x,hero.y + LeftBumpPoint.y,true))
			{
				LeftBump = true;
			}
			else
			{
				LeftBump = false;
			}
			if (levelMap.collsion_mc.hitTestPoint(hero.x + RightBumpPoint.x,hero.y + RightBumpPoint.y,true))
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
					ySpeed = hero.JUMP;//set the y speed to the jump constant
				}
			}
			else
			{

				ySpeed +=  hero.GRAVITY;

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
				xSpeed -=  hero.SPEED;
				hero.scaleX = -1;

			}
			if ((isRight && ! RightBump))
			{
				xSpeed +=  hero.SPEED;
				hero.scaleX = 1;
			}

			//Couching
			if (isDown)
			{
			}

			//Ladder
			if (isUp)
			{
			}

			//Scale down if too fast;
			if ((xSpeed > hero.MAXSPEED))
			{//moving right
				xSpeed = hero.MAXSPEED;
			}
			else if ((xSpeed < (hero.MAXSPEED * -1)))
			{//moving left
				xSpeed = (hero.MAXSPEED * -1);
			}

			if (Math.abs(xSpeed) < 0.5)
			{
				xSpeed = 0;
			}

			//Adding Friction
			xSpeed *=  hero.FRICTION;
			ySpeed *=  hero.AIRFRICTION;

			//Moving the map
			scrollX -=  xSpeed;
			scrollY -=  ySpeed;

			levelMap.x = scrollX;
			levelMap.y = scrollY;
		}

	}

}