package com.topmind.modules.shell.views
{
import com.topmind.core.UserProxy;

import org.robotlegs.mvcs.Mediator;

public class AVatarViewMediator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>AVatarViewMediator</code>实例.
     *
     */
    public function AVatarViewMediator()
    {
        super();
    }
    
    [Inject]
    public var view:AvatarView;
    
    [Inject]
    public var userProxy:UserProxy;
    
    override public function onRegister():void{
        addViewListener(ShellEvent.SELECTED_AVATAR, selectedAvatarHandler);
    }
    
    override public function onRemove():void{
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function selectedAvatarHandler(event:ShellEvent):void{
        userProxy.avatar = event.data as String;
        dispatch(event.clone());
    }
}
}