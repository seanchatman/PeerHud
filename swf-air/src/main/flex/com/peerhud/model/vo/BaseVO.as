/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 7:27 PM
 **/
package com.peerhud.model.vo
{
	public class BaseVO
	{
		private var _timestamp:Number;

		public function BaseVO(setTimeStamp:Boolean = true)
		{
			if(setTimeStamp)
				_timestamp = new Date().getUTCDate()
		}

		public function get timestamp():Number
		{
			return _timestamp;
		}

		public function set timestamp(value:Number):void
		{
			_timestamp = value;
		}
	}
}
