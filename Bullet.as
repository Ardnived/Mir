package  {
	import flash.events.Event;
	
	public class Bullet extends Entity {
		
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
