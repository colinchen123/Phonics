package com.topmind.modules.shell.controllers
{
import com.topmind.common.events.PhonicsEvent;
import com.topmind.modules.shell.views.SettingView;
import com.ysrlin.managers.PopUpManager;

import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

public class OpenSetCommand extends ModuleCommand
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>OpenSetCommand</code>实例.
     *
     */
    public function OpenSetCommand()
    {
        super();
    }
    //==========================================================================
    //  Properties
    //==========================================================================
    [Inject]
    public var view:SettingView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function execute():void{
        if (!mediatorMap.hasMediatorForView(view))
        {
            mediatorMap.createMediator(view);
        }
//        PopUpManager.addPopUp(view, contextView, true);
//        PopUpManager.centerPopUp(view);
        PopUpManager.getInstance().addPopUp(view,null, false, true, true);
        PopUpManager.getInstance().centerPopUp(view);
        dispatchToModules(new PhonicsEvent(PhonicsEvent.OPEN_SETTING));
    }
}
}