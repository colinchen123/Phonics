package com.topmind.modules.tutorial.view
{
import assets.tutorial.RecrodAsset;

import com.ysrlin.ui.core.Component;

import flash.geom.Point;

public class BaseTutorialPage extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BaseTutorialPage</code>实例.
     *
     */
    public function BaseTutorialPage()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var recordView:RecordView;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    public var letterCard:LetterCard;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function showLetterAt(pt:Point, letter:String):void{
    }
    
    protected function createRecorder():void{
        var asset:RecrodAsset = new RecrodAsset();
        asset.x = 253;
        asset.y = 140;
        addChild(asset);
        recordView = new RecordView();
        recordView.replace(asset);
    }
    
    override public function dispose():void{
        super.dispose();
        if (recordView){
            recordView.dispose();
            recordView = null;
        }
    }
}
}