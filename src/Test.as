package
{
import flash.display.Sprite;
import flash.events.Event;
import flash.events.EventDispatcher;

public class Test extends Sprite
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>Test</code>实例.
     *
     */
    public function Test()
    {
    }
    
    public function getRandomFormArray(value:Array):Object{
        var event:Event = new Event("vs");
        if (dispatchEvent(event)){
            
        }
        
        return value[int(value.length*Math.random())];
    }
    
    
    
    public function getCashType(value:int):int{
    }
}
}