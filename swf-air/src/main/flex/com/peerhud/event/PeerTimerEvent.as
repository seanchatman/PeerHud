/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 2:22 AM
 **/
package com.peerhud.event
{
	import com.peerhud.model.vo.PeerTimerEventVO;

	import flash.events.Event;

	public class PeerTimerEvent extends Event
	{
		public static const START:String = 'PeerTimerEvent_START';
		public static const STOP:String = 'PeerTimerEvent_STOP';

		public var vo:PeerTimerEventVO;

		public function PeerTimerEvent(type:String, peerTimerEventVO:PeerTimerEventVO = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			if(!peerTimerEventVO)
				this.vo = new PeerTimerEventVO();
			else
				this.vo = peerTimerEventVO;

			super(type, bubbles, cancelable);
		}
	}
}
