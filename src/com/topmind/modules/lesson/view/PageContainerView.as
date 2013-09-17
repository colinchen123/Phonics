package com.topmind.modules.lesson.view
{
import assets.lesson.PageContainerAsset;

import com.greensock.TweenLite;
import com.topmind.modules.lesson.view.pages.BaseLessonPage;
import com.ysrlin.ui.components.Navigation;
import com.ysrlin.ui.core.Component;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class PageContainerView extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PageConatinerView</code>实例.
     *
     */
    public function PageContainerView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var currentPage:BaseLessonPage;
    private var listPage:Array;
    private var pageIndex:int = 0;
    private var navigtor:Navigation = new Navigation();
    
    private var asset:PageContainerAsset;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new PageContainerAsset();
        addChild(asset);
        asset.btnNext.addEventListener(MouseEvent.CLICK, btnNext_clickHandler);
        asset.btnReplay.addEventListener(MouseEvent.CLICK, btnReplay_clickHandler);
        navigtor = new Navigation();
        navigtor.setSize(1024, 768);
        addChildAt(navigtor, 0);
    }
    public function setPages(array:Array):void{
        listPage = array;
    }
    
    public function showPageAt(index:int):void{
//        if (currentPage){
//            currentPage.end();
//            currentPage.removeEventListener(Event.COMPLETE, currentPage_completeHandler);
//            TweenLite.to(currentPage, 0.5, {alpha:0, onComplete:timeOut, onCompleteParams:[currentPage]});
//        }
        currentPage = new listPage[index]() as BaseLessonPage;
        navigtor.showScreen(currentPage);
        currentPage.addEventListener(Event.COMPLETE, currentPage_completeHandler);
//        addChildAt(currentPage, 0);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function currentPage_completeHandler(event:Event):void{
        if (++pageIndex >= listPage.length){
            pageIndex = 0;
        }
        showPageAt(pageIndex);
    }
    
    private function btnReplay_clickHandler(event:MouseEvent):void{
        currentPage.replay();
    }
    
    private function timeOut(page:BaseLessonPage):void{
        removeChild(page);
        page.dispose();
    }
    
    private function btnNext_clickHandler(event:MouseEvent):void{
        currentPage_completeHandler(null);
    }
}
}