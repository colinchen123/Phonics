package com.topmind.modules.bear.views
{
import assets.bear.BearFightAsset;
import assets.bear.CatAsset;
import assets.bear.TiggerAsset;

import bear.BearAndCatAsset;

import com.greensock.TweenLite;
import com.greensock.easing.Linear;
import com.topmind.AvatarType;
import com.topmind.common.view.ReplaceView;
import com.topmind.core.AppConfig;
import com.topmind.managers.SoundManager;
import com.topmind.modules.bear.views.events.RunMovieViewEvent;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.MovieClipHandler;
import com.ysrlin.utils.MathUtil;

import flash.display.DisplayObject;
import flash.display.MovieClip;

public class RunMovieView extends ReplaceView
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>RunMovieView</code>实例.
     *
     */
    public function RunMovieView()
    {
        super();
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:BearAndCatAsset;
    private var bearAsset:BearFightAsset;
    private var playerAsset:MovieClip;
    private var thePlayer:MovieClip;
    private var theBear:MovieClip;
    private var movieHandler:MovieClipHandler
    private var lastBearX:int;
    private var soundManager:SoundManager;
    private var hitIndex:int = 1;
    
    private var playerX:int;
    private var playerY:int;
    
    private var bearX:int;
    private var bearY:int;
    private var avatarType:String;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    override public function replace(display:DisplayObject):void{
        super.replace(display);
        asset = display as BearAndCatAsset;
        bearX = 0;
        bearY = asset.bear.y + 10;
        lastBearX = asset.bear.x - 200;
        playerX = asset.cat.x;
        playerY = asset.cat.y;
        playerX = 600;
        playerY = 100;
        removeChild(display);
        movieHandler = new MovieClipHandler();
        bearAsset = new BearFightAsset();
        DisplayUtil.stopAllChild(bearAsset);
        soundManager = AppConfig.soundManager;
        x += 100;
    }
    
    public function initWithAvatar(type:String):void{
        avatarType = type;
        if(type == AvatarType.CAT){
            playerAsset = new CatAsset();
        }else{
            playerAsset = new TiggerAsset();
        }
        DisplayUtil.stopAllChild(playerAsset);
    }
    
    public function reStart():void{
        bearX = 0;
        theBear.x = 0;
        hitIndex = 1;
    }
    
    public function pause():void{
        theBear.stop();
        thePlayer && thePlayer.stop();
    }
    
    public function resume():void{
        theBear.play();
        thePlayer && thePlayer.play();
    }
    
    public function bearFailed():void{
        var tempX:int = thePlayer.x;
        var tempY:int = thePlayer.y;
        playState("bearFailed");
        thePlayer.x = tempX;
        thePlayer.y = tempY;
    }
    
    public function bearWinState():void{
        clear();
        if (avatarType == AvatarType.CAT){
            playBearState("winCat");
        }else{
            playBearState("winTiger");
        }
//        playPlayerState("winState");
//        playState("winState");
    }
    
    public function throwStone():void{
        var index:int = MathUtil.random(1, 6);
        var url:String = "hit" + hitIndex;
        playState(url);
        playSound(url);
        if (hitIndex == 1){
            playSound("getStone", 500);
        }
        hitIndex++;
        patchAtferEnd();
    }
    
    public function run():void{
        playState("run");
    }
    
    public function catWin():void{
        playState("hit6");
        playSound("hit6");
        movieHandler.addEndHandler(thePlayer, playerJump);
//        patchAtferEnd();
    }
    
    public function near():void{
        bearX = theBear.x + lastBearX / 6;
        TweenLite.to(theBear, 30, {useFrames:true,x:bearX});
        patchAtferEnd();
        
        if (avatarType == AvatarType.CAT)
        {
            playSound("chased", 200);
        }else{
            playSound("tiger", 200);
        }
    }
    
    public function bearWin():void{
        clear();
        playPlayerState("win");
        if (avatarType == AvatarType.CAT)
        {
            playBearState("catchCat");
            playSound("chased", 200);
        }else{
            playBearState("catchTiger");
            playSound("tiger", 200);
        }
        patchAtferEnd();
    }
    
    override public function dispose():void{
        clear();
        soundManager = null;
        playerAsset = null;
        bearAsset = null;
        movieHandler.dispose();
    }
    
    private function playSound(url:String, delay:int = 2000):void{
        soundManager.delayPlay("effects/"+url+".mp3", delay);
    }
    
    private function playState(state:String):void{
        clear();
        playBearState(state);
        playPlayerState(state);
    }
    
    private function playerJump():void{
        clear();
        playBearState("bearFailed");
        playPlayerState("jump");
        var frames:int = thePlayer.totalFrames;
        TweenLite.to(thePlayer, frames - 10, {x:bearX,ease:Linear.easeNone, delay:10, y:bearY, useFrames:true, onComplete:endJump});
    }
    
    private function playPlayerState(state:String):void{
        thePlayer = playerAsset[state];
        if (thePlayer){
            thePlayer.gotoAndPlay(1);
            thePlayer.x = playerX;
            thePlayer.y = playerY;
            addChild(thePlayer);
        }
    }
    
    private function playBearState(state:String):void{
        theBear = bearAsset[state];
        if (theBear){
            theBear.gotoAndPlay(1);
            theBear.x = bearX;
            theBear.y = bearY;
            addChild(theBear);
        }
    }
    
    private function clear():void{
        DisplayUtil.removeAllChildren(this);
        theBear && theBear.stop();
        thePlayer && thePlayer.stop();
        theBear = null;
        thePlayer = null;
    }
    
    private function endJump():void{
        var tempX:int = thePlayer.x;
        var tempY:int = thePlayer.y;
        clear();
        playBearState("fall");
        playState("bearFailed");
        thePlayer.x = tempX;
        thePlayer.y = tempY;
        movieEndHandler();
    }
    
    private function patchAtferEnd():void{
        movieHandler.addEndHandler(thePlayer, movieEndHandler);
    }
    
    private function movieEndHandler():void{
        dispatchEvent(new RunMovieViewEvent(RunMovieViewEvent.END_MOVIE));
    }
}
}