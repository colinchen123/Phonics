package com.topmind.modules.lesson
{
import com.topmind.modules.lesson.controller.LessonStartupCommand;

import flash.display.DisplayObjectContainer;
import flash.system.ApplicationDomain;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.core.IInjector;
import org.robotlegs.utilities.modular.mvcs.ModuleContext;

public class LessonModuleContext extends ModuleContext
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessonModuleContext</code>实例.
     *
     */
    public function LessonModuleContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector=null, applicationDomain:ApplicationDomain=null)
    {
        super(contextView, autoStartup, parentInjector, applicationDomain);
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function startup():void{
        commandMap.mapEvent(ContextEvent.STARTUP, LessonStartupCommand);
        
        dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
    }
}
}