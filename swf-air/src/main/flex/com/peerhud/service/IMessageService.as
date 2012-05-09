/**
 * Created with IntelliJ IDEA.
 * User: Xpoint
 * Date: 4/19/12
 * Time: 7:01 PM
 * To change this template use File | Settings | File Templates.
 */
package com.peerhud.service
{
    public interface IMessageService
    {
		function connect():void;
        function send(vo:Object):void;
    }
}
