package com.topmind.modules.bear.views
{
import bear.BearGameAsset;

import com.topmind.AvatarType;
import com.topmind.modules.bear.contollers.events.BearEvent;
import com.topmind.modules.bear.views.events.RunMovieViewEvent;
import com.ysrlin.utils.ArrayUtil;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;

public class BearView extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearView</code>实例.
     *
     */
    public function BearView()
    {
        super();
        initDisplay();
    }
    private var asset:BearGameAsset;
    private var soundButton:SoundButton;
    private var stoneList:WordlistView;
    private var countDown:CountDown;
    private var powerLine:PowerLine;
    private var lostLine:PowerLine;
    private var runMovie:RunMovieView;
    private var resultPanel:ResultPanel;
    private var statePanel:StatePanelView;
    private var bg:BgView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    private function initDisplay():void{
        asset = new BearGameAsset();
        addChild(asset);
        resultPanel = new ResultPanel();
        resultPanel.replace(asset.resultPanel);
        resultPanel.visible = false;
        soundButton = new SoundButton();
        soundButton.replace(asset.soundButton);
        stoneList = new WordlistView();
        stoneList.replace(asset.word);
        stoneList.addEventListener(Event.SELECT, stoneList_selectHandler);
        countDown = new CountDown();
        countDown.replace(asset.countDown);
        
        powerLine = new PowerLine(asset.powerLine);
        lostLine = new PowerLine(asset.lostLine);
        runMovie = new RunMovieView();
        runMovie.replace(asset.bearAndCat);
        
        statePanel = new StatePanelView();
        statePanel.replace(asset.statePanel);
        bg = new BgView();
//        bg.y = 30;
        addChildAt(bg, 0);
        runMovie.addEventListener(RunMovieViewEvent.END_MOVIE, endMovieHandler);
        countDown.addEventListener(BearEvent.WRONG, wrongHandler);
    }
    
    public function replay():void{
        bg.resume();
        resultPanel.visible = false;
        runMovie.reStart();
        powerLine.reStart();
        lostLine.reStart();
        runMovie.visible = true;
        soundButton.visible = true;
    }
    
    public function pause():void{
        countDown.stop();
        runMovie.pause();
        soundButton.visible = false;
        bg.pause();
    }
    
    public function resume():void{
//        countDown.reStart();
        countDown.resume();
        runMovie.resume();
        soundButton.visible = true;
        bg.resume();
    }
    
    public function setWords(arr:Array):void{
        soundButton.word = ArrayUtil.getRandomItem(arr) as String;
        stoneList.setWords(arr, soundButton.word);
        soundButton.play();
        countDown.reStart();
        runMovie.run();
        bg.speed = 5;
    }
    
    public function catWinState():void{
//        runMovie.catWinState();
        runMovie.bearFailed();
        statePanel.showCatWin();
    }
    
    public function bearWinState():void{
        runMovie.bearWinState();
        statePanel.showBearWin();
    }
    
    public function showResultpanel(num:int):void{
        soundButton.visible = false;
        resultPanel.showResult(num);
        runMovie.run();
        runMovie.visible = false;
        bg.speed = 0;
    }
    
    public function runNear():void{
        runMovie.near();
        countDown.stop();
        bg.speed = 0;
    }
    
    public function throwStone():void{
        runMovie.throwStone();
        countDown.stop();
        bg.speed = 0;
    }
    
    public function bearWin():void{
        runMovie.bearWin();
        countDown.stop();
        bg.speed = 0;
    }
    
    public function catWin():void{
        runMovie.catWin();
        countDown.stop();
        bg.speed = 0;
    }
    
    public function dispose():void{
        removeChild(asset);
    }
    
    public function setAvatarType(value:String):void{
        if (value == AvatarType.TIGER){
            asset.catAvatar.visible = false;
        }else{
            asset.tigerAvatar.visible = false;
        }
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private var timeId:uint;
    private function button_mouseDownHandler(event:MouseEvent):void{
        stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
        timeId = setTimeout(dispatchEvent, 1000, new BearEvent(BearEvent.REPLAY));
    }
    
    private function wrongHandler(event:BearEvent):void{
        lostLine.number++;
    }
    
    private function stage_mouseUpHandler(event:MouseEvent):void{
        stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpHandler);
        clearTimeout(timeId);
    }
    
    private function stoneList_selectHandler(event:Event):void{
        if (soundButton.word == stoneList.selected){
            powerLine.number++;
            dispatchEvent(new BearEvent(BearEvent.RIGHT));
        }else{
            lostLine.number++;
            dispatchEvent(new BearEvent(BearEvent.WRONG));
        }
    }
    
    private function endMovieHandler(event:RunMovieViewEvent):void{
        dispatchEvent(event.clone());
    }
}
}