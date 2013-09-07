package com.topmind.modules.bear.models
{
import com.ysrlin.utils.ArrayUtil;

import flash.filesystem.File;

import org.robotlegs.mvcs.Actor;

public class DataProxy extends Actor
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>DataProxy</code>实例.
     *
     */
    public function DataProxy()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    private var wordList:Array = [];
    //==========================================================================
    //  Properties
    //==========================================================================
    public var wrongCount:int = 0;
    public var rightCount:int = 0;
    
    public function readSoundList():void{
        var file:File = File.applicationDirectory.resolvePath("words");
        for each (var mp3:File in file.getDirectoryListing()){
            if (mp3.name.indexOf("mp3") != -1){
                wordList.push(mp3.name.split(".")[0]);
            }
        }
    }
    
    public function getRandomList(num:int = 3):Array{
        return ArrayUtil.getRandom(wordList, num);
    }
}
}