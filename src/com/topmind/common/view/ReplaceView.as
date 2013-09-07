package com.topmind.common.view
{
import com.ysrlin.core.IDispose;

import flash.display.DisplayObject;
import flash.display.Sprite;

public class ReplaceView extends Sprite
{
    //==========================================================================
    //  Class variables
    //==========================================================================
    
    //==========================================================================
    //  Class Methods
    //==========================================================================
    static public function MutilReplace(viewType:Class, displays:Array):Array{
        var result:Array = [];
        for (var i:int = displays.length - 1; i >= 0; i--){
            var view:ReplaceView = new viewType() as ReplaceView;
            view.replace(displays[i] as DisplayObject);
            result[i] = view;
        }
        return result;
    }
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ReplaceView</code>实例.
     *
     */
    public function ReplaceView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function replace(display:DisplayObject):void{
        var index:int = display.parent.getChildIndex(display);
        x = int(display.x);
        y = int(display.y);
        display.parent.addChildAt(this, index);
        display.parent.removeChild(display);
        display.x = display.y = 0;
        addChild(display);
        if (hasOwnProperty("asset")){
            this['asset'] = display;
        }
    }
    
    public function dispose():void{
        
    }
}
}