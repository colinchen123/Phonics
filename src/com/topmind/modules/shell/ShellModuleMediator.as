package com.topmind.modules.shell
{
import com.topmind.common.events.PhonicsEvent;
import com.topmind.core.AppConfig;
import com.topmind.core.BaseModule;
import com.topmind.modules.bear.BearModule;
import com.topmind.modules.lesson.LessonModule;
import com.topmind.modules.pig.PigModule;
import com.topmind.modules.shell.models.ShellProxy;
import com.topmind.modules.shell.views.ShellEvent;
import com.topmind.modules.tutorial.TutorialModule;

import flash.media.SoundChannel;

import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class ShellModuleMediator extends ModuleMediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShellModuleMediator</code>实例.
     *
     */
    public function ShellModuleMediator()
    {
        super();
    }
    
    private var soundChannel:SoundChannel;
    
    private var tempEvent:ShellEvent;
    
    [Inject]
    public var view:ShellModule;
    
    [Inject]
    public var shellProxy:ShellProxy;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function onRegister():void{
        addContextListener(ShellEvent.SELECT_GAME, selectGameHandler);
        dispatchClone(ShellEvent.OPEN_SET);
        addContextListener(ShellEvent.EXIT_GAME, exitGameHandler);
        addContextListener(PhonicsEvent.LOCAL_SET, localSetHandler);
        addContextListener(ShellEvent.SELECTED_AVATAR, selectedAvatarHandler);
        addContextListener(ShellEvent.AUTO_REPLAY, autoReplayHandler);
        playBgSound();
        addViewListener(PhonicsEvent.REQUEST_EXIT, requestExitHandler);
        
        addModuleListener(PhonicsEvent.SELECT_MAP, selectMapHandler);
        
    }
    
    override public function onRemove():void{
        view.dispose();
    }
    
    
    private function playBgSound():void{
        soundChannel = AppConfig.soundManager.playSound("effects/shell/bg.mp3",int.MAX_VALUE, 0.5);
    }
    
    private function stopBgSound():void{
        soundChannel && soundChannel.stop();
        soundChannel = null;
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function selectMapHandler(event:PhonicsEvent):void{
        view.showGame(new LessonModule());
//        view.showGame(new BearModule());
    }
    
    private function autoReplayHandler(event:ShellEvent):void{
        selectGameHandler(tempEvent);
    }
    
    private function selectGameHandler(event:ShellEvent):void{
        tempEvent = event;
        var game:BaseModule;
        if (event.data == "bear"){
            game = new BearModule();
        }else if (event.data == "pig"){
            game = new PigModule();
        }else if (event.data == "lesson"){
            game = new LessonModule();
        }else{
            var tutorial:TutorialModule = new TutorialModule();
            if (event.data == "tutorial"){
                tutorial.count = 1;
            }else if (event.data == "tutorial1"){
                tutorial.count = 2;
                tutorial.words = ["as",'ap', 'at','ca','na','pa'];
            }else{
                tutorial.count = 3;
                tutorial.words = ["act",'ans', 'anc','aps','apt','acs'];
            }
            game = tutorial;
        }
        shellProxy.currentGame = game;
        view.showGame(game);
        stopBgSound();
    }
    
    private function requestExitHandler(evnet:PhonicsEvent):void{
        exitGameHandler(null);
    }
    
    private function exitGameHandler(event:ShellEvent):void{
        shellProxy.currentGame = null;
        view.exitCurrentGame();
        if (soundChannel == null){
            playBgSound();
        }
    }
    
    private function localSetHandler(event:PhonicsEvent):void{
        view.selectAvatar();
    }
    
    private function selectedAvatarHandler(event:ShellEvent):void{
        view.selectGame();
    }
}
}