package com.topmind.modules.tutorial
{
import com.topmind.modules.bear.contollers.BearStartupCommand;
import com.topmind.modules.pig.controll.PigStartupCommand;
import com.topmind.modules.tutorial.controller.TutorialStartupCommand;

import flash.display.DisplayObjectContainer;
import flash.system.ApplicationDomain;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.core.IInjector;
import org.robotlegs.utilities.modular.mvcs.ModuleContext;

public class TutorialModuleContext extends ModuleContext
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BarModuleContext</code>实例.
     *
     */
    public function TutorialModuleContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector=null, applicationDomain:ApplicationDomain=null)
    {
        super(contextView, autoStartup, parentInjector, applicationDomain);
    }
    
    override public function startup():void{
        commandMap.mapEvent(ContextEvent.STARTUP, TutorialStartupCommand);
        
        dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
        super.startup();
    }
}
}