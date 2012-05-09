/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 2:36 AM
 **/
package com.peerhud.view.mediators
{
	import com.peerhud.event.PeerTimerEvent;
	import com.peerhud.view.components.ConsoleView;

	import org.robotlegs.mvcs.Mediator;

	public class ConsoleViewMediator extends Mediator
	{
		[Inject]
		public var view:ConsoleView;

		public function ConsoleViewMediator()
		{
		}

		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, PeerTimerEvent.START, onPeerTimerStart)
		}

		public function onPeerTimerStart(event:PeerTimerEvent):void
		{
			view.username = event.vo.username;
			view.printPeerTimerEvent(event);
		}
	}
}