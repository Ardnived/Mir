﻿package {	import flash.events.Event;	import flash.events.KeyboardEvent;	import flash.geom.Point;	public class Hero extends Entity	{		var isLatch:Boolean = false;		var isCrouch:Boolean = false;		var isCollidingBelow:Boolean = false;		//Collsion Detections		var RightBump:Boolean;		var LeftBump:Boolean;		var UpBump:Boolean;		var DownBump:Boolean;				var RightBumpPoint:Point;		var LeftBumpPoint:Point;		var UpBumpPoint:Point;		var DownBumpPoint:Point; 				public override function onAddedToStage(event:Event)		{			super.onAddedToStage(event);			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);						RightBumpPoint = new Point(this.width/2,0);			LeftBumpPoint = new Point(-this.width/2,0);			UpBumpPoint = new Point(0,-this.height/2);			DownBumpPoint = new Point(0,this.height/2);		}				public override function onTick(event:Event)		{			trace(velocityX + " : " + velocityY);						if (Game.inputManager.isPressed[InputManager.LEFT])			{				this.velocityX -=  SPEED;			}			if (Game.inputManager.isPressed[InputManager.RIGHT])			{				this.velocityX +=  SPEED;			}									//React to Bumps			if (LeftBump)			{				if ((velocityX < 0))				{					velocityX *=  -0.5;				}			}			if (RightBump)			{				if ((velocityX > 0))				{					velocityX *=  -0.5;				}			}			if (UpBump)			{					if ((velocityY < 0))				{					velocityY *=  -0.5;				}			}						if (DownBump)			{				if ((velocityY > -2))				{					velocityY *=  -0.5;				}			}						if(!DownBump)			{				//gravity				velocityY += this.GRAVITY;			}						//Moving			if ((Game.inputManager.isPressed[InputManager.LEFT] && ! LeftBump))			{				velocityX -=  this.SPEED;				this.scaleX = -1;			}			if ((Game.inputManager.isPressed[InputManager.RIGHT] && ! RightBump))			{				velocityX +=  this.SPEED;				this.scaleX = 1;			}						//Max Speed			//Scale down if too fast;			if ((velocityX > this.MAXSPEED))			{//moving right				velocityX = this.MAXSPEED;			}			else if ((velocityX < (this.MAXSPEED * -1)))			{//moving left				velocityX = (this.MAXSPEED * -1);			}						//stop if low speed			if (Math.abs(velocityX) < 0.5)			{				velocityX = 0;			}						//Adding Friction			velocityX *=  this.FRICTION;			velocityY *=  this.AIRFRICTION;		}		public function keyDownHandler(event:KeyboardEvent)		{			if (Game.inputManager.justPressed[InputManager.DOWN])			{				this.isCrouch = true;			}		}		public function keyUpHandler(event:KeyboardEvent)		{			if (Game.inputManager.justPressed[InputManager.DOWN])			{				this.isCrouch = false;			}			if (Game.inputManager.justPressed[InputManager.JUMP])			{				this.velocityY - JUMP;			}		}	}}