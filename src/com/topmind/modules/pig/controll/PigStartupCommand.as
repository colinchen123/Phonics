package com.topmind.modules.pig.controll
{
import com.topmind.modules.bear.models.DataProxy;
import com.topmind.modules.pig.PigModule;
import com.topmind.modules.pig.PigModuleMediator;
import com.topmind.modules.pig.model.PigProxy;

import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

public class PigStartupCommand extends ModuleCommand
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigStartupCommand</code>实例.
     *
     */
    public function PigStartupCommand()
    {
        super();
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function execute():void{
        injector.mapSingleton(PigProxy);
        injector.mapSingleton(DataProxy);
        
        mediatorMap.mapView(PigModule,PigModuleMediator);
        mediatorMap.createMediator(contextView);
    }
}
}