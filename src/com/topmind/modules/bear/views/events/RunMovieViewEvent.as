package com.topmind.modules.bear.views.events
{
import flash.events.Event;

public class RunMovieViewEvent extends Event
{
    //==========================================================================
    //  Class variables
    //==========================================================================
    static public const END_MOVIE:String = "endMovie";
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RunMovieViewEvent</code>实例.
     *
     */
    public function RunMovieViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
    {
        super(type, bubbles, cancelable);
    }
    
    override public function clone():Event{
        return new RunMovieViewEvent(type, bubbles, cancelable);
    }
}
}