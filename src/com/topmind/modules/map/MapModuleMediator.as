package com.topmind.modules.map
{
import com.topmind.common.events.PhonicsEvent;

import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class MapModuleMediator extends ModuleMediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>MapModuleMediator</code>实例.
     *
     */
    public function MapModuleMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:MapModule;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        dispatchModuleClone(PhonicsEvent.SELECT_MAP);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}