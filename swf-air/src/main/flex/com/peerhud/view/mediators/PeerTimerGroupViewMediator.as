/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 4:47 AM
 **/
package com.peerhud.view.mediators
{
	import com.peerhud.event.PTViewEvent;
	import com.peerhud.event.PeerTimerEvent;
	import com.peerhud.view.components.PeerTimerGroupView;
	import com.peerhud.view.components.PeerTimerView;

	import org.robotlegs.mvcs.Mediator;

	public class PeerTimerGroupViewMediator extends Mediator
	{
		[Inject]
		public var view:PeerTimerGroupView;

		public function PeerTimerGroupViewMediator()
		{
		}

		override public function onRegister():void
		{
			eventMap.mapListener(view, PTViewEvent.CLICK, dispatch);
			eventMap.mapListener(eventDispatcher, PeerTimerEvent.START, onPeerTimerStart);
		}

		public function onPeerTimerStart(event:PeerTimerEvent):void
		{
			if(event.vo.objectiveName != "" && (event.vo.eventType == PeerTimerEvent.START || event.vo.eventType == PTViewEvent.CLICK))
				PeerTimerView(view[event.vo.objectiveName]).start();
		}
	}
}
