/**

 * User: Xpoint
 * Date: 4/4/12
 * Time: 10:43 PM

 */
package com.peerhud.utils
{
	import com.peerhud.model.vo.PeerTimerEventVO;

	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class PeerTimer extends EventDispatcher
	{
		public static const FORWARDS:String = "FORWARDS";
		public static const BACKWARDS:String = "BACKWARDS";

		private var timer:Timer;
		private var _direction:String;
		private var _elapsedSeconds:int;
		private var _totalSeconds:int;
		private var _startUTC:Number;

		public function PeerTimer(totalSeconds:int, direction:String = "BACKWARDS")
		{
			_totalSeconds = totalSeconds;
			_direction = direction;
			_startUTC = new Date().getTime();

			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onSecond, false, 0, true);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onSecond, false, 0, true);
		}

		public function start():void
		{
			_elapsedSeconds = 0;

			timer.reset();
			timer.start();
		}

		public function get remainingTime():int
		{
			return totalSeconds - _elapsedSeconds;
		}

		public function get elapsedSeconds():int
		{
			return _elapsedSeconds;
		}

		public function set elapsedSeconds(value:int):void
		{
			_elapsedSeconds = value;
		}

		private function onSecond(event:TimerEvent):void
		{
			_elapsedSeconds++;

			dispatchEvent(event.clone());
		}

		private function onComplete(event:TimerEvent):void
		{
			dispatchEvent(event.clone());
		}

		public function get totalSeconds():int
		{
			return _totalSeconds;
		}

		public function get direction():String
		{
			return _direction;
		}

		public function get startUTC():Number
		{
			return _startUTC;
		}

		public function set startUTC(value:Number):void
		{
			_startUTC = value;
		}

        public function toTimeDisplayString():String
        {
			var seconds:int;

			if(_direction == FORWARDS)
				return formatTime(elapsedSeconds);
			else
				return formatTime(remainingTime);
        }

		public static function formatTime(seconds:int):String
		{
			var minutes:int;
			minutes = seconds / 60;
			seconds %= 60;

			return minutes.toString() + ":" + ( seconds < 10 ? "0" + seconds.toString() : seconds.toString());
		}
    }
}