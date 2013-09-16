package com.topmind.modules.tutorial
{
import com.topmind.modules.tutorial.model.TutorialPorxy;

import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class TutorialModuleMediator extends ModuleMediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigModuleMediator</code>实例.
     *
     */
    public function TutorialModuleMediator()
    {
        super();
    }
    
    [Inject]
    public var view:TutorialModule;
    
    [Inject]
    public var proxy:TutorialPorxy;
    
    
    override public function onRegister():void{
        proxy.words = view.words;
        proxy.count = view.count;
        view.showConent();
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}