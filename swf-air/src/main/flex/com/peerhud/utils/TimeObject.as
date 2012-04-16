/**
 * Created with IntelliJ IDEA.
 * User: Xpoint
 * Date: 4/4/12
 * Time: 10:43 PM
 * To change this template use File | Settings | File Templates.
 */
package com.peerhud.utils
{
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class TimeObject extends EventDispatcher
	{
		private var timer:Timer;
		private var _timeType:String;
		private var _totalSeconds:int;

		public function TimeObject(totalSeconds:int, timeType:String = "")
		{
			_totalSeconds = totalSeconds;
			_timeType = timeType;

			timer = new Timer(1000, totalSeconds);
			timer.addEventListener(TimerEvent.TIMER, onSecond, false, 0, true);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onSecond, false, 0, true);
		}

		public function start():void
		{
			timer.reset();
			timer.start();
		}

		public function get remainingTime():int
		{
			return totalSeconds - timer.currentCount;
		}

		public function get elapsedTime():int
		{
			return timer.currentCount;
		}

		private function onSecond(event:TimerEvent):void
		{
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

		public function get timeType():String
		{
			return _timeType;
		}

        public function toRemainingString():String
        {
            var min:int;
            var secs:int = remainingTime;

            min = secs / 60;
            secs %= 60;

            return min.toString() + ":" + ( secs < 10 ? "0" + secs.toString() : secs.toString());
        }
    }
}