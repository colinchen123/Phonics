package com.topmind.modules.lesson
{
import com.topmind.modules.lesson.view.pages.IntroPage;

import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

public class LessonModuleMediator extends ModuleMediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessonModuleMediator</code>实例.
     *
     */
    public function LessonModuleMediator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:LessonModule;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
//        view.showLessonPage(new IntroPage());
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}