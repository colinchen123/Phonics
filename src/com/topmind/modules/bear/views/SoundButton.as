package com.topmind.modules.bear.views
{
import bar.SoundButtonAsset;

import com.topmind.common.view.ReplaceView;
import com.topmind.managers.SoundManager;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.SoundChannel;
import flash.media.SoundTransform;

public class SoundButton extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SoundButton</code>实例.
     *
     */
    public function SoundButton()
    {
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    private var url:String;
    
    private var soundManager:SoundManager = new SoundManager();
    private var soundChannel:SoundChannel;
    
    private var _word:String;

    public function get word():String
    {
        return _word;
    }

    public function set word(value:String):void
    {
        url = "words/"+value+ ".mp3";
        _word = value;
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:SoundButtonAsset;
    
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as SoundButtonAsset;
        asset.gotoAndStop(1);
        mouseChildren = false;
        addEventListener(MouseEvent.CLICK, view_clickHandler);
        soundManager.soundTranform = new SoundTransform(1.5);
        
    }
    
    
    public function play():void{
        clearSound();
        soundChannel = soundManager.playSound(url);
        soundChannel.addEventListener(Event.SOUND_COMPLETE, soundChannel_soundCompleteHandler);
        asset.gotoAndStop(2);
    }
    
    private function clearSound():void{
        if (soundChannel == null) return;
        soundChannel.removeEventListener(Event.SOUND_COMPLETE, soundChannel_soundCompleteHandler);
        soundChannel.stop();
        soundChannel = null;
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    
    private function soundChannel_soundCompleteHandler(event:Event):void{
        mouseEnabled = true;
        asset.gotoAndStop(1);
    }
    
    private function view_clickHandler(event:MouseEvent):void{
        mouseEnabled = false;
        play();
    }
}
}