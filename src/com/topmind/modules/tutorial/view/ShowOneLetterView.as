package com.topmind.modules.tutorial.view
{
import com.greensock.TweenLite;
import com.greensock.easing.Bounce;
import com.greensock.easing.Linear;

import flash.geom.Point;

public class ShowOneLetterView extends BaseTutorialPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShowOneLetterView</code>实例.
     *
     */
    public function ShowOneLetterView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var letterRobot:LetterRobotView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        letterRobot = new LetterRobotView();
        addChild(letterRobot);
        createRecorder();
    }
    
    override public function showLetterAt(pt:Point, letter:String):void{
        letterRobot.removeRobot();
        letterCard.letter = letter;
        letterRobot.letter = letter;
        letterCard.reSet();
        letterRobot.x = letterCard.x;
        letterRobot.y = letterCard.y;
        TweenLite.killTweensOf(letterCard);
        TweenLite.from(letterCard, 1, {y:pt.y,ease:Bounce.easeOut,overwrite:0, onComplete:jumpend});
        TweenLite.from(letterCard, 0.5, {scaleX:1, scaleY:1, x:pt.x, overwrite:0 , ease:Linear.easeNone});
        letterCard.visible = true;
    }
    
    private function jumpend():void{
        letterCard.visible = false;
        letterRobot.beRobot();
        letterRobot.showMe();
    }
}
}