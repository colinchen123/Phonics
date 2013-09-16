package com.topmind.modules.tutorial.model
{
import org.robotlegs.mvcs.Actor;

public class TutorialPorxy extends Actor
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>TutorialPorxy</code>实例.
     *
     */
    public function TutorialPorxy()
    {
        super();
    }
    
//    public var words:Array = ["act",'ans', 'anc','aps','apt','acs'];
    public var words:Array = ["as",'ap', 'at','ca','na','pa'];
    public var letters:Array = ["s", "a", "t","c","p", "n"]
    public var count:int = 2;
}
}