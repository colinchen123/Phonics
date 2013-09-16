package com.topmind.modules.bear.views
{
import com.topmind.common.events.PhonicsEvent;
import com.topmind.core.UserProxy;
import com.topmind.managers.SoundManager;
import com.topmind.modules.bear.contollers.events.BearEvent;
import com.topmind.modules.bear.models.DataProxy;
import com.topmind.modules.bear.views.events.RunMovieViewEvent;

import flash.events.Event;
import flash.media.SoundChannel;
import flash.media.SoundTransform;
import flash.utils.setTimeout;

import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class BearViewMediator extends ModuleMediator
{
    
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearViewMediator</code>实例.
     *
     */
    public function BearViewMediator()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var state:String = "run";
    private var soundChannel:SoundChannel;
    private var bgSoundChannel:SoundChannel;
    private var soundManager:SoundManager = new SoundManager();
    
    //==========================================================================
    //  Properties
    //==========================================================================
    
    [Inject]
    public var view:BearView;
    
    [Inject]
    public var dataProxy:DataProxy;
    
    [Inject]
    public var userProxy:UserProxy;
    
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        state = "run";
        dataProxy.readSoundList();
        
        addViewListener(BearEvent.RIGHT, rightHandler);
        addViewListener(BearEvent.REPLAY, replayHandler);
//        addViewListener(RunMovieViewEvent.END_MOVIE, endMovieHandler);
        view.addEventListener(BearEvent.WRONG, wrongHandler);
        view.addEventListener(RunMovieViewEvent.END_MOVIE, endMovieHandler);
        addViewListener(BearEvent.SHOW_RESULT, showResultHandler);
        var soundTranfrom:SoundTransform = new SoundTransform(0.3);
        bgSoundChannel = soundManager.getSound("effects/bg.mp3").play(0, int.MAX_VALUE,soundTranfrom);
        
        addModuleListener(PhonicsEvent.OPEN_SETTING, open_settingHandler);
        addModuleListener(PhonicsEvent.RESUME, resumeHandler);
        addModuleListener(PhonicsEvent.REPLAY, replayHandler);
        setTimeout(view.setWords, 1000, dataProxy.getRandomList());
        view.setAvatarType(userProxy.avatar);
    }
    override public function onRemove():void{
        view.dispose();
        bgSoundChannel.stop();
        soundChannel && soundChannel.stop();
        soundChannel = null;
    }
    
    private function playBearWinSound():void{
        soundChannel = soundManager.getSound("effects/bearWin.mp3").play(0, int.MAX_VALUE);
    }

    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function resumeHandler(event:Event):void{
        view.resume();
    }
    
    private function open_settingHandler(event:Event):void{
        view.pause();
    }
    
    private function wrongHandler(event:BearEvent):void{
        dataProxy.wrongCount++;
        if (dataProxy.wrongCount >= 6){ 
            view.bearWin();
            setTimeout(playBearWinSound, 1500);
            state = "bearWin";
        }else{
            view.runNear();
            state = "near";
        }
    }
    
    private function showResultHandler(event:BearEvent):void{
        view.showResultpanel(dataProxy.rightCount);
        soundChannel && soundChannel.stop();
        soundChannel = null;
        if (dataProxy.rightCount == 6){
            var soundUrl:String = "effects/victory.mp3";
        }else{
            soundUrl = "effects/failed.mp3";
        }
        setTimeout(soundManager.playSound, 1000, soundUrl);
    }
    
    private function rightHandler(event:BearEvent):void{
        dataProxy.rightCount++;
        if (dataProxy.rightCount >= 6){
            view.catWin();
            state = "catWin"
        }
        else{
            view.throwStone();
            state = "throw";
        }
    }
    
    private function replayHandler(event:Event):void{
        soundChannel && soundChannel.stop();
        soundChannel = null;
        dataProxy.rightCount = 0;
        dataProxy.wrongCount = 0;
        view.replay();
        view.setWords(dataProxy.getRandomList());
        event.preventDefault();
    }
    
    private function endMovieHandler(event:RunMovieViewEvent):void{
        trace("state",state);
        switch (state){
            case "near":
                setTimeout(view.setWords, 1000, dataProxy.getRandomList());
                break;
            case "throw":
                view.setWords(dataProxy.getRandomList());
                break;
            case "catWin":
                view.catWinState();
                break;
            case "bearWin":
                view.bearWinState();
                break;
        }
    }
}
}