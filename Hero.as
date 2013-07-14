package 
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;

	public class Hero extends Entity
	{
		static const SCALE:Number = 1.0;

		var isLatch:Boolean = false;
		var isCrouch:Boolean = false;
		var isDead:Boolean = false;

		//Collsion Detections
		var RightBump:Boolean = false;
		var LeftBump:Boolean = false;
		var UpBump:Boolean = false;
		var DownBump:Boolean = false;
		var canLatch:Boolean = false;

		var RightBumpPoint:Point;
		var LeftBumpPoint:Point;
		var UpBumpPoint:Point;
		var DownBumpPoint:Point;

		var LastPos:Point;

		//animation
		var STANCE:String;

		public override function onAddedToStage(event:Event)
		{
			super.onAddedToStage(event);

			RightBumpPoint = new Point(this.width / 2,0);
			LeftBumpPoint = new Point( -  this.width / 2,0);
			UpBumpPoint = new Point(0, -  this.height / 2);
			DownBumpPoint = new Point(0,this.height / 2);

			this.scaleX = Hero.SCALE;
			this.scaleY = Hero.SCALE;

			STANCE = "idle";

			Game.gameContainer.checkP.lastestCheckpoint.x = Game.gameContainer.scrollX;
			Game.gameContainer.checkP.lastestCheckpoint.y = Game.gameContainer.scrollY;
		}

		public override function die()
		{
			isDead = true;
			//Game.gameContainer.guard.forget();
		}
		//turning isAlert off;


		public override function onTick(event:Event)
		{
			//if the player is down under 0, kill her
			if (Game.gameContainer.scrollY <= -200)
			{
				isDead = true;
			}

			if (! DownBump && ! isLatch)
			{
				velocityY +=  this.GRAVITY;
			}

			//Moving
			if (Game.inputManager.isCmdPressed(InputManager.LEFT))
			{
				if ((LeftBump && canLatch))
				{
					if (! isCrouch)
					{
						this.isLatch = true;
					}
				}
				else
				{

					this.isLatch = false;
					velocityX -=  this.SPEED;
					this.scaleX = Hero.SCALE;


				}
			}
			if (Game.inputManager.isCmdPressed(InputManager.RIGHT))
			{
				if ((RightBump && canLatch))
				{
					if (! isCrouch)
					{
						this.isLatch = true;
					}
				}
				else
				{

					this.isLatch = false;
					velocityX +=  this.SPEED;
					this.scaleX =  -  Hero.SCALE;


				}
			}
			//Latching
			if ((isLatch && (LeftBump || RightBump)))
			{
				if (Game.inputManager.isCmdPressed(InputManager.UP) && ! UpBump && canLatch)
				{
					Game.gameContainer.move(0, -  this.SPEED / 2);
				}
				else if (Game.inputManager.isCmdPressed(InputManager.DOWN) && ! DownBump && canLatch)
				{
					Game.gameContainer.move(0,this.SPEED / 2);
				}
			}

			//Crouching

			if ((DownBump && isCrouch))
			{
				//change to Crouch Bitmap
				UpBumpPoint = new Point(0,0);
			}
			else
			{
				UpBumpPoint = new Point(0, -  this.height / 2);
			}

			//Jumping
			if (Game.inputManager.justCmdPressed(InputManager.JUMP) && ! UpBump && DownBump)
			{
				velocityY +=  this.JUMP;
				STANCE = "jumping";
			}
			if (Game.inputManager.isCmdPressed(InputManager.DOWN) && DownBump)
			{
				this.isCrouch = true;
			}
			else
			{
				this.isCrouch = false;
			}

			//determine stances
			if (isLatch)
			{//climbing
				STANCE = "climbing";
			}
			else if (isCrouch)
			{//crouching
				STANCE = "crouching";
			}
			else if ((velocityY > 1) && !isLatch && !DownBump)
			{
				STANCE = "falling";
			}
			else if(DownBump && velocityX > 1 || velocityY < -1){
				STANCE = "walking";
			}
			else if(velocityX == 0 && !isLatch && DownBump){
				STANCE = "idle";
			}

			//Max Speed
			//Scale down if too fast;
			if ((velocityX > this.MAXSPEED))
			{//moving right
				velocityX = this.MAXSPEED;
			}
			else if ((velocityX < this.MAXSPEED * -1))
			{//moving left
				velocityX = this.MAXSPEED * -1;
			}

			//stop if low speed
			if (Math.abs(velocityX) < 0.5)
			{
				velocityX = 0;
			}
			else if (Math.abs(velocityY) < 0.5)
			{
				velocityY = 0;
			}

			//Adding Friction
			velocityX *=  this.FRICTION;
			velocityY *=  this.AIRFRICTION;

			//React to Bumps
			if ((LeftBump && velocityX < 0))
			{
				velocityX *=  -0.5;
			}

			if ((RightBump && velocityX > 0))
			{
				velocityX *=  -0.5;
			}

			if ((UpBump && velocityY < 0))
			{
				velocityY *=  -0.5;
			}

			if ((DownBump && velocityY > -2))
			{
				velocityY *=  -0.5;
			}

			//firing Hook
			if (Game.inputManager.mouseClick && Game.gameContainer.hook.isReady)
			{
				LastPos = new Point(this.x,this.y);

				//make hook visible
				Game.gameContainer.hook.visible = true;
				Game.gameContainer.hook.x = LastPos.x;
				Game.gameContainer.hook.y = LastPos.y;

				Game.gameContainer.hook.fireHook(Game.inputManager.mousePos);
				Game.inputManager.mouseClick = false;
			}//end if

			//animation cycle
			//trace(STANCE);
			if ((STANCE == "falling"))
			{
				this.gotoAndStop(5);
			}
			else if ((STANCE == "walking"))
			{
				Game.sound.playSound(new Array(SoundManager.MIR_FOOT_RUN_01,SoundManager.MIR_FOOT_RUN_02,SoundManager.MIR_FOOT_RUN_03,SoundManager.MIR_FOOT_RUN_04),SoundManager.FOOTSTEPS);

				this.gotoAndStop(2);
			}
			else if ((STANCE == "crouching"))
			{
				this.gotoAndStop(3);
			}
			else if ((STANCE == "jumping"))
			{
				this.gotoAndStop(4);
			}
			else if ((STANCE == "climbing"))
			{
				this.gotoAndStop(6);
			}
			else if ((STANCE == "shooting"))
			{
				this.gotoAndStop(7);
			}
			else if ((STANCE == "idle"))
			{
				this.gotoAndStop(1);
			}
		}
	}
}