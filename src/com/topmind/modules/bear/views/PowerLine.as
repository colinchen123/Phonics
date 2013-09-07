package com.topmind.modules.bear.views
{
import com.greensock.TweenLite;
import com.greensock.easing.Elastic;
import com.greensock.plugins.TintPlugin;
import com.greensock.plugins.TweenPlugin;

import flash.display.DisplayObject;
import flash.display.MovieClip;

public class PowerLine
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PowerLine</code>实例.
     *
     */
    public function PowerLine(asset:MovieClip)
    {
        this.asset = asset;
        TweenPlugin.activate([TintPlugin]);
        initDisplay();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:MovieClip;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    private var _number:int = 0;

    public function get number():int
    {
        return _number;
    }

    public function set number(value:int):void
    {
        _number = value;
        if (_number > 6){
            return;
        }else if (_number <= 0){
            initDisplay();
            return;
        }
        var display:DisplayObject = asset.getChildByName("step"+_number);
        TweenLite.from(display, 1,{alpha:0, tint:-0xcccccc, scaleX:0, scaleY:0, ease:Elastic.easeOut});
        display.visible = true;
    }
    //==========================================================================
    //  Methods
    //==========================================================================
    public function reStart():void{
        initDisplay();
        _number = 0;
    }
    private function initDisplay():void{
        asset.mouseChildren = asset.mouseEnabled = false;
        for (var i:int = 1; i <= 6; i++){
            asset.getChildByName("step"+i).visible = false;
        }
    }
}
}