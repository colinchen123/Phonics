package com.topmind.modules.tutorial.view
{
import assets.tutorial.TutorialUiAsset;

import com.greensock.TweenLite;
import com.greensock.easing.Bounce;
import com.greensock.easing.Linear;
import com.topmind.common.events.PhonicsEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

public class HelloLetterView extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>HelloLetterView</code>实例.
     *
     */
    public function HelloLetterView()
    {
        super();
        initDisplay();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:TutorialUiAsset;
    private var cardList:CardList;
    private var letterCard:LetterCard;
    private var letterRobot:LetterRobotView;
    private var recordView:RecordView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    private function initDisplay():void{
        asset = new TutorialUiAsset();
        addChild(asset);
        letterCard = new LetterCard();
        letterCard.visible = false;
        letterCard.replace(asset.card);
        letterCard.hideShadow();
        letterCard.record();
        
        cardList = new CardList();
        cardList.replace(asset.cards);
        cardList.addEventListener(Event.SELECT, cardList_selectHandler);
        
        letterRobot = new LetterRobotView();
        addChild(letterRobot);
        letterRobot.x = letterCard.x;
        letterRobot.y = letterCard.y;
        cardList.letters = ["s", 'a','t','c','p','n'];
        asset.btnFinish.addEventListener(MouseEvent.CLICK, btnFinish_clickHandler);
        
        recordView = new RecordView();
        recordView.replace(asset.recrod);
        asset.btnFinish.visible = false;
        
        asset.btnNext.addEventListener(MouseEvent.CLICK, btnNext_clickHandler);
        asset.fipPage.stop();
        asset.fipPage.visible = false;
    }
    
    public function dispose():void{
        asset.btnNext.removeEventListener(MouseEvent.CLICK, btnNext_clickHandler);
        asset.btnFinish.removeEventListener(MouseEvent.CLICK, btnFinish_clickHandler);
        cardList.removeEventListener(Event.SELECT, cardList_selectHandler);
        cardList.dispose();
        cardList = null;
        letterCard.dispose();
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function cardList_selectHandler(event:Event):void{
        letterRobot.removeRobot();
        var pt:Point = globalToLocal(cardList.pt);
        TweenLite.killTweensOf(letterCard, false);
        letterCard.reSet();
        TweenLite.from(letterCard, 1, {y:pt.y,ease:Bounce.easeOut,overwrite:0, onComplete:jumpend});
        TweenLite.from(letterCard, 0.5, {scaleX:1, scaleY:1, x:pt.x, overwrite:0 , ease:Linear.easeNone});
        letterCard.visible = true;
        letterCard.letter = cardList.selectLetter;
        letterRobot.letter = cardList.selectLetter;
    }
    
    private function btnNext_clickHandler(event:MouseEvent):void{
        asset.fipPage.visible = true;
        recordView.visible = false;
        asset.fipPage.gotoAndPlay(1);
    }
    
    private function btnFinish_clickHandler(event:MouseEvent):void{
        dispatchEvent(new PhonicsEvent(PhonicsEvent.REQUEST_EXIT, true));
    }
    
    private function jumpend():void{
        letterCard.visible = false;
        letterRobot.beRobot();
    }
}
}