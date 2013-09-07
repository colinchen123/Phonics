package com.topmind.modules.tutorial
{
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
    
    override public function onRegister():void{
        
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}