package com.topmind.modules.tutorial.view
{
import org.robotlegs.mvcs.Mediator;

public class HelloLetterViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>HelloLetterViewMediator</code>实例.
     *
     */
    public function HelloLetterViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    [Inject]
    public var view:HelloLetterView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        
    }
    
    override public function onRemove():void{
        
    }
}
}