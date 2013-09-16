package com.topmind.modules.lesson
{
import com.topmind.core.BaseModule;
import com.topmind.modules.lesson.view.PageContainerView;
import com.topmind.modules.lesson.view.pages.BaseLessonPage;

import flash.events.Event;

public class LessonModule extends BaseModule
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessonModule</code>实例.
     *
     */
    public function LessonModule()
    {
        super();
        contextClass = LessonModuleContext;
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var currentPage:BaseLessonPage;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initDisplay():void{
        addChild(new PageContainerView());
    }
    
    public function showLessonPage(page:BaseLessonPage):void{
        if (currentPage){
            removeChild(currentPage);
        }
        currentPage = page;
        addChild(page);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function currentPage_completeHandler(evnet:Event):void{
        
    }
    
}
}