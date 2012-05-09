/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 5:01 AM
 **/
package com.peerhud.service
{
	import com.peerhud.event.MessageServiceEvent;
	import com.peerhud.event.PTViewEvent;
	import com.peerhud.event.PeerTimerEvent;
	import com.peerhud.model.vo.PeerTimerEventVO;

	import mx.controls.Alert;

	import org.robotlegs.mvcs.Actor;

	public class MockMessageService extends Actor implements IMessageService
	{
		public function MockMessageService()
		{
		}

		public function connect():void
		{
			Alert.show("connected");
			eventDispatcher.dispatchEvent(new MessageServiceEvent(MessageServiceEvent.CONNECTED));
		}

		public function send(vo:Object):void
		{
//			eventDispatcher.dispatchEvent(new MessageServiceEvent(MessageServiceEvent.MESSAGE))
		}
	}
}
