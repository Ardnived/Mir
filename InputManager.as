﻿package {	import flash.display.MovieClip;	import flash.events.Event;	import flash.geom.Point;	public class InputManager extends MovieClip {		static const RIGHT:int = 0;		static const LEFT:int = 1;		static const DOWN:int = 2;		static const UP:int = 3;		static const JUMP:int = 4;		static const INTERACT:int = 5;		static const PAUSE:int = 6;				var mousePos:Point = new Point();		var mouseClick:Boolean = new Boolean();		var isPressed = new Array();		var justPressed = new Array();		public function InputManager()		{			this.addEventListener(Event.ENTER_FRAME, onTick);		}//end method		public function onTick(event:Event)		{			var i:int;			for (i = 0; i < justPressed.length; i++) {				this.justPressed[i]--;			}					}				public function set(command:int, val:Boolean) {			this.isPressed[command] = val;			this.justPressed[command] = 2;		}				public function isCmdPressed(command:int) {			return this.isPressed[command];		}				public function justCmdPressed(command:int) {			return this.justPressed[command] > 0;		}				public function setMouse(mousePosTemp:Point){			mouseClick = true;			mousePos = mousePosTemp;		}	}}