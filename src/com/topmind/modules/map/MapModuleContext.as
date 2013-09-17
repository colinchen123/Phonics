package  com.topmind.modules.map
{
import com.topmind.modules.map.controller.MapStartupCommand;

import flash.display.DisplayObjectContainer;
import flash.system.ApplicationDomain;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.core.IInjector;
import org.robotlegs.utilities.modular.mvcs.ModuleContext;

public class MapModuleContext extends ModuleContext
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>MapModuleContext</code>实例.
     *
     */
    public function MapModuleContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector=null, applicationDomain:ApplicationDomain=null)
    {
        super(contextView, autoStartup, parentInjector, applicationDomain);
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function startup():void{
        commandMap.mapEvent(ContextEvent.STARTUP, MapStartupCommand);
        dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
    }
}
}