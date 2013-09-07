package com.topmind.modules.tutorial.view
{
import assets.tutorial.BeLetterRobotAsset;
import assets.tutorial.LetterRobotoGoodAsset;

import com.topmind.core.AppConfig;
import com.ysrlin.ui.utils.MovieClipHandler;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;

public class LetterRobotView extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LetterRobotView</code>实例.
     *
     */
    public function LetterRobotView()
    {
        super();
        movieHandler = new MovieClipHandler();
        mouseChildren = mouseEnabled = false;
        addEventListener(MouseEvent.CLICK, clickHandler);
    }
    
    //==========================================================================
    //  Properties
    //==========================================================================
    private var robot:MovieClip;
    private var movieHandler:MovieClipHandler;
    
    public var letter:String="";
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function beRobot():void{
        removeRobot();
        showRobot(BeLetterRobotAsset);
        movieHandler.addEndHandler(robot, jump);
    }
    
    public function removeRobot():void{
        mouseEnabled = false;
        if (robot){
            movieHandler.removeAllHandlerOf(robot);
            robot.stop();
            removeChild(robot);
            robot = null;
        }
    }
    
    public function jump():void{
        if (robot is LetterRobotoGoodAsset){
            robot.gotoAndPlay(1);
        }else{
            showRobot(LetterRobotoGoodAsset);
        }
        movieHandler.addEndHandler(robot, stopRobot);
        movieHandler.addFrameHandler(robot, robot.totalFrames - 20, soundLetter);
    }
    
    private function showRobot(claxx:Class):void{
        removeRobot();
        robot = new claxx() as MovieClip;
        addChild(robot);
        robot["letter"]["tx"].text = letter;
    }
    
    private function stopRobot():void{
        robot.stop();
//        soundLetter();
        mouseEnabled = true;
    }
    
    private function soundLetter():void{
        AppConfig.soundManager.playSound("assets/tutorial/sound/letter/" + letter.toLocaleUpperCase() + ".mp3");
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function clickHandler(event:MouseEvent):void{
        mouseEnabled = false;
        jump();
    }
}
}