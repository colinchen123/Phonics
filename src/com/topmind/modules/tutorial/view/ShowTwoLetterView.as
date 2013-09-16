package com.topmind.modules.tutorial.view
{
import com.greensock.TweenLite;
import com.ysrlin.ui.utils.EnterFrameHandler;

import flash.events.MouseEvent;
import flash.geom.Point;
import flash.utils.setTimeout;

public class ShowTwoLetterView extends BaseTutorialPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShowTwoLetterView</code>实例.
     *
     */
    public function ShowTwoLetterView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var letterA:LetterRobotView;
    private var letterS:LetterRobotView;
    private var team:LetterTeam;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        createRecorder();
        letterA = new LetterRobotView();
        letterA.letter = "a";
        letterA.x = 700;
        letterA.wait();
        addChild(letterA);
        letterS = new LetterRobotView();
        letterS.letter = "s";
        letterS.x = 220;
        letterS.wait();
        addChild(letterS);
        letterA.y = letterS.y = 240;
        letterS.addEventListener(MouseEvent.CLICK, letterS_clickHandler, false, int.MAX_VALUE);
        letterS.mouseEnabled = true;
    }
    
    private function showTogether():void{
        letterA.walk();
        letterS.walk();
        TweenLite.to(letterA, 2, {x:580, onComplete:walkEnd});
        TweenLite.to(letterS, 2, {x:360});
        if (team == null){
            team = new LetterTeam();
            addChild(team);
            team.x = 360;
            team.y = letterA.y;
            team.creatTeam("sa");
            team.visible = false;
        }
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function letterS_clickHandler(event:MouseEvent):void{
        event.stopImmediatePropagation();
        letterS.mouseEnabled = false;
        letterS.jump(true);
        setTimeout(letterA.jump, 1500, true);
        setTimeout(showTogether, 3000);
    }
    
    private function walkEnd():void{
        team.wait();
        team.visible = true;
        letterA.visible = letterS.visible = false;
        team.shoutOneBytOne();
    }
}
}