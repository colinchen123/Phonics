package com.topmind.modules.pig.view
{
import assets.pig.RatEndAsset;
import assets.pig.RatThrowAsset;
import assets.pig.RatWaittingAsset;

import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipHandler;

import com.topmind.common.view.ReplaceView;

import flash.display.DisplayObject;
import flash.display.MovieClip;

public class RatView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RatView</code>实例.
     *
     */
    public function RatView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var throwRats:Array = [];
    private var waitRats:Array = [];
    private var endRats:Array = [];
    private var useRats:Array = [];
    
    private var asset:MovieClip;
    private var movieHandler:MovieClipHandler;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as MovieClip;
        for (var i:int = 0; i < 3; i++){
            var mc:MovieClip = asset['rat' + i] as MovieClip;
            mc.stop();
            throwRats.push(mc);
            var rat:MovieClip = new RatWaittingAsset();
            rat.x = mc.x;
            rat.y = mc.y;
            rat.scaleX = rat.scaleY = 1.28;
            rat.stop();
            waitRats.push(rat);
            
            rat = new RatEndAsset();
            rat.scaleX = rat.scaleY = 1.28;
            rat.x = mc.x;
            rat.y = mc.y;
            rat.stop();
            endRats.push(rat);
            useRats.push(mc);
        }
//        DisplayUtil.stopAllChild(asset);
        movieHandler = new MovieClipHandler();
        wait(0);
        wait(1);
        wait(2);
        setFood(1);
    }
    
    public function setFood(index:int):void{
        for (var i:int = 0; i < 3; i++){
            waitRats[i].food.gotoAndStop(index);
            endRats[i].food.gotoAndStop(index);
        }
    }
    
    public function wait(index:int = -1):void{
        if (index == -1){
            for(var i:int = 0; i < 3; i++){
                useRatAt(i, waitRats[i]);
            }
        }else{
            useRatAt(index, waitRats[index]);
        }
    }
    
    public function end():void{
        for(var i:int = 0; i < 3; i++){
            useRatAt(i, endRats[i]);
        }
//        movieHandler.addEndHandler(useRats[0], wait);
    }
    
    
    private var throwIndex:int;
    public function throwFood(index:int):void{
        useRatAt(index, throwRats[index]);
        throwIndex = index;
        movieHandler.addEndHandler(throwRats[index], endMovieHandler);
    }
    
    private function useRatAt(index:int, mc:MovieClip):void{
        if (useRats[index] != mc){
            useRats[index].stop();
            asset.removeChild(useRats[index]);
            mc.gotoAndPlay(1);
            useRats[index] = mc;
            asset.addChild(mc);
        }
    }
    
    private function endMovieHandler():void{
        useRatAt(throwIndex, waitRats[throwIndex]);
    }
}
}