package com.topmind.modules.pig
{
import flash.events.Event;

public class PigEvent extends Event
{
    //==========================================================================
    //  Class variables
    //==========================================================================
    static public const FINISH:String = "finish";
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigEvent</code>实例.
     *
     */
    public function PigEvent(type:String,data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
    {
        this.data = data;
        super(type, bubbles, cancelable);
    }
    
    public var data:Object;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function clone():Event{
        var result:PigEvent = new PigEvent(type, data, bubbles, cancelable);
        return result;
    }
}
}