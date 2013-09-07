package com.topmind.modules.shell.views
{
import flash.events.Event;

public class ShellEvent extends Event
{
    //==========================================================================
    //  Class variables
    //==========================================================================
    static public const SELECT_GAME:String = "selectGame";
    static public const EXIT_GAME:String = "exitGame";
    static public const OPEN_SET:String = "shellopenSet";
    static public const SELECTED_AVATAR:String = "selectedAvatar";
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShellViewEvent</code>实例.
     *
     */
    public function ShellEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
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
        var cloneEvent:ShellEvent = new ShellEvent(type, data, bubbles, cancelable);
        cloneEvent.data = data;
        return cloneEvent;
    }
}
}