package com.topmind.modules.tutorial.view
{
import com.topmind.modules.tutorial.model.TutorialPorxy;

import org.robotlegs.mvcs.Mediator;

public class SelectLetterViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SelectLetterViewMediator</code>实例.
     *
     */
    public function SelectLetterViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:SelectLetterView;
    
    [Inject]
    public var tutorialProxy:TutorialPorxy;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        view.createSoundFrame(tutorialProxy.words || tutorialProxy.letters, tutorialProxy.count);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}