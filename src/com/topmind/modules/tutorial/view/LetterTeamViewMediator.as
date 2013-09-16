package com.topmind.modules.tutorial.view
{
import com.topmind.modules.tutorial.model.TutorialPorxy;

import org.robotlegs.mvcs.Mediator;

public class LetterTeamViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LetterTeamViewMediator</code>实例.
     *
     */
    public function LetterTeamViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:LetterTeamView;
    
    [Inject]
    public var proxy:TutorialPorxy;
    
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        view.createTeams(proxy.words, proxy.count);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}