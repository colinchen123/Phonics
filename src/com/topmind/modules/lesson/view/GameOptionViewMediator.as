package com.topmind.modules.lesson.view
{
import com.topmind.modules.lesson.LessonEvent;

import org.robotlegs.mvcs.Mediator;

public class GameOptionViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>GameOptionViewMediator</code>实例.
     *
     */
    public function GameOptionViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:GameOptionView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        dispatchClone(LessonEvent.SELECTED_GAME);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}