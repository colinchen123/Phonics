package com.topmind.modules.lesson.view.pages
{
import assets.lesson.PenAsset;

public class PenPage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PenPage</code>实例.
     *
     */
    public function PenPage()
    {
        super();
        sound = "pen";
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:PenAsset;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new PenAsset();
        addChild(asset);
        parseChild(asset);
        frameLine.addFrame(replay, 3);
    }
//    
//    override public function replay():void{
//        asset.pen.gotoAndPlay(1);
//        speak();
//    }
}
}