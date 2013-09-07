package com.topmind.modules.shell.views
{
import assets.shell.ShellSettingAsset;

import com.topmind.common.events.PhonicsEvent;
import com.ysrlin.managers.PopUpManager;
import com.ysrlin.ui.core.Component;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class SettingView extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SettingView</code>实例.
     *
     */
    public function SettingView()
    {
        super();
        initDisplay();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:ShellSettingAsset;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function dispose():void{
    }
    
    private function initDisplay():void{
        addChild(asset = new ShellSettingAsset());
        asset.btnResume.addEventListener(MouseEvent.CLICK, btnResume_clickHandler);
        asset.btnReplay.addEventListener(MouseEvent.CLICK, btnReplay_clickHandler);
        asset.btnExit.addEventListener(MouseEvent.CLICK, btnExit_clickHandler);
        asset.btnSetting.addEventListener(MouseEvent.CLICK, btnSetting_clickHnadler);
    }
    
    private function remove():void{
        PopUpManager.getInstance().removePopUp(this);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function btnResume_clickHandler(event:MouseEvent):void{
        dispatchEvent(new PhonicsEvent(PhonicsEvent.RESUME));
        PopUpManager.getInstance().removePopUp(this);
    }
    
    private function btnReplay_clickHandler(event:MouseEvent):void{
        dispatchEvent(new PhonicsEvent(PhonicsEvent.REPLAY));
        PopUpManager.getInstance().removePopUp(this);
    }
    
    private function btnExit_clickHandler(event:MouseEvent):void{
        dispatchEvent(new ShellEvent(ShellEvent.EXIT_GAME));
        PopUpManager.getInstance().removePopUp(this);
    }
    
    private function btnSetting_clickHnadler(event:MouseEvent):void{
        dispatchEvent(new PhonicsEvent(PhonicsEvent.LOCAL_SET));
        PopUpManager.getInstance().removePopUp(this);
    }
}
}