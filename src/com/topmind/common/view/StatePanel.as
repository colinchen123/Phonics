package com.topmind.common.view
{
import com.greensock.TweenLite;
import com.greensock.easing.Elastic;

import flash.display.DisplayObject;
import flash.display.SimpleButton;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class StatePanel extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>StatePanel</code>实例.
     *
     */
    public function StatePanel()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:Sprite;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public var nextFun:Function;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as Sprite;
        SimpleButton(asset['btnNext']).addEventListener(MouseEvent.CLICK, clickHandler);
        visible = false;
    }
    
    public function show(index:int = 1):void{
        TweenLite.from(this, 1, {scaleX:0.5, scaleY:0.5, alpha:0, ease:Elastic.easeOut});
        visible = true;
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function clickHandler(event:MouseEvent):void{
        visible = false;
        nextFun && nextFun();
    }
}
}