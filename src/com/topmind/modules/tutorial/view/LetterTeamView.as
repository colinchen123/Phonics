package com.topmind.modules.tutorial.view
{
public class LetterTeamView extends BaseTutorialPage
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>TwoLetterTeamView</code>实例.
     *
     */
    public function LetterTeamView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var letters:Array;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function createTeams(letters:Array, count:int):void{
        this.letters = letters;
        count == 2 ? initTwoTeam() : initThreeTeam();
    }
    
    private function initTwoTeam():void{
        for (var i:int = 0; i < 6; i++){
            var team:LetterTeam = new LetterTeam();
            createTeam((i % 3) * 260 + 210, int(i / 3) * 200 + 180, letters[i]);
        }
    }
    
    private function createTeam(tX:int ,tY:int, letter:String):void{
        var team:LetterTeam = new LetterTeam();
        team.creatTeam(letter);
        team.x = tX;
        team.y = tY;
        team.scaleX = team.scaleY = 0.5;
        addChild(team);
        team.wait();
    }
    
    private function initThreeTeam():void{
        for (var i:int = 0; i < 4; i++){
            var team:LetterTeam = new LetterTeam();
            createTeam((i % 2) * 400 + 220, int(i / 2) * 200 + 180, letters[i]);
        }
    }
}
}