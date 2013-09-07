package com.topmind.modules.tutorial.view
{
import assets.tutorial.RecrodAsset;

import com.topmind.common.Recorder;
import com.topmind.common.view.ReplaceView;

import flash.display.DisplayObject;
import flash.events.MouseEvent;

public class RecordView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RecordView</code>实例.
     *
     */
    public function RecordView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:RecrodAsset;
    private var recorder:Recorder;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as RecrodAsset;
        
        asset.btnRecord.addEventListener(MouseEvent.CLICK, btnRecordHandler);
        asset.btnReplay.addEventListener(MouseEvent.CLICK, btnReplay_clickHandler);
        recorder = new Recorder();
    }
    
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function btnRecordHandler(event:MouseEvent):void{
        recorder.record();
    }
    
    private function btnReplay_clickHandler(event:MouseEvent):void{
        recorder.stop();
        recorder.replay();
    }
    
}
}

