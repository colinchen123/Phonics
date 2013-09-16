package com.topmind.modules.lesson.view.pages
{
import assets.lesson.NetAsset;

public class NetPage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>NetPage</code>实例.
     *
     */
    public function NetPage()
    {
        super();
        sound = "net";
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:NetAsset;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new NetAsset();
        addChild(asset);
        parseChild(asset);
        frameLine.addFrame(replay, 3);
    }
}
}