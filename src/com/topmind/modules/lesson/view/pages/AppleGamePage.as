package com.topmind.modules.lesson.view.pages
{
import assets.lesson.FruitTreeBackAsset;

import com.greensock.TweenLite;
import com.greensock.easing.Elastic;
import com.ysrlin.utils.ArrayUtil;

import flash.display.Bitmap;
import flash.events.MouseEvent;

public class AppleGamePage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>AppleGamePage</code>实例.
     *
     */
    public function AppleGamePage()
    {
        super();
    }
    private var apples:Array = [];
    private var background:Bitmap;
    
//    private var useNames:Array = ["net", "pen", "egg", "tent"];
//    private var unuseNames:Array = ["bat", "bus", "cup", "dog", "log", "map", "pig", "pin"];
    private var letters:Array = ["s","c","a","n","p","t"];
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        background = new Bitmap(new FruitTreeBackAsset());
        addChild(background);
        soundManager.getSound(soundDir + "game_tree.mp3");
        soundManager.getSound(soundDir + "apple_fall.mp3");
        for (var i:int = 0; i < 3; i++){
            var apple:Apple = new Apple(); 
            apple.x = 200 + i * 200;
            apple.y = 100;
            apples.push(apple);
            addChild(apple);
            apple.addEventListener(MouseEvent.CLICK, apple_clickHandler);
        }
        frameLine.addFrame(replay, 3);
    }
    
    override public function replay():void{
        frameLine.clear();
        fill();
        soundManager.playSingleSound(soundDir + "game_tree.mp3");
    }
    
    private function fill():void{
        var words:Array = ArrayUtil.getRandomWith(letters, "e", 3);
        for (var i:int = 0; i < 3; i++){
            apples[i].reSet();
            apples[i].word = words[i];
            TweenLite.from(apples[i], 1, {scaleX:0.5, scaleY:0.5, alpha:0, delay:i * 0.1, ease:Elastic.easeOut});
        }
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function apple_clickHandler(event:MouseEvent):void{
        soundManager.stopSingleSound();
        var apple:Apple = event.currentTarget as Apple;
        if (apple.word == "e"){
            apple.eat();
            rightInc();
            soundManager.delayPlay(soundDir + "apple_eat.mp3", 50);
//            fill();
            frameLine.addFrame(fill, 20);
        }else{
            apple.fall();
            soundManager.delayPlay(soundDir + "apple_fall.mp3", 200);
            gameWrong();
            
//            soundManager.playSingleSound();
        }
    }
}
}
import assets.lesson.AppleAsset;

import flash.display.Sprite;
import flash.events.Event;

class Apple extends Sprite{
    private var asset:AppleAsset;
    private var v:Number = 0;
    public function Apple():void{
        asset = new AppleAsset();
        addChild(asset);
    }
    
    private var _word:String;

    public function get word():String
    {
        return _word;
    }

    public function set word(value:String):void
    {
        _word = value;
        asset.tx.text = value;
    }
    
    
    public function eat():void{
        asset.gotoAndPlay(2);
    }
    
    public function reSet():void{
        removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        y = 100;
        v = 0;
        asset.gotoAndStop(1);
    }
    
    public function fall():void{
        addEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }
    
    private function enterFrameHandler(event:Event):void{
        y += (v+=10);
        if (y >= 500){
            y = 500;
            removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            asset.gotoAndStop("bad");
        }
    }
}