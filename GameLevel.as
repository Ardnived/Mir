﻿package {	import flash.events.Event;	import flash.display.MovieClip;	import flash.geom.Point;	public class GameLevel extends MovieClip	{		static const PAR_X = 600;		static const PAR_Y = 600;				//Setting up variables		var level:Number;		var hero:Hero = new Hero();		var hook:GrappleHook = new GrappleHook();		var levelMap:Layout = new Layout();		var roughMap:RoughLayout = new RoughLayout();		var collision:Collision = new Collision();		var checkP:Checkpoint = new Checkpoint();						//Map Position		var scrollX:Number = 960;		var scrollY:Number = 600;				var par1:Parallax1 = new Parallax1();		var par1mul:Number = 0.8;		var par1scrollX:Number = PAR_X;		var par1scrollY:Number = PAR_Y;		var par2:Parallax2 = new Parallax2();		var par2mul:Number = 0.03;		var par2scrollX:Number = PAR_X;		var par2scrollY:Number = PAR_Y;		var par3:Parallax3 = new Parallax3();		var par3mul:Number = 0.01;		var par3scrollX:Number = PAR_X;		var par3scrollY:Number = PAR_Y;				public function GameLevel()		{			// constructor code			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		}//end method		public function onAddedToStage(event:Event)		{			//remove the intializer			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);			this.addEventListener(Event.ENTER_FRAME, onTick);			//Set Variables			level = 1;						addChild(par3);			addChild(par2);			//addChild(par1);						//Spawning Map			addChild(levelMap);			roughMap.alpha = 0.5;			addChild(roughMap);						checkP.alpha = 0.5;			addChild(checkP);						//Spawning Hero			hero.x = 400;			hero.y = 275;			addChild(hero);			//Spawning hook			hook.x = 0;			hook.y = 0;			hook.visible = false;			addChild(hook);			//TODO: add map coordinates						addChild(collision);					}//end Method		//Loop Function		function onTick(e:Event):void		{			//Moving the map			scrollX -= hero.velocityX;			scrollY -= hero.velocityY;			resetPosition();		}				//Loop Function		function move(x:int, y:int):void		{			//Moving the map			scrollX -= x;			scrollY -= y;						par1scrollX -= x * par1mul;			par1scrollY -= y * par1mul;			par2scrollX -= x * par2mul;			par2scrollY -= y * par2mul;			par3scrollX -= x * par3mul;			par3scrollY -= y * par3mul;						resetPosition();		}				//Loop Function		function set(x:int, y:int):void		{			//Moving the map			scrollX = x;			scrollY = y;						par1scrollX = x * par1mul;			par1scrollY = y * par1mul;			par2scrollX = x * par2mul;			par2scrollY = y * par2mul;			par3scrollX = x * par3mul;			par3scrollY = y * par3mul;						resetPosition();		}				private function resetPosition() {			checkP.x = scrollX;			checkP.y = scrollY;						hook.x = hook.initialPos.x + scrollX;			hook.y = hook.initialPos.y + scrollY;			levelMap.x = scrollX;			levelMap.y = scrollY;			roughMap.x = scrollX;			roughMap.y = scrollY;						par1.x = par1scrollX;			par1.y = par1scrollY;			par2.x = par2scrollX;			par2.y = par2scrollY;			par3.x = par3scrollX;			par3.y = par3scrollY;		}	}}