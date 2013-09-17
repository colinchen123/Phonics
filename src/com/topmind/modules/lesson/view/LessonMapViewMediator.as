package com.topmind.modules.lesson.view
{
import com.topmind.modules.lesson.LessonEvent;

import org.robotlegs.mvcs.Mediator;

public class LessonMapViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessonMapViewMediator</code>实例.
     *
     */
    public function LessonMapViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:LessonMapView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        dispatchClone(LessonEvent.SHOW_GAME_OPTION);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}