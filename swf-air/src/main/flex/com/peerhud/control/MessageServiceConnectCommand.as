/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 10:35 PM
 **/
package com.peerhud.control
{
	import com.peerhud.event.MessageServiceEvent;
	import com.peerhud.event.PTViewEvent;
	import com.peerhud.service.IMessageService;

	import org.robotlegs.mvcs.Command;

	public class MessageServiceConnectCommand extends Command
	{
		[Inject]
		public var event:MessageServiceEvent;

		[Inject]
		public var messageService:IMessageService;

		public function MessageServiceConnectCommand()
		{
		}

		override public function execute():void
		{
			messageService.connect();
		}
	}
}
