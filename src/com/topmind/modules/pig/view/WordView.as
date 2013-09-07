package com.topmind.modules.pig.view
{
import assets.pig.WordAsset;

import com.topmind.common.view.ReplaceView;

import flash.display.DisplayObject;
import flash.display.Sprite;

public class WordView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>WordView</code>实例.
     *
     */
    public function WordView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:WordAsset;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    private var _word:String;

    public function get word():String
    {
        return _word;
    }

    public function set word(value:String):void
    {
        _word = value;
        asset.txWord.text = value.toLowerCase();
    }

    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as WordAsset;
    }
    
}
}