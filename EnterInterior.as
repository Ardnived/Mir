﻿package  {	import flash.events.Event;	import flash.display.MovieClip;		public class EnterInterior extends MovieClip {		public function EnterInterior() {			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);		}		public function onAddedToStage(event:Event)		{			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);			this.addEventListener(Event.ENTER_FRAME,onTick);						Game.gameContainer.fore_interior.visible = false;			Game.gameContainer.back_interior.visible = false;			Game.gameContainer.fore_exterior.visible = true;			Game.gameContainer.back_exterior.visible = true;		}				public function onTick(event:Event)		{			Game.gameContainer.fore_interior.visible = true;			Game.gameContainer.back_interior.visible = true;			Game.gameContainer.fore_exterior.visible = false;			Game.gameContainer.back_exterior.visible = false;		}	}	}