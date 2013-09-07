package com.topmind.modules.pig
{
import com.topmind.modules.bear.contollers.BearStartupCommand;
import com.topmind.modules.pig.controll.PigStartupCommand;

import flash.display.DisplayObjectContainer;
import flash.system.ApplicationDomain;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.core.IInjector;
import org.robotlegs.utilities.modular.mvcs.ModuleContext;

public class PigModuleContext extends ModuleContext
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BarModuleContext</code>实例.
     *
     */
    public function PigModuleContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector=null, applicationDomain:ApplicationDomain=null)
    {
        super(contextView, autoStartup, parentInjector, applicationDomain);
    }
    
    override public function startup():void{
        commandMap.mapEvent(ContextEvent.STARTUP, PigStartupCommand);
        
        dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
        super.startup();
    }
}
}