package com.topmind.modules.pig.view
{
import assets.pig.PigStep1Asset;
import assets.pig.PigStep3Asset;
import assets.pig.PigStep4Asset;

import com.topmind.common.view.ReplaceView;
import com.topmind.core.AppConfig;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipHandler;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.utils.setTimeout;

public class PigView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigView</code>实例.
     *
     */
    public function PigView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:Sprite;
    private var container:Sprite;
    private var pig:MovieClip;
    private var movieHandler:MovieClipHandler;
    
    public var state:String;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        MovieClip(display).stop();
        removeChild(display);
        asset = display as Sprite;
        setState();
        wait();
        movieHandler = new MovieClipHandler();
    }
    
    public function setState(index:int =1):void{
        if (index == 1){
            container = new PigStep1Asset();
        }else if (index == 3){
            container = new PigStep3Asset();
        }else if (index == 4){
            container = new PigStep4Asset();
        }
        DisplayUtil.stopAllChild(container);
    }
    
    public function finish():void{
        usePig("finish");
        playSound("finish");
    }
    
    public function wait():void{
        usePig("wait");
    }
    
    public function happy():void{
        usePig("happy");
        var sp:MovieClip = pig.getChildAt(0) as MovieClip;
        movieHandler.addEndHandler(sp, checkEnd);
        playSound("happy");
    }
    
    public function angry():void{
        usePig("angry");
        var sp:MovieClip = pig.getChildAt(0) as MovieClip;
        movieHandler.addEndHandler(sp, checkEnd);
        playSound("wrong");
    }
    
    public function eat(index:int = 1):void{
        usePig("eat");
        var sp:MovieClip = pig.getChildAt(0) as MovieClip;
        sp.gotoAndPlay(1);
        MovieClip(sp.getChildAt(sp.numChildren - 1)).gotoAndStop(index);
        movieHandler.addEndHandler(sp, checkEnd);
        playSound("fly");
        setTimeout(playSound, 800, "eat");
    }
    
    private function usePig(state:String):void{
        this.state = state;
        clear();
        pig = container[state];
        pig.gotoAndPlay(1);
        pig.x = pig.y = 0;
        addChild(pig);
    }
    
    private function playSound(url:String):void{
        AppConfig.soundManager.playSingleSound("effects/pig/"+url+".mp3");
    }
    
    private function clear():void{
        if(pig){
            pig.stop();
            removeChild(pig);
            pig = null;
        }
    }
    private function checkEnd():void{
        dispatchEvent(new Event(Event.COMPLETE));
    }
    
}
}