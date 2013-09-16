package com.topmind.modules.tutorial.view
{
import com.topmind.modules.tutorial.model.TutorialPorxy;

import org.robotlegs.mvcs.Mediator;

public class HelloLetterViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>HelloLetterViewMediator</code>实例.
     *
     */
    public function HelloLetterViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    [Inject]
    public var view:HelloLetterView;
    
    [Inject]
    public var tutorialProxy:TutorialPorxy;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        view.setData(tutorialProxy.letters, tutorialProxy.count);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}