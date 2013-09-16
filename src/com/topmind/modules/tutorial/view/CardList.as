package com.topmind.modules.tutorial.view
{
import assets.tutorial.CardAsset;

import com.topmind.common.view.ReplaceView;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipTab;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;

public class CardList extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>CardList</code>实例.
     *
     */
    public function CardList()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:Sprite;
    private var cards:Array;
    private var tab:MovieClipTab;
    
    public var pt:Point;
    public var letter:String;
    
    //----------------------------------
    //  letters
    //----------------------------------
    
    private var _letters:Array = null;

    public function get letters():Array
    {
        return _letters;
    }

    public function set letters(value:Array):void
    {
        _letters = value;
        syncLetter();
    }
    
    public function get selectLetter():String{
        return LetterCard(tab.selectItem).letter;
    }
    

    public function get trriger():String
    {
        return tab.trriger;
    }

    public function set trriger(value:String):void
    {
        tab.trriger = value;
    }

    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as Sprite;
        cards = ReplaceView.MutilReplace(LetterCard, DisplayUtil.getChildren(asset, CardAsset));
        tab = new MovieClipTab(asset, false, false);
        tab.addEventListener(Event.SELECT, tab_selectHandler);
        tab.reSelect = true;
        syncLetter();
    }
    
    private function syncLetter():void{
        if (cards == null || letters == null) return;
        for (var i:int = 0; i < 6; i++){
            LetterCard(cards[i]).letter = letters[i];
        }
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        pt = tab.selectItem.localToGlobal(new Point());
        dispatchEvent(event.clone());
    }
}
}