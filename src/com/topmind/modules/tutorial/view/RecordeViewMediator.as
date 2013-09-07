package com.topmind.modules.tutorial.view
{
import org.robotlegs.mvcs.Mediator;

public class RecordeViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RecordeViewMediator</code>实例.
     *
     */
    public function RecordeViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:RecordView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}