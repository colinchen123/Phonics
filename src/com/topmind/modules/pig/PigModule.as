package com.topmind.modules.pig
{
import assets.pig.PigAsset;

import com.topmind.common.view.StatePanel;
import com.topmind.core.BaseModule;
import com.topmind.modules.bear.views.PowerLine;
import com.topmind.modules.pig.view.BedView;
import com.topmind.modules.pig.view.FoodView;
import com.topmind.modules.pig.view.PigView;
import com.topmind.modules.pig.view.RatView;
import com.topmind.modules.pig.view.ResultPanel;
import com.topmind.modules.pig.view.SoundControl;
import com.topmind.modules.pig.view.WordView;
import com.ysrlin.ui.utils.MovieClipTab;
import com.ysrlin.utils.ArrayUtil;

import flash.events.Event;

public class PigModule extends BaseModule
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigModule</code>实例.
     *
     */
    public function PigModule()
    {
        super();
        contextClass = PigModuleContext
    }
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:PigAsset;
    private var soundControl:SoundControl;
    private var ratView:RatView;
    private var foodView:FoodView;
    private var pigView:PigView;
    private var tab:MovieClipTab;
    private var wordView:WordView;
    private var words:Array;
    private var powerLine:PowerLine;
    private var bedView:BedView;
    private var statePanel:StatePanel;
    private var resultPanel:ResultPanel;
    
    //==========================================================================
    //  Properties
    //==========================================================================
    
    public var isRight:Boolean;
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initDisplay():void{
        asset = new PigAsset();
        addChild(asset);
        soundControl = new SoundControl(asset.sound0, asset.sound1, asset.sound2);
        soundControl.enable = false;
        ratView = new RatView();
        ratView.replace(asset.rats);
        foodView = new FoodView();
        foodView.replace(asset.foods);
        wordView = new WordView();
        wordView.replace(asset.word);
        wordView.visible = false;
        bedView = new BedView();
        bedView.replace(asset.bed);
        statePanel = new StatePanel();
        statePanel.replace(asset.statePanel);
        statePanel.nextFun = showResult;
        
        resultPanel = new ResultPanel();
        resultPanel.replace(asset.resultPanel);
        resultPanel.nextFunction = replay;
        
        powerLine = new PowerLine(asset.powerLine);
        
        pigView = new PigView();
        pigView.replace(asset.pig);
        
        tab = new MovieClipTab(asset.options, false, false);
        tab.reSelect = true;
        tab.addEventListener(Event.SELECT, tab_selectHandler);
        asset.options.mouseEnabled = false;
        asset.options.mouseChildren = false;
        pigView.addEventListener(Event.COMPLETE, pigView_completeHandler);
    }
    
    public function replay():void{
        powerLine.reStart();
        pigView.setState(1);
        bedView.setState(1);
        pigView.wait();
        ratView.wait();
        dispatchEvent(new PigEvent(PigEvent.FINISH));
    }
    
    public function setWord(value:Array):void{
        wordView.visible = true;
        wordView.word = ArrayUtil.getRandomItem(value) as String;
        words = value;
        soundControl.setWords(value);
        ratView.setFood(powerLine.number + 1);
        foodView.showFood(powerLine.number + 1);
        asset.options.mouseChildren = true;
        soundControl.enable = true;
        pigView.wait();
        bedView.replay();
    }
    
    private function showResult():void{
        resultPanel.showResult(6);
    }
    
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function tab_selectHandler(event:Event):void{
        var index:int = int(tab.selected.charAt(3));
        ratView.throwFood(index);
        foodView.throwFood(index);
        pigView.eat(powerLine.number + 1);
        bedView.replay();
        isRight = words[index] == wordView.word;
        wordView.visible = false;
        asset.options.mouseChildren = false;
        soundControl.enable = false;
    }
    
    private function pigView_completeHandler(event:Event):void{
        var isEnd:Boolean = false;
        if (pigView.state == "eat"){
            isRight ? pigView.happy() : pigView.angry();
        }else{
            pigView.wait();
            if (isRight){
                powerLine.number++;
                if (powerLine.number == 2){
                    pigView.setState(3);
                    bedView.setState(3);
                }else if (powerLine.number == 4){
                    pigView.setState(4);
                }else if (powerLine.number == 6){
                    bedView.setState(4);
                    pigView.finish();
                    ratView.end();
                    statePanel.show();
                    isEnd = true;
                }
            }
            bedView.replay();
            if (!isEnd)
            {
                dispatchEvent(new PigEvent(PigEvent.FINISH));
            }
        }
    }
}
}