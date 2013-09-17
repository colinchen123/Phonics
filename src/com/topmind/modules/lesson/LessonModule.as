package com.topmind.modules.lesson
{
import com.topmind.core.BaseModule;
import com.topmind.modules.lesson.view.GameOptionView;
import com.topmind.modules.lesson.view.LessonMapView;
import com.topmind.modules.lesson.view.PageContainerView;
import com.topmind.modules.lesson.view.pages.BaseLessonPage;
import com.ysrlin.ui.components.Navigation;

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
    private var navigtor:Navigation;
    private var currentGame:BaseModule;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
//        addChild(new PageContainerView());
        navigtor = new Navigation();
        navigtor.setSize(1024, 768);
        addChild(navigtor);
    }
    
    public function start():void{
        navigtor.showScreen(new LessonMapView());
//        addChild(new LessonMapView());
    }
    
    public function selectGame():void{
        navigtor.showScreen(new GameOptionView());
    }
    
    public function showGame(game:BaseModule):void{
        currentGame = game;
        navigtor.showScreen(game);
    }
    
    public function showLessons():void{
        navigtor.showScreen(new PageContainerView());
    }
    
    override public function dispose():void{
        super.dispose();
        currentGame && currentGame.dispose();
    }
    
    
//    public function showLessonPage(page:BaseLessonPage):void{
//        if (currentPage){
//            removeChild(currentPage);
//        }
//        currentPage = page;
//        addChild(page);
//    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function currentPage_completeHandler(evnet:Event):void{
        
    }
    
}
}