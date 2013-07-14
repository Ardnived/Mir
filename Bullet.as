package  {
	import flash.events.Event;
	
	public class Bullet extends Entity {
		public function Bullet(){
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}

		public override function onAddedToStage(event:Event)
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			//onTick
			this.addEventListener(Event.ENTER_FRAME, onTick);
		}
		
		public override function onTick(event:Event) {
			this.x += this.x - Game.gameContainer.hero.x / 10;
			
			if ( this.hitTestObject(Game.gameContainer) ) {
				if ( this.hitTestObject(Game.gameContainer.hero) ) {
					Game.gameContainer.hero.die();
				}
				this.die();
			}
		}
	}
	
}
