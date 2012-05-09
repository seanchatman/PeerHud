/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 6:56 PM
 **/
package com.peerhud.event
{
	import flash.events.Event;

	public class MessageServiceEvent extends Event
	{
		public static const CONNECT:String = "MessageServiceEvent_CONNECT";
		public static const CONNECTED:String = "MessageServiceEvent_CONNECTED";
		public static const MESSAGE:String = "MessageServiceEvent_MESSAGE";

		public function MessageServiceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
