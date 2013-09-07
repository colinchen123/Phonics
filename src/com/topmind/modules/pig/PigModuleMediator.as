package com.topmind.modules.pig
{
import com.topmind.common.events.PhonicsEvent;
import com.topmind.core.AppConfig;
import com.topmind.modules.bear.models.DataProxy;

import flash.media.SoundChannel;
import flash.utils.setTimeout;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class PigModuleMediator extends ModuleMediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigModuleMediator</code>实例.
     *
     */
    public function PigModuleMediator()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var soundChannel:SoundChannel;
    
    [Inject]
    public var view:PigModule;
    
    [Inject]
    public var dataProxy:DataProxy;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        dataProxy.readSoundList();
        setTimeout(view.setWord, 500, dataProxy.getRandomList());
        addViewListener(PigEvent.FINISH, finishHandler);
        soundChannel = AppConfig.soundManager.playSound("effects/pig/bg.mp3", int.MAX_VALUE, 0.3);
        addContextListener(ContextEvent.SHUTDOWN, shutdownHandler);
        addModuleListener(PhonicsEvent.REPLAY, replayHandler);
    }
    
    override public function onRemove():void{
        view.dispose();
        soundChannel.stop();
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function replayHandler(event:PhonicsEvent):void{
        view.replay();
    }
    private function shutdownHandler(event:ContextEvent):void{
        soundChannel.stop();
        soundChannel = null;
    }
    
    private function finishHandler(event:PigEvent):void{
        if (view.isRight){
            dataProxy.rightCount++;
        }else{
            dataProxy.wrongCount++;
        }
        setTimeout(view.setWord, 500, dataProxy.getRandomList());
    }
}
}