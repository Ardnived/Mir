﻿package  {		public class Guard extends Entity {		var alertTimer:int;				public override function onTick(event:Event) {			super.onTick(event);			this.alertTimer--;		}				public function isAlert() {			return alertTimer > 0;		}	}	}