package com.topmind.modules.shell.views
{
import assets.shell.AvatarOptionAsset;

import com.topmind.common.view.ReplaceView;
import com.topmind.core.AppConfig;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipTab;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;

public class AvatarView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>AvtarView</code>实例.
     *
     */
    public function AvatarView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:AvatarOptionAsset;
    private var tab:MovieClipTab;
    private var tiger:MovieClip;
    private var cat:MovieClip;
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as AvatarOptionAsset;
        tab = new MovieClipTab(asset.avatars);
        tab.addEventListener(Event.SELECT, tab_selectHandler);
        tiger = asset.tiger;
        cat = asset.cat;
        tiger.stop();
        cat.stop();
        
        DisplayUtil.disableMouse(tiger);
        DisplayUtil.disableMouse(cat);
        
        asset.btnOK.addEventListener(MouseEvent.CLICK, btnOk_clickHandler);
        
//        tab.selected = AvatarType.TIGER;
        DisplayUtil.displayGray(asset.btnOK);
//        asset.btnOK.alpha = 0.7;
        asset.btnOK.mouseEnabled = false;
    }
    
    public function hide():void{
        tiger.gotoAndStop(1);
        cat.gotoAndStop(1);
        visible = false;
    }
    
    public function show():void{
        if (tab.selected == "tiger"){
            cat.gotoAndStop(1);
            tiger.play();
        }else if (tab.selected == "cat"){
            tiger.gotoAndStop(1);
            cat.play();
        }
        visible = true;
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        visible && show();
        DisplayUtil.displayGray(asset.btnOK, true);
        asset.btnOK.mouseEnabled = true;
        AppConfig.soundManager.button();
    }
    
    private function btnOk_clickHandler(event:MouseEvent):void{
        dispatchEvent(new ShellEvent(ShellEvent.SELECTED_AVATAR, tab.selected));
    }
}
}