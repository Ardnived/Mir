﻿package 
{
	//Importing Stuffs
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import fl.motion.MotionEvent;
	import flash.geom.Point;

	public class Game extends MovieClip
	{
		//Input Manager
		static var inputManager:InputManager = new InputManager();
		
		//GameLevel
		static var gameContainer:GameLevel = new GameLevel();
		
		//SoundManager
		static var sound:SoundManager = new SoundManager();
		
		public function Game()
		{
			// constructor code
			//Event Listeners
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
			stage.addEventListener(MouseEvent.CLICK,onMouseClick);
			
			addChild(gameContainer);
		}//end method	
		
		function startMusic(){
			sound.playBackground();
		}
/*
		//Keyboard Handler Functions
		function keyDownHandler(e:KeyboardEvent):void
		{
			if (e.keyCode == 65 || e.keyCode == 37)
			{
				gameContainer.isLeft = true;
			}
			if (e.keyCode == 68 || e.keyCode == 39)
			{
				gameContainer.isRight = true;
			}
			if (e.keyCode == 87 || e.keyCode == 38)
			{
				gameContainer.isUp = true;
			}
			if (e.keyCode == 83 || e.keyCode == 40)
			{
				gameContainer.isDown = true;
			}
			if (e.keyCode == 32)
			{
				gameContainer.isJump = true;
			}
		}

		function keyUpHandler(e:KeyboardEvent):void
		{
			if (e.keyCode == 65 || e.keyCode == 37)
			{
				gameContainer.isLeft = false;
			}
			if (e.keyCode == 68 || e.keyCode == 39)
			{
				gameContainer.isRight = false;
			}
			if (e.keyCode == 87 || e.keyCode == 38)
			{
				gameContainer.isUp = false;
			}
			if (e.keyCode == 83 || e.keyCode == 40)
			{
				gameContainer.isDown = false;
			}
			if (e.keyCode == 32)
			{
				gameContainer.isJump = false;
			}
		}*/
		
		function onMouseClick(e:MouseEvent){
			inputManager.setMouse(new Point(mouseX ,mouseY));
		}
		
		//Keyboard Handler Functions
		//Detect if certain key is being press
		function keyDownHandler(e:KeyboardEvent):void
		{

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
			//K key to kill her
			if(e.keyCode == 75)
			{
				inputManager.set(InputManager.INSTANTDEATH,true);
			}
		}

		//Detect if certain key is being release
		function keyUpHandler(e:KeyboardEvent):void
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
			//K key to kill her
			if(e.keyCode == 75)
			{
				inputManager.set(InputManager.INSTANTDEATH,false);
			}
		}//end function
		
		
	}


}