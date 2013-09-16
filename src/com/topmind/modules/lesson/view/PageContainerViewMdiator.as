package com.topmind.modules.lesson.view
{
import assets.lesson.PenAsset;

import com.topmind.modules.lesson.view.pages.AppleGamePage;
import com.topmind.modules.lesson.view.pages.EggPage;
import com.topmind.modules.lesson.view.pages.GemGamePage;
import com.topmind.modules.lesson.view.pages.IntroPage;
import com.topmind.modules.lesson.view.pages.NetPage;
import com.topmind.modules.lesson.view.pages.PenPage;
import com.topmind.modules.lesson.view.pages.RecordPage;
import com.topmind.modules.lesson.view.pages.SpeakPage;
import com.topmind.modules.lesson.view.pages.TentPage;

import org.robotlegs.mvcs.Mediator;

public class PageContainerViewMdiator extends Mediator
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PageContainerViewMdiator</code>实例.
     *
     */
    public function PageContainerViewMdiator()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    
    [Inject]
    public var view:PageContainerView;
    
    //==========================================================================
    //  Methods
    //==========================================================================
    
    override public function onRegister():void{
        view.setPages([IntroPage, RecordPage, AppleGamePage, EggPage, PenPage, NetPage, TentPage, GemGamePage]);
        view.showPageAt(0);
    }
    
    override public function onRemove():void{
        view.dispose();
    }
}
}