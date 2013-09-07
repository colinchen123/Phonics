package com.topmind.modules.shell.models
{
import com.topmind.core.IModule;

import org.robotlegs.mvcs.Actor;

public class ShellProxy extends Actor
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>ShellProxy</code>实例.
     *
     */
    public function ShellProxy()
    {
        super();
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    public var currentGame:IModule;
}
}