/**
 * Created with IntelliJ IDEA.
 * User: Xpoint
 * Date: 4/19/12
 * Time: 6:55 PM
 * To change this template use File | Settings | File Templates.
 */
package com.peerhud.service
{
	import com.peerhud.event.MessageServiceEvent;
	import com.peerhud.event.PeerTimerEvent;
	import com.peerhud.model.UserModel;
	import com.peerhud.model.vo.PeerTimerEventVO;

	import flash.events.NetStatusEvent;
	import flash.net.GroupSpecifier;
	import flash.net.NetConnection;
	import flash.net.NetGroup;

	import mx.controls.Alert;

	import org.robotlegs.mvcs.Actor;

	public class P2PMessageService extends Actor implements IMessageService
    {
		[Inject]
		public var localUser:UserModel;

		private const SERVER:String = "rtmfp://p2p.rtmfp.net/12ff5162e5a44b13d295fa92-1e75ec2883f4/";
		private const DEVKEY:String = "12ff5162e5a44b13d295fa92-1e75ec2883f4";
		private const NETGROUP:String = "test";
		private var _nc:NetConnection;
		private var _netGroup:NetGroup;

		// NetGroup specifier for NETGROUP
		private var groupSpecWithAuthorizations:String;

		// Connected to Stratus server and to NETGROUP
		private var _connected:Boolean = false;

		// _userName name in chat.
		private var _userName:String;

		// Used to store our P2P Peer ID for binding to UI.
		private var _nearID:String;

        public function P2PMessageService()
        {

        }

		public function connect():void
		{
			_nc = new NetConnection();
			_nc.addEventListener(NetStatusEvent.NET_STATUS,ncNetStatus);
			_nc.connect(SERVER+DEVKEY);
		}

		private function ncNetStatus(event:NetStatusEvent):void
		{
//			console(ncNetStatus(...) - event.info.code:" + event.info.code);

			switch(event.info.code)
			{
				case "NetConnection.Connect.Success":
					_nearID = _nc.nearID;// or you can use event.target.nearID;
					setupGroup();
					break;
				case "NetGroup.Connect.Success":
						_connected = true;
						eventDispatcher.dispatchEvent(new MessageServiceEvent(MessageServiceEvent.CONNECTED));
						Alert.show("connected")
					break;
				case "NetGroup.Posting.Notify":
					receivePostNotifyMessage(event.info.message);
					break;
				// FYI: More NetGroup event info codes
				case "NetGroup.Neighbor.Connect":
				case "NetGroup.LocalCoverage.Notify":
				case "NetGroup.SendTo.Notify": // event.info.message, event.info.from, event.info.fromLocal
				case "NetGroup.MulticastStream.PublishNotify": // event.info.name
				case "NetGroup.MulticastStream.UnpublishNotify": // event.info.name
				case "NetGroup.Replication.Fetch.SendNotify": // event.info.index
				case "NetGroup.Replication.Fetch.Failed": // event.info.index
				case "NetGroup.Replication.Fetch.Result": // event.info.index, event.info.object
				case "NetGroup.Replication.Request": // event.info.index, event.info.requestID
				default:
				{
					break;
				}
			}
		}

		private function setupGroup():void
		{
			var groupspec:GroupSpecifier = new GroupSpecifier(NETGROUP);
			// Allow group members to open channels to server
			groupspec.serverChannelEnabled = true;
			// Allow group members to post
			groupspec.postingEnabled = true;

			// Create the group specific
			groupSpecWithAuthorizations = groupspec.groupspecWithAuthorizations();

			// Join the group specified by groupspec
			_netGroup = new NetGroup(_nc, groupSpecWithAuthorizations);

			// Register listener for NetGroup NetStatus events
			_netGroup.addEventListener(NetStatusEvent.NET_STATUS, ncNetStatus);
		}

		/**
		 * Post a message to NETGROUP;
		 * @param messageText String. Text message to send.
		 * */
		private function sendMessageToGroup(messageText:String):void
		{
//			console( className + ".sendMessageToGroup(...) - messageText:" + messageText);

		}
		/**
		 * Receive a NetGroup.Posting.Notify message from NETGROUP
		 * @param netGroupMessage Object. NetGroup post message object.
		 * */
		private function receivePostNotifyMessage(netGroupMessage:Object):void
		{
			if(netGroupMessage.body.objectiveName)
			{
				var vo:PeerTimerEventVO = new PeerTimerEventVO(
						netGroupMessage.body.objectiveName,
						netGroupMessage.body.objectiveSeconds,
						netGroupMessage.body.eventType,
						netGroupMessage.user)

				eventDispatcher.dispatchEvent(new PeerTimerEvent(PeerTimerEvent.START, vo))
			}

			eventDispatcher.dispatchEvent(new MessageServiceEvent(MessageServiceEvent.MESSAGE))

		}

        public function send(vo:Object):void
        {
			// Construct message object
			var netGroupMessage:Object = new Object();
			netGroupMessage.sender = _netGroup.convertPeerIDToGroupAddress(_nc.nearID);
			netGroupMessage.user = localUser.username;
			netGroupMessage.body = vo;
			netGroupMessage.sequence = vo.timestamp;// Only unique message objects are sent.
			// Send netGroupMessage object to all members of the NETGROUP
			_netGroup.post(netGroupMessage);
        }
    }
}
