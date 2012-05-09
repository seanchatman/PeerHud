/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 12:08 AM
 **/
package com.peerhud.model.vo
{
	public class PeerTimerEventVO extends BaseVO
	{
		public var objectiveName:String;
		public var objectiveSeconds:Number;
		public var eventType:String;
		public var username:String;

		public function PeerTimerEventVO(objectiveName:String = "", objectiveSeconds:Number = NaN, eventType:String = "", username = "")
		{
			this.objectiveName = objectiveName;
			this.objectiveSeconds = objectiveSeconds;
			this.eventType = eventType;
			this.username = username;
		}
	}
}
