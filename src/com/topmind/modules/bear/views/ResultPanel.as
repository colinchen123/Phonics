package com.topmind.modules.bear.views
{
import assets.assets.AvatarIconAsset;

import bear.ResultPanelAsset;

import com.greensock.TweenLite;
import com.greensock.easing.Elastic;
import com.topmind.common.view.ReplaceView;
import com.topmind.core.AppConfig;
import com.topmind.modules.bear.contollers.events.BearEvent;
import com.ysrlin.utils.MathUtil;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.utils.setTimeout;

public class ResultPanel extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ResultPanel</code>实例.
     *
     */
    public function ResultPanel()
    {
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:ResultPanelAsset;
    private var randomDisplay:RandomDisplay;
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as ResultPanelAsset;
        asset.btnReplay.addEventListener(MouseEvent.CLICK, btnReplay_clickHandler);
        hideAllStone();
        randomDisplay = new RandomDisplay();
        randomDisplay.x = -100;
        randomDisplay.y = -50;
        addChild(randomDisplay);
        
        var icons:AvatarIconAsset = new AvatarIconAsset();
        var items:Array = [];
        for (var i:int = icons.numChildren - 1; i >= 0; i--){
            items.push(icons.getChildAt(i));
        }
        randomDisplay.setDisplays(items);
    }
    
    public function showResult(num:int):void{
        randomDisplay.visible = false;
        for (var i:int = 0; i < num; i++){
            setTimeout(showStone, i * 100, i);
        }
        visible = true;
        TweenLite.from(this, 1, {scaleX:0.5, scaleY:0.5, ease:Elastic.easeOut});
        if (num == 6)
        {
            setTimeout(showRandom, 1000);
        }
    }
    
    private function showStone(index:int):void{
        var movie:MovieClip = asset['s'+index] as MovieClip;
        movie.visible = true;
        movie.gotoAndPlay(2);
        AppConfig.soundManager.playSound("assets/bear/sound/stoneOnResult.mp3");
    }
    
    private function hideAllStone():void{
        for (var i:int = 0; i < 6; i++){
            asset["s"+i].visible = false;
        }
    }
    
    private function showRandom():void{
        randomDisplay.visible = true;
        var index:int = MathUtil.random(4);
        randomDisplay.showIndex(index, 3);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function btnReplay_clickHandler(event:MouseEvent):void{
        dispatchEvent(new BearEvent(BearEvent.REPLAY, true));
//        nextFunction && nextFunction();
        hideAllStone();
        visible = false;
    }
}
}