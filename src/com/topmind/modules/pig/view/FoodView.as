package com.topmind.modules.pig.view
{
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipHandler;

import com.topmind.common.view.ReplaceView;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;

public class FoodView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>FoodView</code>实例.
     *
     */
    public function FoodView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var foods:Array = [];
    private var currentFood:MovieClip;
    private var movieHandler:MovieClipHandler;
    private var throwCallback:Function;
    private var food:int;
    
    //----------------------------------
    //  step
    //----------------------------------
    private var _step:int;

    public function get step():int
    {
        return _step;
    }

    public function set step(value:int):void
    {
        _step = value;
    }

    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        for (var i:int = 0; i < 3; i++){
            foods.push(display["food" + i]);
            display["food" + i].visible = false;
        }
        DisplayUtil.stopAllChild(display as Sprite);
        showFood(3);
        movieHandler = new MovieClipHandler();
    }
    
    public function showFood(index:int):void{
        for each (var sp:MovieClip in foods){
            sp.gotoAndStop(1);
            MovieClip(sp.getChildAt(0)).gotoAndStop(index);
        }
    }
    
    public function throwFood(index:int, back:Function = null):void{
        currentFood = foods[index] as MovieClip;
        currentFood.play();
        currentFood.visible = true;
        movieHandler.addEndHandler(currentFood, endThrowHandler);
        throwCallback = back;
    }
    
    private function endThrowHandler():void{
        currentFood.stop();
        currentFood.visible = false;
        currentFood = null;
        throwCallback && throwCallback();
        throwCallback = null;
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
}
}