package com.topmind.modules.shell.views
{
import assets.shell.GameOptionAsset;

import com.topmind.common.view.ReplaceView;
import com.topmind.core.AppConfig;
import com.ysrlin.ui.utils.MovieClipTab;

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.events.Event;

public class GameOptionView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>GameOptionView</code>实例.
     *
     */
    public function GameOptionView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:GameOptionAsset;
    private var tab:MovieClipTab;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as GameOptionAsset;
        tab = new MovieClipTab(asset, false, false);
        tab.addEventListener(Event.SELECT, tab_selectHandler);
        tab.reSelect = true;
//        asset.pig.mouseChildren = false;
//        asset.bear.mouseChildren = false;
        for (var i:int = 0; i < asset.numChildren; i++){
            var container:DisplayObjectContainer = asset.getChildAt(i) as DisplayObjectContainer;
            container && (container.mouseChildren = false);
        }
    }
    
    override public function dispose():void{
        tab.dispose();
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        var shellViewEvent:ShellEvent = new ShellEvent(ShellEvent.SELECT_GAME);
        shellViewEvent.data = tab.selected;
        dispatchEvent(shellViewEvent);
        AppConfig.soundManager.button();
    }
}
}