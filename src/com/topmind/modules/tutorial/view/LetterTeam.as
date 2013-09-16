package com.topmind.modules.tutorial.view
{
import com.topmind.core.AppConfig;
import com.ysrlin.ui.core.Component;

import flash.events.MouseEvent;
import flash.utils.setTimeout;

public class LetterTeam extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LetterTeam</code>实例.
     *
     */
    public function LetterTeam()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var letters:String;
    private var robots:Vector.<LetterRobotView> = new Vector.<LetterRobotView>();
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function creatTeam(letters:String):void{
        this.letters = letters;
        for (var i:int = 0; i < letters.length; i++){
            var robot:LetterRobotView = new LetterRobotView();
            robot.x = i * 220;
            robot.letter = letters.charAt(i);
            addChild(robot);
            robots.push(robot);
        }
        mouseChildren = false;
        addEventListener(MouseEvent.CLICK, clickHandler);
    }
    
    public function shoutOneBytOne():void{
        var gap:int = 400;
        for (var i:int = 0; i < robots.length; i++){
            setTimeout(robots[i].shoutJump, i * gap);
        }
        setTimeout(hand, i * gap + 500);
        setTimeout(shoutTogether, i * gap + 500);
        setTimeout(wait, i * gap + 1000);
    }
    
    public function shoutTogether():void{
        AppConfig.soundManager.playSound("words/" + letters.toUpperCase() + ".mp3");
    }
    
    public function hand():void{
        for (var i:int = 0; i < robots.length; i++){
            robots[i].hand();
        }
    }
    
    public function wait():void{
        for each (var robot:LetterRobotView in robots){
            robot.wait();
        }
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function clickHandler(event:MouseEvent):void{
        shoutOneBytOne();
    }
}
}