package 
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.geom.Point;

	public class Guard extends Entity
	{
		//alert timer
		var alertTimer:Timer;

		//other variables
		var patrolPoints:Array;
		var attackRange:Number = 10;
		var isPartol:Boolean = true;
		var isAlert:Boolean = false;
		var destinationX:Number = 0;
		var destinationY:Number = 0;
		var curPoint:Number = 0;
		var dist:Number = 0;
		var isStun:Boolean = false;

		public function Guard():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
		}

		public override function onAddedToStage(event:Event)
		{
			this.removeEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
			patrolPoints = [];
			curPoint = 0;

			//duration for alert
			alertTimer = new Timer(5000);
			alertTimer.addEventListener("timer",lostSight);
			
			patrolPoints.push(new Point(this.x, this.y));
			patrolPoints.push(new Point(this.x + 600, this.y));

			// set first destination;
			getNextDestination();
			
			//onTick
			this.addEventListener(Event.ENTER_FRAME, onTick);
		}

		public function pushPartolPoints(startX:Number,startY:Number,endX:Number,endY:Number)
		{
			//Function to add partol points
			patrolPoints.push(new Point(startX,startY));
			patrolPoints.push(new Point(endX,endY));
		}

		private function getNextDestination():void
		{
			destinationX = patrolPoints[curPoint].x;
			destinationY = patrolPoints[curPoint].y;

			curPoint++;

			if ((curPoint == patrolPoints.length))
			{
				curPoint = 0;
			}
		}

		public override function onTick(event:Event)
		{
			//super.onTick(event);

			detectPlayer();

			//check for player
			if (isAlert)
			{
				//chasePlayer();
				shootPlayer();
			}
			else
			{
				updatePosition();
			}
		}

		private function chasePlayer()
		{
			if (isAlert)
			{
				//chase
			}
		}

		private function shootPlayer()
		{
			if (isAlert && canShoot)
			{
				//shoot
				var shock = new Bullet();
				shock.x = this.x;
				shock.y = this.y;
				stage.addChild(shock);
				canShoot = false;
				shootTimer.start();
			}
		}

		private function detectPlayer()
		{
			if (this.cone.hitTestObject(Game.gameContainer.hero))
			{
				//set alert
				isAlert = true;
				canShoot = true;
				this.alert.play();
			}
			else
			{
				if ((isAlert == true))
				{
					alertTimer.start();
				}
				else
				{
					isAlert = false;
				}
			}
		}

		private function lostSight(event:TimerEvent)
		{
			isAlert = false;
		}

		private function updatePosition():void
		{
			// if close to target
			if ((dist < 5))
			{
				getNextDestination();
			}

			// get distance
			dist = getDistance(destinationX - this.x,destinationY - this.y);

			// update velocity
			velocityX = (destinationX - this.x) / dist * 3;
			velocityY = (destinationY - this.y) / dist * 3;
			
			if(this.x - destinationX < 0){
				this.gotoAndStop(2);
			}else{
				this.gotoAndStop(1);
			}
			
			// update position
			this.x +=  velocityX;
			this.y +=  velocityY;
		}

		public function getDistance(delta_x:Number,delta_y:Number):Number
		{
			return Math.sqrt(((delta_x * delta_x) + (delta_y * delta_y)));
		}

	}
}