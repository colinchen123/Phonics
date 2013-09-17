package com.topmind.modules.map.controller
{
import com.topmind.modules.map.MapModule;
import com.topmind.modules.map.MapModuleMediator;

import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

public class MapStartupCommand extends ModuleCommand
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>MapStartupCommand</code>实例.
     *
     */
    public function MapStartupCommand()
    {
        super();
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function execute():void{
        mediatorMap.mapView(MapModule, MapModuleMediator);
        
        
        mediatorMap.createMediator(contextView);
    }
}
}