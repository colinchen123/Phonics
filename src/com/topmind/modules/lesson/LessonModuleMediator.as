package com.topmind.modules.lesson
{
import com.topmind.core.BaseModule;
import com.topmind.modules.bear.BearModule;
import com.topmind.modules.lesson.view.pages.IntroPage;
import com.topmind.modules.pig.PigModule;
import com.topmind.modules.tutorial.TutorialModule;

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
        view.start();
//        view.showLessonPage(new IntroPage());
        addContextListener(LessonEvent.SHOW_GAME_OPTION, showGameOptionHandler);
        addContextListener(LessonEvent.SELECTED_GAME, selectedGameHandler);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function showGameOptionHandler(event:LessonEvent):void{
        view.selectGame();
    }
    
    private function selectedGameHandler(event:LessonEvent):void{
        var game:BaseModule;
        if (event.data == "lesson"){
            view.showLessons();
            return;
        }else if (event.data == "bear"){
            game = new BearModule();
        }else if (event.data == "pig"){
            game = new PigModule();
        }else if (event.data == "lesson"){
            game = new LessonModule();
        }else{
            var tutorial:TutorialModule = new TutorialModule();
            if (event.data == "tutorial"){
                tutorial.count = 1;
            }else if (event.data == "tutorial1"){
                tutorial.count = 2;
                tutorial.words = ["as",'ap', 'at','ca','na','pa'];
            }else{
                tutorial.count = 3;
                tutorial.words = ["act",'ans', 'anc','aps','apt','acs'];
            }
            game = tutorial;
        }
        view.showGame(game);
    }
}
}