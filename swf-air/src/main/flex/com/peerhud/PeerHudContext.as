/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 2:09 AM
 **/
package com.peerhud
{
	import com.peerhud.control.MessageServiceConnectCommand;
	import com.peerhud.control.PTViewClickCommand;
	import com.peerhud.event.MessageServiceEvent;
	import com.peerhud.event.PTViewEvent;
	import com.peerhud.model.UserModel;
	import com.peerhud.service.IMessageService;
	import com.peerhud.service.MockMessageService;
	import com.peerhud.service.P2PMessageService;
	import com.peerhud.view.components.ConnectionHeaderView;
	import com.peerhud.view.components.ConsoleView;
	import com.peerhud.view.components.PeerTimerGroupView;
	import com.peerhud.view.mediators.ApplicationMediator;
	import com.peerhud.view.mediators.ConnectionHeaderMediator;
	import com.peerhud.view.mediators.ConsoleViewMediator;
	import com.peerhud.view.mediators.PeerTimerGroupViewMediator;

	import flash.display.DisplayObjectContainer;

	import org.robotlegs.mvcs.Context;

	public class PeerHudContext extends Context
	{
		public function PeerHudContext(contextView:DisplayObjectContainer = null,autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}

		override public function startup():void
		{
			mediatorMap.mapView(main, ApplicationMediator);
			mediatorMap.mapView(ConsoleView, ConsoleViewMediator);
			mediatorMap.mapView(PeerTimerGroupView, PeerTimerGroupViewMediator);
			mediatorMap.mapView(ConnectionHeaderView, ConnectionHeaderMediator);

			commandMap.mapEvent(PTViewEvent.CLICK, PTViewClickCommand);
			commandMap.mapEvent(MessageServiceEvent.CONNECT, MessageServiceConnectCommand);

//			injector.mapSingletonOf(IMessageService, MockMessageService);
			injector.mapSingletonOf(IMessageService, P2PMessageService);

			injector.mapSingleton(UserModel);
		}
	}
}
