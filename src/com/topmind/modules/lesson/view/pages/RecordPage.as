package com.topmind.modules.lesson.view.pages
{
import assets.lesson.RecordAsset;

import com.topmind.common.Recorder;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipTab;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.setTimeout;

public class RecordPage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RecordPage</code>实例.
     *
     */
    public function RecordPage()
    {
        super();
        sound = "recording";
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:RecordAsset;
    private var tab:MovieClipTab;
    private var currentState:String = null;
    private var recroder:Recorder;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new RecordAsset();
        addChild(asset);
//        DisplayUtil.addClickState(asset.btn);
//        replay();
        movie = asset.girl;
        
        setTimeout(replay, 100);
        asset.buttons.visible = false;
        asset.girl.addEventListener(MouseEvent.CLICK, girl_clickHandler);
        tab = new MovieClipTab(asset.buttons);
        tab.addEventListener(Event.SELECT, select_handler);
        tab.reSelect = true;
    }
    
    override public function replay():void{
        asset.buttons.visible = false;
        frameLine.clear();
        asset.girl.gotoAndStop(1);
        introduce();
        frameLine.addTime(tipClick, 1500);
//        speak();
    }
    
//    override protected function speak(url:String=null):void{
//        asset.buttons.visible = false;
//        frameLine.clear();
//        super.speak();
//        frameLine.addTime(soundManager.playSingleSound, 1000, soundDir + "recording.mp3");
//        frameLine.addTime(tipClick, 1500);
//    }
    
    private function tipClick():void{
        asset.buttons.visible = true;
        DisplayUtil.addClickState(asset.buttons.record);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function girl_clickHandler(event:MouseEvent):void{
//        replay();
        movie.gotoAndPlay(1);
        speak();
    }
    
    private function select_handler(event:Event):void{
        if (tab.selected == "record"){
            if (currentState == "recording"){
                asset.buttons.replay.visible = true;
                DisplayUtil.addClickState(asset.buttons.replay);
                recroder.stop();
                tab.selected = null;
                currentState = null;
            }else{
                DisplayUtil.removeClickState(tab.selectItem);
                if (recroder == null){
                    recroder = new Recorder();
                    recroder.addEventListener(Event.SOUND_COMPLETE, record_soundCompleteHandler);
                }
                recroder ||= new Recorder();
                recroder.record();
                currentState = "recording";
            }
        }else if (tab.selected == "replay"){
            if (currentState == "replaying"){
                tab.selected = null;
                currentState = null;
                recroder.stopPlay();
            }else{
                DisplayUtil.removeClickState(asset.buttons.replay);
                recroder.replay();
                currentState = "replaying"
            }
        }
    }
    
    private function record_soundCompleteHandler(event:Event):void{
        tab.selected = null;
        currentState = null;
    }
}
}