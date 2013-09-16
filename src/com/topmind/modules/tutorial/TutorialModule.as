package com.topmind.modules.tutorial
{
import com.topmind.core.BaseModule;
import com.topmind.modules.tutorial.view.HelloLetterView;

public class TutorialModule extends BaseModule
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>PigModule</code>实例.
     *
     */
    public function TutorialModule()
    {
        super();
        contextClass = TutorialModuleContext;
    }
    
    public var count:int;
    public var words:Array;
    
    public function showConent():void{
        addChild(new HelloLetterView());
    }
}
}