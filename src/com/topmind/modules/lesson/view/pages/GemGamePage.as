package com.topmind.modules.lesson.view.pages
{
import assets.lesson.GemFrameAsset;
import assets.lesson.GemGameAsset;

import com.greensock.TweenLite;
import com.greensock.easing.Elastic;
import com.ysrlin.managers.DragManager;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipTab;
import com.ysrlin.utils.ArrayUtil;
import com.ysrlin.utils.ObjectRecorder;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.utils.Dictionary;

public class GemGamePage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>GemGamePage</code>实例.
     *
     */
    public function GemGamePage()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:GemGameAsset;
    private var objectRecorder:ObjectRecorder;
    private var recoredFeilds:Array = ["x", "y", "scaleX", "scaleY"];
    private var frames:Array = [];
    private var tab:MovieClipTab;
    private var currentGem:GemFrameAsset;
    private var dragManager:DragManager;
    private var gems:Array;
    private var scroe:int = 0;
    private var goods:Array;
    private var nameList:Array;
    private var usedGoods:Array = ["net", "pen", "egg", "tent"];
    private var word:String;
    private var goodsMap:Dictionary;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        dragManager = DragManager.getInstance();
        asset = new GemGameAsset();
        addChild(asset);
        asset.kong.visible = false;
        gems = [asset.gem0, asset.gem1, asset.gem2];
        objectRecorder = new ObjectRecorder();
        createGemFrame();
        soundManager.getSound(soundDir + "gem.mp3");
        goods = DisplayUtil.getChildren(asset.goods);
        nameList = ArrayUtil.getArrayByFeild(goods, "name");
        goodsMap = ArrayUtil.createMapByFeild(goods, "name");
        ArrayUtil.everySetPrototies(gems, {visible:false, alpha:1});
        for each(var item:String in usedGoods){
            ArrayUtil.removeValueFromArray(nameList, item);
        }
        frameLine.addFrame(replay, 3);
    }
    
    override public function replay():void{
        frameLine.clear();
        scroe = 0;
        objectRecorder.revertAll();
        ArrayUtil.everySetPrototies(gems, {visible:false, alpha:1});
        fillFrame();
        soundManager.playSingleSound(soundDir + "gem.mp3");
    }
    
    private function createGemFrame():void{
        var conatiner:Sprite = new Sprite();
        conatiner.y = 150;
        conatiner.x = 250;
        addChild(conatiner);
        for (var i:int = 0; i < 3; i++){
            var gem:GemFrameAsset = new GemFrameAsset();
            gem.x = i * 250;
            conatiner.addChild(gem);
            gem.name = "gem" + i;
            frames.push(gem);
            objectRecorder.record(gem, recoredFeilds);
        }
        tab = new MovieClipTab(conatiner, false);
        tab.reSelect = true;
        tab.trriger = MouseEvent.MOUSE_DOWN;
        tab.addEventListener(Event.SELECT, tab_selectHandler);
    }
    
    private function fillFrame():void{
        word = ArrayUtil.getRandomItem(usedGoods) as String;
        var words:Array = ArrayUtil.getRandomWith(nameList, word);
        for (var i:int = 0; i < 3; i++){
            var frame:GemFrameAsset = frames[i] as GemFrameAsset;
            if (frame.numChildren >=2) frame.removeChildAt(1);
            var icon:DisplayObject = goodsMap[words[i]] as DisplayObject;
            icon.x = icon.y = 0;
            frame.alpha = 1;
            frame.scaleX = frame.scaleY = 1;
            frame.addChild(icon);
            TweenLite.from(frame, 1, {scaleX:0.5, scaleY:0.5, alpha:0,delay:i * 0.1, ease:Elastic.easeOut})
        }
        if (scroe >=3){
            scroe = 0;
            ArrayUtil.everySetPrototies(gems, {visible:false, alpha:1});
        }
    }
    
    private function showLetter(letter:String):void{
        var file:String = soundDir + "show_" + letter + ".mp3";
        trace(file);
//        frameLine.addFrame(soundManager.playSingleSound, 5, file);
        soundManager.playSingleSound(file);
        for each (var frame:GemFrameAsset in frames){
            if (frame.getChildAt(1).name == letter){
                DisplayUtil.addClickState(frame, null, 5);
            }
        }
        
//        soundManager.getSound(soundDir + "show_" + letter + ".mp3");
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        currentGem = tab.selectItem as GemFrameAsset;
        dragManager.drag(currentGem, null, dragEndHandler);
        TweenLite.to(currentGem, 0.2, {scaleX:0.8, scaleY:0.8});
        var file:String = soundDir +  currentGem.getChildAt(1).name + ".mp3";
        perSound(file);  
    }
    
    private function dragEndHandler():void{
        dragManager.remove(currentGem);
        if(currentGem.hitTestObject(asset.kong)){
            if (currentGem.getChildAt(1).name == word){
                objectRecorder.revert(currentGem);
                TweenLite.from(gems[scroe], 1, {alpha:0});
                gems[scroe].visible = true;
                scroe++;
                soundManager.delayPlay(soundDir + "find_gem.mp3", 0);
                rightInc();
                frameLine.addFrame(fillFrame, 20);
            }else{
                gameWrong();
                frameLine.addFrame(showLetter, 30, word);
//                frameLine.addFrame(fillFrame, 100);
                soundManager.getSound(soundDir + "show_" + word + ".mp3");
                TweenLite.to(currentGem, .5, objectRecorder.getRecord(currentGem));
            }
        }else{
            TweenLite.to(currentGem, .5, objectRecorder.getRecord(currentGem));
        }
        currentGem = null;
    }
}
}