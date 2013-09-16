package com.topmind.modules.tutorial.view
{
import flash.display.MovieClip;
import flash.display.Sprite;

public class MovieTask extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>MovieQueue</code>实例.
     *
     */
    public function MovieTask()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var movie:MovieClip;
    private var movieList:Array;
    private var index:int = 0;
    //==========================================================================
    //  Properties
    //==========================================================================
    /**
     * function onNewMovie(mc:MovieClip):void;
     */    
    public var newMovie:Function;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function showMovie(...cls):void{
        movieList = cls;
        index = 0;
        checkMovie();
    }
    
    private function checkMovie():void{
        if (index < movieList.length){
            if (movie){
                movie.stop();
                removeChild(movie);
            }
            movie = new movieList[index]();
            addChild(movie);
            movie.addFrameScript(movie.totalFrames - 1, checkMovie);
            index++;
            newMovie && newMovie(movie);
        }
        else{
            movie.stop();
        }
    }
}
}