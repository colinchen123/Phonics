package com.topmind.modules.lesson.view.pages
{
import assets.lesson.IntroAsset;

import com.greensock.TweenLite;
import com.topmind.core.AppConfig;
import com.topmind.managers.SoundManager;
import com.ysrlin.ui.utils.DisplayUtil;

import flash.events.MouseEvent;

public class IntroPage extends BaseLessonPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>IntroPage</code>实例.
     *
     */
    public function IntroPage()
    {
        super();
        sound = "e";
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:IntroAsset;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new IntroAsset();
        addChild(asset);
//        asset.robot.addEventListener(MouseEvent.CLICK, robot_clickHandler);
//        asset.robot.mouseChildren =false;
        parseChild(asset);
        frameLine.addFrame(replay, 3);
//        movie.addFrameScript(movie.totalFrames - 1, movie.stop);
//        DisplayUtil.stopAllChild(asset);
    }
//    
    override public function replay():void{
        btnLetter.visible = false;
        movieLetter.visible = false;
        movieLetter.stop();
        movie.gotoAndPlay(1);
        introduce();
//        var channel:SoundChannel = movieSound();
//        super.replay();
//        movie.alpha = 1;
//        frameLine.addFrame(movieEnd, 50);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    override protected function btnLetter_clickHandler(event:MouseEvent):void{
        super.btnLetter_clickHandler(event);
        TweenLite.to(movie, 1, {alpha:0});
    }
    
//    private function robot_clickHandler(event:MouseEvent):void{
//        TweenLite.to(asset.robot, 1, {alpha:0});
//        asset.letter.gotoAndPlay(1);
//        asset.letter.visible = true;
//        asset.robot.mouseEnabled = false;
//        speak();
//    }
}
}