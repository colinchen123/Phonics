package com.topmind.modules.tutorial.view
{
import com.greensock.TweenLite;

import flash.events.MouseEvent;
import flash.utils.setTimeout;

public class ShowThreeLetterView extends BaseTutorialPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShowTwoLetterView</code>实例.
     *
     */
    public function ShowThreeLetterView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    
    private var letterRight:LetterRobotView;
    private var letterLeft:LetterRobotView;
    private var letterCenter:LetterRobotView;
    private var team:LetterTeam;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        createRecorder();
        letterRight = new LetterRobotView();
        letterRight.letter = "t";
        letterRight.x = 740;
        letterRight.wait();
        addChild(letterRight);
        
        letterLeft = new LetterRobotView();
        letterLeft.letter = "s";
        letterLeft.x = 200;
        letterLeft.wait();
        addChild(letterLeft);
        
        letterCenter = new LetterRobotView();
        letterCenter.letter = "a";
        letterCenter.x = 470;
        letterCenter.wait();
        addChild(letterCenter);
        
        letterRight.y = letterLeft.y = letterCenter.y = 240;
        letterLeft.addEventListener(MouseEvent.CLICK, letterS_clickHandler, false, int.MAX_VALUE);
        letterLeft.mouseEnabled = true;
    }
    
    private function together():void{
        letterRight.walk();
        letterLeft.walk();
        TweenLite.to(letterRight, 0.5, {x:690, onComplete:walkEnd});
        TweenLite.to(letterLeft, 0.5, {x:250});
        if (team == null){
            team = new LetterTeam();
            addChild(team);
            team.x = 250;
            team.y = letterRight.y;
            team.creatTeam("sat");
            team.visible = false;
        }
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function letterS_clickHandler(event:MouseEvent):void{
        event.stopImmediatePropagation();
        letterLeft.mouseEnabled = false;
        letterLeft.jump(true);
        setTimeout(letterCenter.jump, 1500, true);
        setTimeout(letterRight.jump, 3000, true);
        setTimeout(together, 4500);
    }
    
    private function walkEnd():void{
        team.wait();
        team.visible = true;
        letterRight.visible = letterLeft.visible = letterCenter.visible = false;
        team.shoutOneBytOne();
    }
}
}