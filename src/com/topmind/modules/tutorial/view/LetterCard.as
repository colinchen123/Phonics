package com.topmind.modules.tutorial.view
{
import assets.tutorial.CardAsset;

import com.topmind.common.view.ReplaceView;

import flash.display.DisplayObject;
import flash.geom.Point;

public class LetterCard extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LetterCard</code>实例.
     *
     */
    public function LetterCard()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:CardAsset;
    private var recordData:Object = {};
    
    public function get letter():String
    {
        return asset.tx.text;
    }

    public function set letter(value:String):void
    {
        asset.tx.text = value;
    }

    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as CardAsset;
        this.name = asset.name;
        this.scaleX = display.scaleX;
        this.scaleY = display.scaleY;
        display.scaleX = display.scaleY = 1;
    }
    
    public function syncStage(pt:Point):void{
        if (parent){
            pt = parent.globalToLocal(pt);
            x = int(pt.x);
            y = int(pt.y);
        }
    }
    
    public function hideShadow():void{
        asset.shadow.visible = false;
    }
    
    public function record():void{
        recordData.scale = scaleX;
        recordData.x = x;
        recordData.y = y;
    }
    
    public function littleView():void{
        scaleX = scaleY = 1;
    }
    
    public function reSet():void{
        scaleX = scaleY = recordData.scale;
        x = recordData.x;
        y = recordData.y;
    }
}
}