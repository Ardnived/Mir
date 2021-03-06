﻿
﻿package 
{
	import flash.events.Event;
	import flash.geom.Point;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
	
	public class GrapplePoint extends GrappleItem
	{
		var ourMousePoint:Point;
		var duration:Number = 2;		
		//controls the movement
		var myMovement:Tween;
		
		public function GrapplePoint()
		{
			// constructor code
			this.visible = false;
			this.addEventListener(Event.ENTER_FRAME,onTick);
		}

		function onTick(event:Event)
		{	
			//trace("Regular level : "+Game.gameContainer.levelMap.x, Game.gameContainer.levelMap.y );
			
			if (this.hitTestObject(Game.gameContainer.hook) && !Game.gameContainer.hook.isHit)
			{
				if (this.hitTestPoint(Game.inputManager.mousePos.x,Game.inputManager.mousePos.y)){
					
					// trace("BEFORE ->From: "+Game.gameContainer.levelMap.x, Game.gameContainer.levelMap.y );
					Game.sound.playSound(new Array(SoundManager.MIR_GRAP_HIT_01, SoundManager.MIR_GRAP_HIT_02, SoundManager.MIR_GRAP_HIT_03), SoundManager.EFFECT);
					
					ourMousePoint = Game.inputManager.mousePos;
					//trace("MOUSEPOS: " + ourMousePoint);
					Game.gameContainer.move(ourMousePoint.x - Game.gameContainer.hero.x,
									   ourMousePoint.y - Game.gameContainer.hero.y);
									   
					  // trace("AFTER -> From: "+Game.gameContainer.levelMap.x, Game.gameContainer.levelMap.y + " To: "+ (ourMousePoint.x - Game.gameContainer.hero.x) +" : "+ (ourMousePoint.y - Game.gameContainer.hero.y));
					
					//myMovement = new Tween(Game.gameContainer.levelMap,"x",None.easeIn, Game.gameContainer.levelMap.x, (ourMousePoint.x - Game.gameContainer.hero.x), duration,true);
					//myMovement = new Tween(Game.gameContainer.levelMap,"y",None.easeIn, Game.gameContainer.levelMap.y, (ourMousePoint.y - Game.gameContainer.hero.y), duration,true);
				
					myMovement.addEventListener(TweenEvent.MOTION_FINISH, onMotionFinished);
					Game.gameContainer.hook.isHit = false;
					
				}//end if
				
				
			}//end if
		}//end method
		
		function onMotionFinished($evt:TweenEvent):void{
			trace("movement finished");
			Game.gameContainer.set((ourMousePoint.x - Game.gameContainer.hero.x), (ourMousePoint.y - Game.gameContainer.hero.y));
		}//end method

	}

}
