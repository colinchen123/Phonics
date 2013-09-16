package com.topmind.modules.tutorial.view
{
import assets.tutorial.LeftGoodAsset;
import assets.tutorial.LetterFrameAsset;
import assets.tutorial.RunAwayAsset;

import com.ysrlin.ui.core.Component;

import flash.display.MovieClip;

public class LetterFrame extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LetterFrame</code>实例.
     *
     */
    public function LetterFrame()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:LetterFrameAsset;
    private var movieTask:MovieTask;
    private var current:String;
    public var isRight:Boolean = false;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public var letter:String;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new LetterFrameAsset();
        addChild(asset);
    }
    
    public function showLetter(value:String):void{
        current = value.toLowerCase();
        if (movieTask == null){
            movieTask = new MovieTask();
            addChild(movieTask);
            movieTask.scaleX = movieTask.scaleY = 0.4;
            movieTask.x = - 10;
            movieTask.y = - 5;
            movieTask.newMovie = newMovieHandler;
        }
        isRight = value.toLowerCase() == letter.toLowerCase();
        if(isRight){
            movieTask.showMovie(LeftGoodAsset);
        }else{
            movieTask.showMovie(RunAwayAsset);
        }
    }
    
    private function newMovieHandler(mc:MovieClip):void{
        mc.letter.tx.text = current;
    }
}
}