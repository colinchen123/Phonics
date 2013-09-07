package com.topmind.modules.bear.contollers
{
import com.topmind.common.events.PhonicsEvent;
import com.topmind.modules.bear.models.DataProxy;
import com.topmind.modules.bear.views.BearSettingView;
import com.topmind.modules.bear.views.BearView;
import com.topmind.modules.bear.views.BearViewMediator;
import com.topmind.modules.bear.views.RunMovieView;
import com.topmind.modules.bear.views.RunMovieViewMediator;

import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

public class BearStartupCommand extends ModuleCommand
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearStartupCommand</code>实例.
     *
     */
    public function BearStartupCommand()
    {
        super();
    }
    
    override public function execute():void{
        injector.mapSingleton(DataProxy);
        injector.mapSingleton(BearSettingView);
        
        moduleCommandMap.mapEvent(PhonicsEvent.LOCAL_SET, BearSettingCommand);
        mediatorMap.mapView(BearView, BearViewMediator);
        mediatorMap.mapView(RunMovieView, RunMovieViewMediator);
        contextView.addChild(new BearView());
    }
}
}