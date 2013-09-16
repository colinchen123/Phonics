package com.topmind.modules.lesson.controller
{
import com.topmind.modules.lesson.LessonModule;
import com.topmind.modules.lesson.LessonModuleMediator;
import com.topmind.modules.lesson.view.PageContainerView;
import com.topmind.modules.lesson.view.PageContainerViewMdiator;

import org.robotlegs.utilities.modular.mvcs.ModuleCommand;

public class LessonStartupCommand extends ModuleCommand
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessonStartupCommand</code>实例.
     *
     */
    public function LessonStartupCommand()
    {
        super();
    }
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function execute():void{
        mediatorMap.mapView(LessonModule, LessonModuleMediator);
        mediatorMap.mapView(PageContainerView, PageContainerViewMdiator);
        
        mediatorMap.createMediator(contextView);
    }
}
}