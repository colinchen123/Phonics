package com.topmind.modules.bear.views
{
import bear.StoneAsset;

import com.ysrlin.ui.utils.MovieClipTab;

import flash.display.Sprite;
import flash.events.Event;

[Event(name="select", type="flash.events.Event")]
public class StoneList extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>StoneList</code>实例.
     *
     */
    public function StoneList()
    {
        initDisplay();
    }
    
    private var tab:MovieClipTab;
    
    private var _selected:String;
    public function get selected():String{
        return _selected;
    }
    
    private function initDisplay():void{
        for (var i:int = 0; i < 3; i++){
            var stone:StoneAsset = new StoneAsset();
            stone.y = 150 * i;
            stone.name = "stone"+i;
            addChild(stone);
        }
        tab = new MovieClipTab(this, false, false);
        tab.reSelect = true;
        tab.addEventListener(Event.SELECT, tab_selectHandler);
        mouseEnabled = mouseChildren = false;
    }
    
    public function setWords(arr:Array):void{
        for (var i:int = 0; i < 3; i++){
            StoneAsset(getChildAt(i)).txWord.text = String(arr[i]).toLocaleLowerCase();
        }
        mouseChildren = true;
    }
    
    private function tab_selectHandler(event:Event):void{
        if (tab.selected == null) return;
        mouseChildren = false;
        var stone:StoneAsset = getChildByName(tab.selected) as StoneAsset;
        _selected = stone.txWord.text.toLocaleUpperCase();
        dispatchEvent(event.clone());
    }
}
}