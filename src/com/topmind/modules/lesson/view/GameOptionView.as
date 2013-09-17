package com.topmind.modules.lesson.view
{
import assets.lesson.LessonGamesAsset;

import com.topmind.modules.lesson.LessonEvent;
import com.ysrlin.ui.core.Component;
import com.ysrlin.ui.utils.MovieClipTab;

import flash.display.DisplayObjectContainer;
import flash.events.Event;

public class GameOptionView extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>GameOptionView</code>实例.
     *
     */
    public function GameOptionView()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:LessonGamesAsset;
    private var tab:MovieClipTab;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new LessonGamesAsset();
        addChild(asset);
        tab = new MovieClipTab(asset.games, false, false);
        tab.addEventListener(Event.SELECT, tab_selectHandler);
        tab.reSelect = true;
        for (var i:int = 0; i < asset.games.numChildren; i++){
            var container:DisplayObjectContainer = asset.games.getChildAt(i) as DisplayObjectContainer;
            container && (container.mouseChildren = false);
        }
    }
    
    override public function dispose():void{
        tab.dispose();
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        var lessonEvent:LessonEvent = new LessonEvent(LessonEvent.SELECTED_GAME);
        lessonEvent.data = tab.selected;
        dispatchEvent(lessonEvent);
    }
}
}