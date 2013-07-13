﻿package {	import flash.events.Event;	import flash.events.KeyboardEvent;	import flash.geom.Point;	public class Hero extends Entity	{		var isLatch:Boolean = false;		var isCrouch:Boolean = false;		var isCollidingBelow:Boolean = false;		//Collsion Detections		var RightBump:Boolean;		var LeftBump:Boolean;		var UpBump:Boolean;		var DownBump:Boolean;				var RightBumpPoint:Point;		var LeftBumpPoint:Point;		var UpBumpPoint:Point;		var DownBumpPoint:Point; 				public override function onAddedToStage(event:Event)		{			super.onAddedToStage(event);						RightBumpPoint = new Point(this.width/2, 0);			LeftBumpPoint = new Point(-this.width/2, 0);			UpBumpPoint = new Point(0, -this.height/2);			DownBumpPoint = new Point(0, this.height/2);		}				public override function onTick(event:Event)		{			//trace(velocityX + " : " + velocityY);						if (!DownBump && !isLatch)			{				velocityY += this.GRAVITY;			}						//Moving			if (Game.inputManager.isCmdPressed(InputManager.LEFT))			{				if (LeftBump) {					if (!isCrouch) {						trace("LATCH LEFT");						this.isLatch = true;					}				} else {					this.isLatch = false;					velocityX -= this.SPEED;					this.scaleX = -1;				}			}			if (Game.inputManager.isCmdPressed(InputManager.RIGHT))			{				if (RightBump) {					if (!isCrouch) {						trace("LATCH RIGHT");						this.isLatch = true;					}				} else {					this.isLatch = false;					velocityX += this.SPEED;					this.scaleX = 1;				}			}			if (isLatch && (LeftBump || RightBump))			{				if (Game.inputManager.isCmdPressed(InputManager.UP)) {					Game.gameContainer.move(0, -this.SPEED / 2);				} else if (Game.inputManager.isCmdPressed(InputManager.DOWN)) {					Game.gameContainer.move(0, this.SPEED / 2);				}			}						if (Game.inputManager.justCmdPressed(InputManager.JUMP) && ! UpBump && DownBump)			{				velocityY += this.JUMP;			}			if (Game.inputManager.justCmdPressed(InputManager.DOWN) && DownBump)			{				this.isCrouch = true;			}						//Max Speed			//Scale down if too fast;			if (velocityX > this.MAXSPEED)			{ //moving right				velocityX = this.MAXSPEED;			}			else if (velocityX < (this.MAXSPEED * -1))			{ //moving left				velocityX = (this.MAXSPEED * -1);			}						//stop if low speed			if (Math.abs(velocityX) < 0.5)			{				velocityX = 0;			}			else if (Math.abs(velocityY) < 0.5)			{				velocityY = 0;			}						//Adding Friction			velocityX *= this.FRICTION;			velocityY *= this.AIRFRICTION;						//React to Bumps			if (LeftBump && velocityX < 0)			{				velocityX *=  -0.5;			}			if (RightBump && velocityX > 0)			{				velocityX *=  -0.5;			}			if (UpBump && velocityY < 0)			{				velocityY *=  -0.5;			}						if (DownBump && velocityY > -2)			{				velocityY *=  -0.5;			}		}	}}