package com.topmind.modules.pig.view
{
import com.topmind.common.view.ReplaceView;
import com.topmind.common.view.SoundButton;

public class SoundControl
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SoundControl</code>实例.
     *
     */
    public function SoundControl(...displays)
    {
        soundButtons = ReplaceView.MutilReplace(SoundButton, displays);
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var soundButtons:Array;
    
    private var _enable:Boolean;

    public function get enable():Boolean
    {
        return _enable;
    }

    public function set enable(value:Boolean):void
    {
        _enable = value;
        for each (var button:SoundButton in soundButtons){
            button.mouseEnabled = _enable;
        }
    }

    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function setWords(value:Array):void{
        for (var i:int = 0; i < 3; i++){
            SoundButton(soundButtons[i]).word = value[i];
        }
    }
    
    
}
}