package com.topmind.modules.tutorial.view
{
import com.ysrlin.ui.core.Component;

public class SelectLetterView extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>SelectLetterView</code>实例.
     *
     */
    public function SelectLetterView()
    {
        super();
    }
    
    //==========================================================================
    //  Properties
    //==========================================================================
    private var _letterNum:int = 0;

    public function get letterNum():int
    {
        return _letterNum;
    }

    public function set letterNum(value:int):void
    {
        if (_letterNum == value) return;
        
    }

    //==========================================================================
    //  Methods
    //==========================================================================
    private function createSoundFrame():void{
        for (var i:int = 0; i < 3; i++){
            for var (var j:int = 0; j < 2; j++){
                
            }
        }
    }
}
}