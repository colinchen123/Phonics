package com.topmind.modules.bear.views
{
import com.topmind.core.UserProxy;
import com.topmind.modules.bear.views.events.RunMovieViewEvent;

import org.robotlegs.mvcs.Mediator;

public class RunMovieViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RunMovieViewMediator</code>实例.
     *
     */
    public function RunMovieViewMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var state:String;
    
    [Inject]
    public var view:RunMovieView;
    
    [Inject]
    public var userProxy:UserProxy;
    
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function onRegister():void{
        view.initWithAvatar(userProxy.avatar);
        view.run();
        state = "run";
    }
    
    override public function onRemove():void{
        view.dispose();
        trace("runMovie onRemove");
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function endMovieHandler(event:RunMovieViewEvent):void{
        
    }
}
}