package com.topmind.modules.bear.views
{
import bear.StatePanelAsset;

import com.greensock.TweenLite;
import com.greensock.easing.Elastic;
import com.topmind.modules.bear.contollers.events.BearEvent;

import flash.display.DisplayObject;
import flash.events.MouseEvent;
import com.topmind.common.view.ReplaceView;

public class StatePanelView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>StatePanelView</code>实例.
     *
     */
    public function StatePanelView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:StatePanelAsset
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as StatePanelAsset;
        asset.stop();
        asset.btnNext.addEventListener(MouseEvent.CLICK, btnNext_clickHandler);
        visible = false;
    }
    
    public function showBearWin():void{
        asset.gotoAndStop(1);
        TweenLite.from(this, 1, {scaleX:0.5, scaleY:0.5, alpha:0, ease:Elastic.easeOut});
        visible = true;
    }
    
    public function showCatWin():void{
        asset.gotoAndStop(2);
        TweenLite.from(this, 1, {scaleX:0.5, scaleY:0.5, alpha:0, ease:Elastic.easeOut});
        visible = true;
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function btnNext_clickHandler(event:MouseEvent):void{
        visible = false;
        dispatchEvent(new BearEvent(BearEvent.SHOW_RESULT, true));
    }
}
}