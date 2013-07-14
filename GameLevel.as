﻿package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import flash.display.MovieClip;	

	public class GameLevel extends MovieClip
	{
		static const PAR_X = 600;
		static const PAR_Y = 600;
		static const SCROLL_X = 400;
		static const SCROLL_Y = 450;

		//Setting up variables
		var level:Number;

		var hero:Hero = new Hero();

		var guard:Guard = new Guard();
		var bullet:Bullet = new Bullet();

		var hook:GrappleHook = new GrappleHook();
		var levelMap:Layout = new Layout();
		var roughMap:RoughLayout = new RoughLayout();
		var collision:Collision = new Collision();
		var checkP:Checkpoint = new Checkpoint();


		//Map Position
		var scrollX:Number = SCROLL_X;
		var scrollY:Number = SCROLL_Y;

		var par1:Parallax1 = new Parallax1();
		var par1mul:Number = 0.01;
		var par1scrollX:Number = PAR_X;
		var par1scrollY:Number = PAR_Y;
		var par2:Parallax2 = new Parallax2();
		var par2mul:Number = 0.05;
		var par2scrollX:Number = PAR_X;
		var par2scrollY:Number = PAR_Y;
		var par3:Parallax3 = new Parallax3();
		var par3mul:Number = 0.2;
		var par3scrollX:Number = PAR_X;
		var par3scrollY:Number = PAR_Y;
		var par4:Parallax4 = new Parallax4();
		var par4mul:Number = 0.35;
		var par4scrollX:Number = PAR_X;
		var par4scrollY:Number = PAR_Y;
		var par5:Parallax5 = new Parallax5();
		var par5mul:Number = 0.42;
		var par5scrollX:Number = PAR_X;
		var par5scrollY:Number = PAR_Y;


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

			addChild(par1);
			addChild(par2);
			addChild(par3);
			addChild(par4);
			addChild(par5);

			//Spawning Map
			addChild(levelMap);
			roughMap.visible = false;
			addChild(roughMap);

			checkP.alpha = 0.05;
			addChild(checkP);

			//Spawning Hero
			hero.x = 400;
			hero.y = 500;
			addChild(hero);
			
			guard.x = 600;
			guard.y = 30;
			levelMap.addChild(guard);
			
			bullet.x = guard.x;
			bullet.y = guard.y;
			bullet.isFired = false;
			bullet.visible = true;
			levelMap.addChild(bullet);

			//Spawning hook
			hook.x = 0;
			hook.y = 0;
			hook.visible = false;
			addChild(hook); 

			addChild(collision);

		}//end Method

		//Loop Function
		function onTick(e:Event):void
		{	trace("guard pos: "+ guard.x, guard.y);
			trace("Reset bullet " + bullet.x,bullet.y );	
			//Moving the map
			this.move(hero.velocityX, hero.velocityY);
			resetPosition();
			
			if(!bullet.isFired){

				bullet.x =  guard.x;
				bullet.y =  guard.y;				
			}
		}

		//Loop Function
		function move(x:int, y:int):void
		{
			//Moving the map
			scrollX -=  x;
			scrollY -=  y;

			par1scrollX -=  x * par1mul;
			par1scrollY -=  y * par1mul;
			par2scrollX -=  x * par2mul;
			par2scrollY -=  y * par2mul;
			par3scrollX -=  x * par3mul;
			par3scrollY -=  y * par3mul;
			par4scrollX -=  x * par4mul;
			par4scrollY -=  y * par4mul;
			par5scrollX -=  x * par5mul;
			par5scrollY -=  y * par5mul;

			resetPosition();
		}

		//Loop Function
		function set(x:int, y:int):void
		{
			//Moving the map
			scrollX = x;
			scrollY = y;

			var relative_x:Number = scrollX - SCROLL_X;
			var relative_y:Number = scrollY - SCROLL_Y;

			par1scrollX = PAR_X + relative_x * par1mul;
			par1scrollY = PAR_Y + relative_y * par1mul;
			par2scrollX = PAR_X + relative_x * par2mul;
			par2scrollY = PAR_Y + relative_y * par2mul;
			par3scrollX = PAR_X + relative_x * par3mul;
			par3scrollY = PAR_Y + relative_y * par3mul;
			par4scrollX = PAR_X + relative_x * par4mul;
			par4scrollY = PAR_Y + relative_y * par4mul;
			par5scrollX = PAR_X + relative_x * par5mul;
			par5scrollY = PAR_Y + relative_y * par5mul;

			resetPosition();
		}

		private function resetPosition()
		{
			checkP.x = scrollX;
			checkP.y = scrollY;

			hook.x = hook.initialPos.x + levelMap.x;
			hook.y = hook.initialPos.y + levelMap.y;
			levelMap.x = scrollX;
			levelMap.y = scrollY;
			roughMap.x = scrollX;
			roughMap.y = scrollY;

			par1.x = par1scrollX;
			par1.y = par1scrollY;
			par2.x = par2scrollX;
			par2.y = par2scrollY;
			par3.x = par3scrollX;
			par3.y = par3scrollY;
			par4.x = par4scrollX;
			par4.y = par4scrollY;
			par5.x = par5scrollX;
			par5.y = par5scrollY;
		}
	}

}