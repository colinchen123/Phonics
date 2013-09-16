package com.topmind.modules.lesson.view.pages
{
import assets.lesson.TentAsset;

import flash.utils.setTimeout;

public class TentPage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>TentPage</code>实例.
     *
     */
    public function TentPage()
    {
        super();
        sound = "tent";
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:TentAsset;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new TentAsset();
        addChild(asset);
        parseChild(asset);
        setTimeout(replay, 100);
    }
}
}