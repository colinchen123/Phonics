package com.topmind.modules.shell.views
{
import com.topmind.common.events.PhonicsEvent;
import com.topmind.modules.shell.models.ShellProxy;

import org.robotlegs.utilities.modular.base.IModuleEvent;
import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class SettingViewMediator extends ModuleMediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SettingViewMediator</code>实例.
     *
     */
    public function SettingViewMediator()
    {
        super();
    }
    
    [Inject]
    public var shellProxy:ShellProxy;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function onRegister():void{
        dispatchModuleClone(PhonicsEvent.EXIT_SETTING);
//        dispatchModuleClone(PhonicsEvent.LOCAL_SET);
        dispatchModuleClone(PhonicsEvent.RESUME);
        dispatchModuleClone(PhonicsEvent.REPLAY);
        dispatchClone(ShellEvent.EXIT_GAME);
        addViewListener(PhonicsEvent.LOCAL_SET, localSetHandler);
    }
    
    override public function onRemove():void{
        trace("remove");
    }
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function localSetHandler(event:PhonicsEvent):void{
        if (shellProxy.currentGame == null){
            dispatch(event.clone());
        }else{
            dispatchToModules(event.clone() as IModuleEvent);
        }
    }
}
}