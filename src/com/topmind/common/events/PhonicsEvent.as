package com.topmind.common.events
{
import flash.events.Event;

import org.robotlegs.utilities.modular.base.IModuleEvent;

public class PhonicsEvent extends Event implements IModuleEvent
{
    //==========================================================================
    //  Class variables
    //==========================================================================
    static public const OPEN_SETTING:String = "openSetting";
    static public const EXIT_SETTING:String = "exitSetting";
    static public const REPLAY:String = "replay";
    static public const RESUME:String = "resume";
    
    static public const LOCAL_SET:String = "openSet";
    
    static public const REQUEST_EXIT:String = "requestExit";
    
    static public const SELECT_MAP:String = "selectMap";
    
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PhonicsEvent</code>实例.
     *
     */
    public function PhonicsEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
    {
        this.data = data;
        super(type, bubbles, cancelable);
    }
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public var data:Object;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function clone():Event{
        var result:PhonicsEvent = new PhonicsEvent(type, data, bubbles, cancelable);
        return result;
    }
}
}