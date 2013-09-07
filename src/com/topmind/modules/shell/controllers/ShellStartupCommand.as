package com.topmind.modules.shell.controllers
{
import com.topmind.common.model.PhonicsPorxy;
import com.topmind.modules.shell.ShellModule;
import com.topmind.modules.shell.ShellModuleMediator;
import com.topmind.modules.shell.models.ShellProxy;
import com.topmind.modules.shell.views.AVatarViewMediator;
import com.topmind.modules.shell.views.AvatarView;
import com.topmind.modules.shell.views.GameOptionView;
import com.topmind.modules.shell.views.GameOptionViewMediator;
import com.topmind.modules.shell.views.SettingView;
import com.topmind.modules.shell.views.SettingViewMediator;
import com.topmind.modules.shell.views.ShellEvent;

import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

public class ShellStartupCommand extends ModuleCommand
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShellStartupCommand</code>实例.
     *
     */
    public function ShellStartupCommand()
    {
        super();
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function execute():void{
        injector.mapSingleton(PhonicsPorxy);
        injector.mapSingleton(SettingView);
        injector.mapSingleton(ShellProxy);
        
        mediatorMap.mapView(ShellModule, ShellModuleMediator);
        mediatorMap.mapView(GameOptionView, GameOptionViewMediator);
        mediatorMap.mapView(SettingView, SettingViewMediator);
        mediatorMap.mapView(AvatarView, AVatarViewMediator);
        mediatorMap.createMediator(contextView);
        
        commandMap.mapEvent(ShellEvent.OPEN_SET, OpenSetCommand);
        
        contextView.addChild(new GameOptionView());
    }
}
}