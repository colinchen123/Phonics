package com.topmind.modules.shell
{
import com.topmind.common.events.PhonicsEvent;
import com.topmind.core.AppConfig;
import com.topmind.core.BaseModule;
import com.topmind.modules.bear.BearModule;
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
        playBgSound();
        addViewListener(PhonicsEvent.REQUEST_EXIT, requestExitHandler);
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
    private function selectGameHandler(event:ShellEvent):void{
        var game:BaseModule;
        if (event.data == "bear"){
            game = new BearModule();
        }else if (event.data == "pig"){
            game = new PigModule();
        }else if (event.data == "tutorial"){
            game = new TutorialModule();
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