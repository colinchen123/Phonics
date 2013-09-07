package com.topmind.modules.bear
{
import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class BearModuleMediator extends ModuleMediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearModuleMediator</code>实例.
     *
     */
    public function BearModuleMediator()
    {
        super();
    }
    
    [Inject]
    public var view:BearModule;
    
    override public function onRegister():void{
        
    }
    
    override public function onRemove():void{
        
    }
}
}