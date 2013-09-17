package com.topmind.modules.lesson.view
{
import com.topmind.modules.lesson.LessonEvent;
import com.ysrlin.ui.components.Navigation;
import com.ysrlin.ui.core.Component;
import com.ysrlin.utils.MathUtil;

import flash.display.Loader;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.net.URLRequest;
import flash.utils.setTimeout;

import org.gestouch.events.GestureEvent;
import org.gestouch.gestures.PanGesture;

public class LessonMapView extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessonMapView</code>实例.
     *
     */
    public function LessonMapView()
    {
        autoMark = true;
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var navigtor:Navigation;
    private var units:Array = [];
    private var loader:Loader;
    private var container:Sprite;
    private var panGesture:PanGesture;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        addChild(container = new Sprite());
        loader = new Loader();
        loader.scaleX = loader.scaleY = 0.5;
        container.addChild(loader);
        loader.load(new URLRequest("assets/lesson/img/back.jpg"));
        createTrees();
        loader.mouseChildren = loader.mouseEnabled = false;
        container.mouseEnabled = false;
        
        panGesture = new PanGesture(this);
        panGesture.addEventListener(GestureEvent.GESTURE_CHANGED, panGesure_gestureChangedHandler);
        panGesture.addEventListener(GestureEvent.GESTURE_BEGAN, panGesture_gestureBeganHandler);
        panGesture.addEventListener(GestureEvent.GESTURE_ENDED, panGesture_gestureEndedHandler);
        container.addEventListener(MouseEvent.CLICK, tree_clickHandler);
    }
    
    private function createTrees():void{
        var pages:Array = ["13", "14", "15", "16", "20", "21", "22", "3", "33", "37", "38"];
        for (var i:int = pages.length - 1; i >= 0; i--){
            var tree:Loader = new Loader();
            tree.scaleX = tree.scaleY = 0.5;
            tree.y = MathUtil.random(200, 100);
            tree.x = i * 400;
            tree.load(new URLRequest("assets/lesson/img/unit_"+pages[i]+".png"));
            container.addChild(tree);
        }
    }
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function panGesure_gestureChangedHandler(event:GestureEvent):void{
        var nextX:int = container.x + panGesture.offsetX;
        if (nextX > 0){
            nextX = 0;
        }else if (nextX < 1024 - loader.width){
            nextX = 1024 - loader.width;
        }
        container.x = nextX;
    }
    
    private function panGesture_gestureEndedHandler(event:GestureEvent):void{
        setTimeout(container.addEventListener, 50, MouseEvent.CLICK, tree_clickHandler);
    }
    
    private function panGesture_gestureBeganHandler(event:GestureEvent):void{
        container.removeEventListener(MouseEvent.CLICK, tree_clickHandler);
    }
    
    private function tree_clickHandler(event:MouseEvent):void{
        dispatchEvent(new LessonEvent(LessonEvent.SHOW_GAME_OPTION));
    }
}
}