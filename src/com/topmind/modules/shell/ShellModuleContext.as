package com.topmind.modules.shell
{
import com.topmind.commands.InitBaseCommand;
import com.topmind.core.IModule;
import com.topmind.modules.bear.BearModule;
import com.topmind.modules.shell.controllers.ShellStartupCommand;

import flash.display.DisplayObjectContainer;
import flash.system.ApplicationDomain;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.core.IInjector;
import org.robotlegs.utilities.modular.mvcs.ModuleContext;

public class ShellModuleContext extends ModuleContext
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShellModuleContext</code>实例.
     *
     */
    public function ShellModuleContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector=null, applicationDomain:ApplicationDomain=null)
    {
        super(contextView, autoStartup, parentInjector, applicationDomain);
    }
    
    override public function startup():void{
        viewMap.mapType(IModule);
        
        commandMap.mapEvent(ContextEvent.STARTUP, InitBaseCommand);
        commandMap.mapEvent(ContextEvent.STARTUP, ShellStartupCommand);
        dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
        super.startup();
    }
    
}
}