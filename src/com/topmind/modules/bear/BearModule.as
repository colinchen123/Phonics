package com.topmind.modules.bear
{
import com.topmind.core.BaseModule;
import com.topmind.core.IModule;

import mx.core.UIComponent;

import org.robotlegs.core.IInjector;

public class BearModule extends BaseModule
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BearModule</code>实例.
     *
     */
    public function BearModule()
    {
        super();
        ContextClass = BearModuleContext;
    }

}
}