package com.topmind.modules.lesson
{
import flash.events.Event;

public class LessonEvent extends Event
{
    
    //==========================================================================
    //  Class variables
    //==========================================================================
    static public const SHOW_GAME_OPTION:String = "showGameOption";
    static public const SELECTED_GAME:String = "selectedGame";
    
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessonEvent</code>实例.
     *
     */
    public function LessonEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
    {
        this.data = data;
        super(type, bubbles, cancelable);
    }
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public var data:Object = null;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function clone():Event{
        var result:LessonEvent = new LessonEvent(type, data, bubbles, cancelable);
        return result;
    }
}
}