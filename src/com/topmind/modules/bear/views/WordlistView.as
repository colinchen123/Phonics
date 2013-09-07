package com.topmind.modules.bear.views
{
import assets.bear.WordListAsset;

import com.ysrlin.ui.utils.MovieClipHandler;
import com.ysrlin.ui.utils.MovieClipTab;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.Event;
import flash.text.TextField;
import com.topmind.common.view.ReplaceView;

public class WordlistView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>WordlistView</code>实例.
     *
     */
    public function WordlistView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var current:String;
    private var asset:WordListAsset;
    private var tab:MovieClipTab;
    private var movieClipseHandler:MovieClipHandler;
    //==========================================================================
    //  Properties
    //==========================================================================
    
    private var _selected:String;
    public function get selected():String{
        return _selected;
    }
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as WordListAsset;
        tab = new MovieClipTab(asset.buttons, false, false);
        hide(asset.cross);
        hide(asset.star1);
        hide(asset.star2);
        
        tab.reSelect = true;
        tab.addEventListener(Event.SELECT, tab_selectHandler);
        movieClipseHandler = new MovieClipHandler();
    }
    
    public function setWords(arr:Array, current:String = ""):void{
        for (var i:int = 0; i < 3; i++){
            asset["tx"+i].text = String(arr[i]).toLocaleLowerCase();
            asset["tx"+i].mouseEnabled = false;
        }
        mouseChildren = true;
        this.current = current;
    }
    
    private function hide(mc:MovieClip):void{
        mc.stop();
        mc.mouseChildren = mc.mouseEnabled = false;
        mc.visible = false;
    }
    
    private function playMc(mc:MovieClip):void{
        mc.visible = true;
        mc.gotoAndPlay(2);
        movieClipseHandler.addEndHandler(mc,function():void{
            hide(mc);
        });
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        if (tab.selected == null) return;
        mouseChildren = false;
        var tx:TextField = asset[tab.selected] as TextField;
        _selected = tx.text.toLocaleUpperCase();
        if (_selected == current){
            asset.star1.y = tx.y - 10;
            asset.star2.y = tx.y - 10;
            playMc(asset.star1);
            playMc(asset.star2);
        }else{
//            asset.cross.x = tx.x;
            asset.cross.y = tx.y - 15;
            playMc(asset.cross);
        }
        trace("tab_select",current, _selected);
        dispatchEvent(event.clone());
    }
}
}