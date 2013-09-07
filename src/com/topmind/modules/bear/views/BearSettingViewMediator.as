package com.topmind.modules.bear.views
{
import org.robotlegs.mvcs.Mediator;

public class BearSettingViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearSettingViewMediator</code>实例.
     *
     */
    public function BearSettingViewMediator()
    {
        super();
    }
    
    [Inject]
    public var view:BearSettingView;
    
    override public function onRegister():void{
        
    }
    
    override public function onRemove():void{
        
    }
}
}