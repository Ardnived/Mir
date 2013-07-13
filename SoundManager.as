package 
{
	import flash.media.SoundChannel;
	import flash.events.Event;

	public class SoundManager
	{
		//initialing sound channel
		var SndChannel:SoundChannel;

		//list of sounds
		var bgSound:bgSnd = new bgSnd();

		/* Example instantiated
		var GUARD_ALERT:Sound = new Sound(new URLRequest("guard_alert.mp3")); 
		
		And then when you want to player the sound you call this,
		SoundManager.GUARD_ALERT.play();
		*/
		function playBackground()
		{
			SndChannel = bgSound.play();
			SndChannel.addEventListener(Event.SOUND_COMPLETE,loopBackground);
		}

		function loopBackground(e:Event)
		{
			playBackground();
		}
	}

}