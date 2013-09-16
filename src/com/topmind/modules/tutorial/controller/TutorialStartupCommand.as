package com.topmind.modules.tutorial.controller
{
import com.topmind.modules.tutorial.TutorialModule;
import com.topmind.modules.tutorial.TutorialModuleMediator;
import com.topmind.modules.tutorial.model.TutorialPorxy;
import com.topmind.modules.tutorial.view.HelloLetterView;
import com.topmind.modules.tutorial.view.HelloLetterViewMediator;
import com.topmind.modules.tutorial.view.LetterTeamView;
import com.topmind.modules.tutorial.view.LetterTeamViewMediator;
import com.topmind.modules.tutorial.view.SelectLetterView;
import com.topmind.modules.tutorial.view.SelectLetterViewMediator;

import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

public class TutorialStartupCommand extends ModuleCommand
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>TutorialStartupCommand</code>实例.
     *
     */
    public function TutorialStartupCommand()
    {
        super();
    }
    
    override public function execute():void{
        injector.mapSingleton(TutorialPorxy);
        
        mediatorMap.mapView(TutorialModule, TutorialModuleMediator);
        mediatorMap.mapView(HelloLetterView, HelloLetterViewMediator);
        mediatorMap.mapView(SelectLetterView, SelectLetterViewMediator);
        mediatorMap.mapView(LetterTeamView, LetterTeamViewMediator);
        
//        contextView.addChild(new HelloLetterView());
    }
}
}