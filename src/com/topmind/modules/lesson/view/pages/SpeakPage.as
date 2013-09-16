package com.topmind.modules.lesson.view.pages
{
import assets.lesson.SpeakAsset;

public class SpeakPage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SpeakPage</code>实例.
     *
     */
    public function SpeakPage()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:SpeakAsset;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new SpeakAsset();
        addChild(asset);
    }
}
}