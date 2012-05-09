/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 3:00 AM
 **/
package com.peerhud.event
{
	import flash.events.Event;

	public class PTViewEvent extends Event
	{
		public static const CLICK:String = "PTViewEvent_CLICK";

		public var objectiveName:String;
		public var objectiveSeconds:Number;

		public function PTViewEvent(type:String, objectiveName:String, objectiveSeconds:Number = NaN, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			this.objectiveName = objectiveName;
			this.objectiveSeconds = NaN

			super(type, bubbles, cancelable);
		}


		override public function clone():Event
		{
			return new PTViewEvent(type, objectiveName, objectiveSeconds);
		}
	}
}
