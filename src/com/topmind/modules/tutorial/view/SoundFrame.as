package com.topmind.modules.tutorial.view
{
import assets.tutorial.LetterFrameAsset;
import assets.tutorial.SoundButtonAsset;

import com.topmind.common.view.SoundButton;
import com.ysrlin.ui.core.Component;

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
    
    private var letterFrame:LetterFrameAsset;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        soundButton = new SoundButton(new SoundButtonAsset());
        addChild(soundButton);
        letterFrame = new LetterFrameAsset();
        letterFrame.x = 150;
        addChild(letterFrame);
    }
}
}