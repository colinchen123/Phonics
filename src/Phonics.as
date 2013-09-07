package
{
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
    }
    override protected function loadedConfig(data:Object):void{
        addChild(new BearModule());
        addChild(new FPS());
    }
}
} 