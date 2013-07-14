package  {
	
	public class GrapplePoint extends GrappleItem{

		public function GrapplePoint() {
			// constructor code
			this.addEventListener(Event.ENTER_FRAME, onTick);
		}
		
		function onTick(event:Event){
			if(this.hitTestObject(Game.gameContainer.hook)){
				Game.gameContainer.set(this.x,this.y);
			}
		}

	}
	
}
