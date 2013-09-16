package com.topmind.modules.lesson.view.pages
{
import assets.lesson.EggAsset;

import com.greensock.TweenLite;
import com.ysrlin.ui.utils.DisplayUtil;

import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.MouseEvent;
import flash.utils.setTimeout;

public class EggPage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>EggPage</code>实例.
     *
     */
    public function EggPage()
    {
        super();
        sound = "egg";
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:EggAsset;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new EggAsset();
        addChild(asset);
        parseChild(asset);
        setTimeout(replay, 100);
    }
    
//    override public function replay():void{
//        btnLetter.visible = false;
//        movieLetter.visible = false;
//        movieLetter.stop();
//        movie.gotoAndPlay(1);
////        introduce();
//    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
//    private function btnLetter_clickHandler(event:MouseEvent):void{
//        DisplayUtil.removeClickState(btnLetter);
//        movieLetter.visible = true;
//        btnLetter.mouseEnabled = false;
//        frameLine.addFrame(movieLetter.gotoAndPlay, 2, 2);
//        frameLine.addFrame(speakEnd, movieLetter.totalFrames + 2);
//        speak();
//    }
}
}