package com.topmind.modules.tutorial.view
{
import assets.tutorial.SoundButtonAsset;

import com.topmind.common.view.SoundButton;
import com.ysrlin.ui.core.Component;

import flash.display.DisplayObject;

public class SoundFrame extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SoundFrame</code>实例.
     *
     */
    public function SoundFrame()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var soundButton:SoundButton;
    
    private var frames:Vector.<LetterFrame>;
    
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public function get word():String
    {
        return soundButton.word;
    }

    public function set word(value:String):void
    {
        if (value.length > 1){
            soundButton.template = "words/{0}.mp3";
        }else{
            soundButton.template = null;
        }
        
        soundButton.word = value;
        frames = new Vector.<LetterFrame>();
        for (var i:int = 0; i < value.length; i++){
            var frame:LetterFrame = new LetterFrame();
            frame.x = 100 + 80 * i;
            frame.letter = value.charAt(i);
            addChild(frame);
            frames.push(frame);
        }
    }
    
    public function checkTouch(display:DisplayObject, letter:String):Boolean{
        for each (var frame:LetterFrame in frames){
            if (!frame.isRight && frame.hitTestObject(display)){
                setChildIndex(frame, numChildren - 1);
                frame.showLetter(letter);
                return true;
            }
        }
        return false;
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        soundButton = new SoundButton(new SoundButtonAsset());
        soundButton.path = "assets/tutorial/sound/letter/";
        addChild(soundButton);
    }
}
}