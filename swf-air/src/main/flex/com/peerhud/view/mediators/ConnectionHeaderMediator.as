/**
 * User: Xpoint
 * Date: 4/21/12
 * Time: 12:15 AM
 **/
package com.peerhud.view.mediators
{
	import com.peerhud.event.MessageServiceEvent;
	import com.peerhud.model.UserModel;
	import com.peerhud.view.components.ConnectionHeaderView;

	import flash.events.MouseEvent;

	import org.robotlegs.mvcs.Mediator;

	public class ConnectionHeaderMediator extends Mediator
	{
		[Inject]
		public var view:ConnectionHeaderView;

		[Inject]
		public var userModel:UserModel;

		public function ConnectionHeaderMediator()
		{
		}

		override public function onRegister():void
		{
			eventMap.mapListener(view.connectButton, MouseEvent.CLICK, onConnectClick);
			eventMap.mapListener(eventDispatcher, MessageServiceEvent.CONNECTED, onConnection);
		}

		private function onConnectClick(event:MouseEvent):void
		{
			userModel.username = view.usernameInput.text;

			dispatch(new MessageServiceEvent(MessageServiceEvent.CONNECT));
		}

		private function onConnection(event:MessageServiceEvent):void
		{
			view.timeGroup.visible = true;
		}
	}
}
