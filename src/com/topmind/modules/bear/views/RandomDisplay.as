package com.topmind.modules.bear.views
{
import com.greensock.TweenLite;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.geom.Rectangle;

public class RandomDisplay extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RandomDisplay</code>实例.
     *
     */
    public function RandomDisplay()
    {
        super();
        rect = new Rectangle(0, 0, 200, 200);
        scrollRect = rect;
    }
    
    private var datas:Array = [];
    private var len:int;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public var rect:Rectangle;
    
    public var postion:int = 0;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function setDisplays(value:Array):void{
        var gap:int = rect.width;
        for (var i:int = value.length - 1; i >= 0; i--){
            var obj:Object = {display:value[i], dx:gap * i - (value[i].width - 200) * 0.5};
            datas[i] = obj;
            addChild(value[i]);
            value[i].y = 0;
        }
        len = gap * datas.length;
    }
    
    public function showIndex(value:int, time:Number):void{
        postion = 0;
        var target:int = rect.width * int(time * 5 + value);
        TweenLite.to(this, time, {postion:target, onUpdate:update})
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function update():void{
        for (var i:int = datas.length - 1; i >= 0; i--){
            var dx:int = datas[i].dx - postion;
            if (dx < -400){
                datas[i].dx += len;
            }else if (dx > len){
                datas[i].dx -= len;
            }
            datas[i].display.x = dx;
        }
    }
    
    private function showComplete():void{
        
    }
}
}