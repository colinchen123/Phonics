package com.topmind.modules.tutorial
{
import com.topmind.core.BaseModule;

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
        ContextClass = TutorialModuleContext;
    }
}
}