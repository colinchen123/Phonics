package com.topmind.modules.pig.view
{
import assets.pig.BedStep1Asset;
import assets.pig.BedStep3Asset;
import assets.pig.BedStep4Asset;

import com.topmind.common.view.ReplaceView;

import flash.display.DisplayObject;
import flash.display.MovieClip;

public class BedView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BedView</code>实例.
     *
     */
    public function BedView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var bed:MovieClip;
    
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        removeChild(display);
        setState();
    }
    
    public function replay():void{
        if (bed) bed.gotoAndPlay(1);
    }
    
    public function setState(index:int =1):void{
        if (bed){
            removeChild(bed);
            bed = null;
        }
        if (index == 1){
            bed = new BedStep1Asset();
        }else if (index == 3){
            bed = new BedStep3Asset();
        }else if (index == 4){
            bed = new BedStep4Asset();
        }
        addChild(bed);
    }
}
}