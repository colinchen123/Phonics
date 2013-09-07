package com.topmind.common.view
{
import com.topmind.core.AppConfig;
import com.topmind.managers.SoundManager;
import com.ysrlin.core.IDispose;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.SoundChannel;

public class SoundButton extends ReplaceView implements IDispose
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SoundButton</code>实例.
     *
     */
    public function SoundButton(asset:MovieClip = null)
    {
        super();
        this.asset = asset;
        asset && init();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    private var asset:MovieClip;
    private var url:String;
    
    private var soundManager:SoundManager;
    private var soundChannel:SoundChannel;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public var path:String = "words/"
    
    private var _word:String;
    
    public function get word():String
    {
        return _word;
    }
    
    public function set word(value:String):void
    {
        url = path+value+ ".mp3";
        _word = value;
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as MovieClip;
        asset && init();
    }
    
    public function play():void{
        clearSound();
        soundChannel = soundManager.playSound(url);
        soundChannel.addEventListener(Event.SOUND_COMPLETE, soundChannel_soundCompleteHandler);
        asset.gotoAndStop(2);
    }
    
    override public function dispose():void{
        clearSound();
        removeEventListener(MouseEvent.CLICK, clickHandler);
    }
    
    private function clearSound():void{
        if (soundChannel == null) return;
        soundChannel.removeEventListener(Event.SOUND_COMPLETE, soundChannel_soundCompleteHandler);
        soundChannel.stop();
        soundChannel = null;
    }
    
    private function init():void{
        soundManager = AppConfig.soundManager;
        addEventListener(MouseEvent.CLICK, clickHandler);
        asset.gotoAndStop(1);
        mouseChildren = false;
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function soundChannel_soundCompleteHandler(event:Event):void{
        mouseEnabled = true;
        asset.gotoAndStop(1);
    }
    
    private function clickHandler(event:MouseEvent):void{
        mouseEnabled = false;
        play();
    }
}
}