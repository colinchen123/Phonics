package com.topmind.modules.lesson.view.pages
{
import com.topmind.core.AppConfig;
import com.topmind.managers.SoundManager;
import com.ysrlin.ui.core.Component;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.utils.ArrayUtil;
import com.ysrlin.utils.FrameLine;

import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.SoundChannel;

[Event(name="complete", type="flash.events.Event")]
public class BaseLessonPage extends Component
{
    //==========================================================================
    //  Class variables
    //==========================================================================
    static protected var frameLine:FrameLine;
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>LessPage</code>实例.
     *
     */
    public function BaseLessonPage()
    {
        frameLine ||= new FrameLine();
        soundManager = AppConfig.soundManager;
        super();
        soundManager.getSound(soundDir + "e.mp3");
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var soundIndex:int = 0;
//    private var soundOfRight:Array = ["Awesome", "Excellent", "Fantastic", "great", "Legendary","Perfect","very_good","Wonderful"];
    private var soundOfRight:Array = ["good1", "good2", "good3", "good4"];
    
    protected var soundManager:SoundManager;
    
    protected var movieLetter:MovieClip;
    protected var btnLetter:SimpleButton;
    protected var movie:MovieClip;
    
    protected var soundDir:String = "assets/lesson/sound/e/";
    private var _sound:String;

    public function get sound():String
    {
        return _sound;
    }

    public function set sound(value:String):void
    {
        _sound = value;
        soundManager.getSound(soundDir + value + ".mp3");
        soundManager.getSound(soundDir + "introduce_" + value + ".mp3");
        soundManager.getSound(soundDir + "movie_" + value + ".mp3");
    }

    
    //==========================================================================
    //  Methods
    //==========================================================================
    public function end():void{
        soundManager.stopSingleSound();
        frameLine.clear();
    }
    
    protected function parseChild(asset:Object):void{
        movieLetter = asset.movieLetter;
        btnLetter = asset.btnLetter;
        movie = asset.movie;
        btnLetter.addEventListener(MouseEvent.CLICK, btnLetter_clickHandler);
        movie.addFrameScript(movie.totalFrames - 1, movieEnd);
        movie.stop();
    }
    
    protected function finish(...rsets):void{
        dispatchEvent(new Event(Event.COMPLETE));
    }
    
    public function introduce():void{
        soundManager.playSingleSound(soundDir + "introduce_" + sound + ".mp3");
    }
    
    protected function movieSound():SoundChannel{
        return soundManager.playSingleSound(soundDir + "movie_" + sound + ".mp3");
    }
    
    public function replay():void{
        btnLetter.visible = false;
        movieLetter.visible = false;
        movieLetter.stop();
        movie.gotoAndPlay(1);
        var channel:SoundChannel = movieSound();
        channel.addEventListener(Event.SOUND_COMPLETE, function(e:Event):void{
            introduce();
        });
//        movieSound();
//        frameLine.addFrame(introduce, 10);
//        introduce();
    }
    
    protected function speak(url:String = null):void{
//        if (url != null){
//            soundManager.playSingleSound(url);
//        }else{
//            soundManager.playSingleSound("assets/lesson/sound/e/" + sound + ".mp3");
//        }
        soundManager.playSingleSound(soundDir + "e.mp3");
        frameLine.addFrame(soundManager.playSingleSound, 10, soundDir + sound + ".mp3");
    }
    
    protected function perSound(url:String):void{
        soundManager.getSound(url);
        frameLine.addFrame(soundManager.playSingleSound, 2, url);
    }
    
    private function speakEnd():void{
        movieLetter.gotoAndStop(1);
        movieLetter.visible = false;
        btnLetter.mouseEnabled = true;
    }
    
    protected function movieEnd():void{
        movie.stop();
        btnLetter.visible = true;
        DisplayUtil.addClickState(btnLetter);
    }
    
    protected function gameWrong():void{
        soundIndex = 0;
        soundManager.delayPlay(soundDir + "oncemore.mp3", 100);
    }
    protected function rightInc():void{
        soundManager.delayPlay(soundDir + ArrayUtil.getRandomItem(soundOfRight) + ".mp3", 500);
//        if (++soundIndex >= soundOfRight.length){
//            soundIndex--;
//        }
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    
    protected function btnLetter_clickHandler(event:MouseEvent):void{
        DisplayUtil.removeClickState(btnLetter);
        movieLetter.visible = true;
        btnLetter.mouseEnabled = false;
        frameLine.addFrame(movieLetter.gotoAndPlay, 2, 2);
        frameLine.addFrame(speakEnd, movieLetter.totalFrames + 2);
        speak();
//        introduce();
    }
}
}