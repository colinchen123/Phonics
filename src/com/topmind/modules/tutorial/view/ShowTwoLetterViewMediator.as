package com.topmind.modules.tutorial.view
{
import com.topmind.modules.tutorial.model.TutorialPorxy;

import org.robotlegs.mvcs.Mediator;

public class ShowTwoLetterViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShowTwoLetterViewMediator</code>实例.
     *
     */
    public function ShowTwoLetterViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:ShowTwoLetterView;
    
    [Inject]
    public var tutorialProxy:TutorialPorxy;
    
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}