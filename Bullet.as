package 
{
	import flash.events.Event;

	public class Bullet extends Entity
	{
		var dir:int = 0;
		var hook:GrappleHook = new GrappleHook();
		public function Bullet(d:int)
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			dir = d;
		}

		public override function onAddedToStage(event:Event)
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			//onTick
			this.addEventListener(Event.ENTER_FRAME, onTick);

			addChild(hook);
		}

		public override function onTick(event:Event)
		{
			hook.x = this.x;
			hook.y = this.y;

			if (this.x >= stage.width || this.x <= 0)
			{
				this.die();
			}
			if (this.y >= stage.height || this.y <= 0)
			{
				this.die();
			}
			if (dir == 0)
			{
				this.x -=  10;
			}
			else
			{
				this.x +=  10;
			}
			//this.x - Game.gameContainer.hero.x / 10;

			if (this.hitTestObject(Game.gameContainer.hero))
			{
				Game.gameContainer.hero.die();
				this.die();
			}
		}
	}

}