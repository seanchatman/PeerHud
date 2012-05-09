/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 2:18 AM
 **/
package com.peerhud.view.mediators
{
	import com.peerhud.event.PTViewEvent;
	import com.peerhud.event.PeerTimerEvent;
	import com.peerhud.service.IMessageService;

	import org.robotlegs.mvcs.Mediator;

	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:main;

		public function ApplicationMediator()
		{
		}

		override public function onRegister():void
		{
		}
	}
}
