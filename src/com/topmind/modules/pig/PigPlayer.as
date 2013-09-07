package com.topmind.modules.pig
{
import assets.pig.AvatarCatAsset;
import assets.pig.AvatarTigerAsset;

import com.topmind.AvatarType;
import com.ysrlin.ui.utils.DisplayUtil;

import flash.display.Sprite;

public class PigPlayer extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigPlayer</code>实例.
     *
     */
    public function PigPlayer()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var container:Sprite;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function initWith(type:String):void{
        if (type == AvatarType.CAT){
            container = new AvatarCatAsset();
        }else{
            container = new AvatarTigerAsset();
        }
        DisplayUtil.stopAllChild(container);
    }
    
    public function right():void{
        
    }
    
    public function wrong():void{
        
    }
    
    public function wait():void{
        
    }
}
}