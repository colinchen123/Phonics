package com.topmind.modules.map
{
import assets.map.MapAsset;

import com.topmind.common.events.PhonicsEvent;
import com.topmind.core.BaseModule;
import com.ysrlin.ui.utils.MovieClipTab;

import flash.events.Event;

public class MapModule extends BaseModule
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>MapModule</code>实例.
     *
     */
    public function MapModule()
    {
        super();
        contextClass = MapModuleContext;
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:MapAsset;
    private var tab:MovieClipTab;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initDisplay():void{
        asset = new MapAsset();
        tab = new MovieClipTab(asset.buttons, false, false);
        tab.reSelect = true;
        addChild(asset);
        tab.addEventListener(Event.SELECT, tab_selectHandler);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        dispatchEvent(new PhonicsEvent(PhonicsEvent.SELECT_MAP, tab.selected));
    }
}
}