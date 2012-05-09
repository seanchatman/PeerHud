/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 3:00 AM
 **/
package com.peerhud.control
{
	import com.peerhud.event.PTViewEvent;
	import com.peerhud.event.PeerTimerEvent;
	import com.peerhud.model.vo.PeerTimerEventVO;
	import com.peerhud.service.IMessageService;

	import org.robotlegs.mvcs.Command;

	public class PTViewClickCommand extends Command
	{
		[Inject]
		public var event:PTViewEvent;

		[Inject]
		public var messageService:IMessageService;

		public function PTViewClickCommand()
		{
		}

		override public function execute():void
		{
			var vo:PeerTimerEventVO = new PeerTimerEventVO(event.objectiveName, event.objectiveSeconds, event.type);

			messageService.send(vo);
			eventDispatcher.dispatchEvent(new PeerTimerEvent(PeerTimerEvent.START, vo));
		}
	}
}
