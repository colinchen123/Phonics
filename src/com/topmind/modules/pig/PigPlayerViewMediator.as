package com.topmind.modules.pig
{
import com.topmind.core.UserProxy;

import org.robotlegs.mvcs.Mediator;

public class PigPlayerViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigPlayerViewMediator</code>实例.
     *
     */
    public function PigPlayerViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Properties
    //==========================================================================
    [Inject]
    public var userPorxy:UserProxy;
    
    [Inject]
    public var view:PigPlayer;
    
    override public function onRegister():void{
        
    }
    
    override public function onRemove():void{
        
    }
        
}
}