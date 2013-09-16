package com.topmind.modules.tutorial.view
{
import assets.tutorial.TutorialUiAsset;

import com.greensock.TweenLite;
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
    private var tutorialPage:BaseTutorialPage;
    
    private var letters:Array;
    private var count:int;
    
    private var step:int = 0;
    
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
        asset.btnFinish.addEventListener(MouseEvent.CLICK, btnFinish_clickHandler);
        asset.btnFinish.visible = false;
        
        asset.btnNext.addEventListener(MouseEvent.CLICK, btnNext_clickHandler);
        asset.fipPage.stop();
        asset.fipPage.visible = false;
        asset.fipPage.addFrameScript(15, fipEnd);
    }
    
    public function setData(lettes:Array, count:int):void{
        this.letters = lettes;
        this.count = count;
        cardList.letters = lettes;
        if (count == 1){
            tutorialPage = new ShowOneLetterView();
        }else if (count == 2){
            tutorialPage = new ShowTwoLetterView();
            cardList.visible = false;
        }else if (count == 3){
            tutorialPage = new ShowThreeLetterView();
            cardList.visible = false;
        }
        tutorialPage.letterCard = letterCard;
        addChild(tutorialPage);
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
        var pt:Point = globalToLocal(cardList.pt);
        tutorialPage && tutorialPage.showLetterAt(cardList.pt, cardList.selectLetter);
    }
    
    private function btnNext_clickHandler(event:MouseEvent):void{
        tutorialPage && removeChild(tutorialPage);
        tutorialPage = null;
        
        asset.fipPage.visible = true;
        asset.fipPage.gotoAndPlay(1);
        step++;
    }
    
    private function fipEnd():void{
        if (tutorialPage){
            removeChild(tutorialPage);
        }
        
        if (count == 1){
            tutorialPage = new SelectLetterView();
            asset.btnNext.visible = false;
            asset.btnFinish.visible = true;
        }else if (step == 1){
            tutorialPage = new LetterTeamView();
        }else{
            tutorialPage = new SelectLetterView();
            cardList.visible = true;
            asset.btnNext.visible = false;
            asset.btnFinish.visible = true;
        }
//        tutorialPage = new SelectLetterView();
        tutorialPage.letterCard = letterCard;
        addChild(tutorialPage);
        TweenLite.from(tutorialPage, 0.5, {alpha:0});
        addChild(letterCard);
        cardList.trriger = MouseEvent.MOUSE_DOWN;
    }
    
    private function btnFinish_clickHandler(event:MouseEvent):void{
        dispatchEvent(new PhonicsEvent(PhonicsEvent.REQUEST_EXIT, true));
    }
}
}