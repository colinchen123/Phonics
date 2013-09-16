package
{
import com.testflightapp.sdk.TestFlight;
import com.topmind.FPS;
import com.topmind.core.TopMindApp;
import com.topmind.modules.bear.BearModule;

import flash.display.StageScaleMode;

[SWF(width="1024", height="768", frameRate="20", backgroundColor="#FBF0B0")]
public class Phonics extends TopMindApp
{
    public function Phonics()
    {
        super();
        stage.scaleMode = StageScaleMode.NO_BORDER;
        TestFlight.takeOff("133979f7-57a0-4b0a-b2af-3ace1c465b87"); // I added this to enable TestFlight - Tim Zheng
    }
    override protected function loadedConfig(data:Object):void{
        addChild(new BearModule());
        addChild(new FPS());
    }
}
} 