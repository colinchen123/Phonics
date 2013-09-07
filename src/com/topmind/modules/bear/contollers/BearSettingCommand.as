package com.topmind.modules.bear.contollers
{
import com.topmind.modules.bear.views.BearSettingView;

import mx.managers.PopUpManager;

import org.robotlegs.mvcs.Command;

public class BearSettingCommand extends Command
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearSettingCommand</code>实例.
     *
     */
    public function BearSettingCommand()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    [Inject]
    public var view:BearSettingView;
    
    override public function execute():void{
        if (!mediatorMap.hasMediatorForView(view)){
            mediatorMap.createMediator(view);
        }
        PopUpManager.addPopUp(view, contextView, true);
        PopUpManager.centerPopUp(view);
    }
}
}