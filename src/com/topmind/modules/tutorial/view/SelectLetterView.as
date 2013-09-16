package com.topmind.modules.tutorial.view
{
import com.ysrlin.managers.DragManager;
import com.ysrlin.ui.core.Component;

import flash.display.DisplayObject;
import flash.events.MouseEvent;
import flash.geom.Point;

public class SelectLetterView extends BaseTutorialPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SelectLetterView</code>实例.
     *
     */
    public function SelectLetterView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var frames:Array = [];
    //==========================================================================
    //  Properties
    //==========================================================================
    private var _letterNum:int = 0;

    public function get letterNum():int
    {
        return _letterNum;
    }

    public function set letterNum(value:int):void
    {
        if (_letterNum == value) return;
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function showLetterAt(pt:Point, letter:String):void{
        letterCard.littleView();
        letterCard.x = pt.x;
        letterCard.y = pt.y;
        letterCard.letter = letter;
        letterCard.visible = true;
        DragManager.getInstance().addDarg(letterCard, null, dragEnd);
        letterCard.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
    }
    
    
    public function checkTouch(display:DisplayObject, letter:String):Boolean{
        for each (var frame:SoundFrame in frames){
            if (frame.checkTouch(display, letter)){
                setChildIndex(frame, numChildren - 1);
                return true;
            }
        }
        return false;
    }
    
    public function createSoundFrame(letters:Array, count:int):void{
        var index:int = 0;
        
        if (count == 1){
            var initX:int = 300;
            var hGap:int = 400;
        }else if (count == 2){
            initX = 300;
            hGap = 300;
        }else{
            initX = 220;
            hGap = 390;
        }
        
        for (var i:int = 0; i < 3; i++){
            for (var j:int = 0; j < 2; j++,index++){
                var frame:SoundFrame = new SoundFrame();
                frame.x = initX + j * hGap; 
                frame.y = 200 + i * 100;
                frame.word = letters[index];
                frames.push(frame);
                addChild(frame);
            }
        }
    }
    
    private function initSoundFrame(x:int, y:int, letters:String):void{
        var frame:SoundFrame = new SoundFrame();
        frame.x = x;
        frame.y = y;
        frame.word = letters;
        frames.push(frame);
        addChild(frame);
    }
    
    private function dragEnd():void{
        letterCard.visible = false;
        checkTouch(letterCard, letterCard.letter);
    }
}
}