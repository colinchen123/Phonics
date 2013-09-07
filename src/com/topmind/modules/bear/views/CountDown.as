package com.topmind.modules.bear.views
{
import com.topmind.modules.bear.contollers.events.BearEvent;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.TimerEvent;
import flash.utils.Timer;
import com.topmind.common.view.ReplaceView;

public class CountDown extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>CountDown</code>实例.
     *
     */
    public function CountDown(time:int = 10)
    {
        timer = new Timer(50, time * 20);
        timer.addEventListener(TimerEvent.TIMER, timer_timerHandler);
        timer.addEventListener(TimerEvent.TIMER_COMPLETE, timer_timerCompleteHandler);
        mouseChildren = mouseEnabled = false;
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var timer:Timer;
    protected var asset:MovieClip;
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        this['asset'] = display;
        asset.stop();
    }
    
    public function stop():void{
        timer.stop();
    }
    
    public function resume():void{
        timer.start();
    }
    
    public function reStart():void{
        timer.reset();
        timer.start();
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function timer_timerHandler(event:TimerEvent):void{
        
        asset.gotoAndStop(int(timer.currentCount / timer.repeatCount * 100) + 1)
//        asset.timeBar.x = -timer.currentCount / timer.repeatCount * 308;
    }
    
    private function timer_timerCompleteHandler(event:TimerEvent):void{
        dispatchEvent(new BearEvent(BearEvent.WRONG, true));
    }
}
}