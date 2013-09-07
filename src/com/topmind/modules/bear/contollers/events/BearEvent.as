package com.topmind.modules.bear.contollers.events
{
import flash.events.Event;

public class BearEvent extends Event
{
    //==========================================================================
    //  Class variables
    //==========================================================================
    static public const RIGHT:String = "right";
    static public const WRONG:String = "wrong";
    static public const DO_RUN:String = "doRun";
    static public const REPLAY:String = "replay";
    static public const SHOW_RESULT:String = "showResult";
    
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearEvent</code>实例.
     *
     */
    public function BearEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
    {
        super(type, bubbles, cancelable);
    }
}
}