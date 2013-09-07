package com.topmind.modules.bear.views
{
import assets.bear.BgAsset;

import com.ysrlin.core.CacheMap;
import com.ysrlin.ui.core.Component;
import com.ysrlin.ui.utils.DisplayUtil;
import com.ysrlin.ui.utils.ImageUtil;
import com.ysrlin.utils.MathUtil;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.Point;

public class BgView extends Component
{
    //==========================================================================
    //  Constructor
    //==========================================================================
    /**
     * 构造一个新的<code>BgView</code>实例.
     *
     */
    public function BgView()
    {
        super();
        bmd = new BitmapData(1024, 768, false, 0xFBF0B0);
        addChild(new Bitmap(bmd, 'auto'));
    }
    
    //==========================================================================
    //  Variables
    //==========================================================================
    private var asset:BgAsset;
    private var bmdMap:CacheMap = new CacheMap(createBitmapData);
    private var items:Array = [];
    private var moved:Number = 0;
    private var bmd:BitmapData;
    
    private var isPause:Boolean = false;
    
    //==========================================================================
    //  Properties
    //==========================================================================
   private var _speed:Number;

    public function get speed():Number
    {
        return _speed;
    }
    
    
    public function set speed(value:Number):void
    {
        _speed = value;
        if (_speed != 0 && !hasEventListener(Event.ENTER_FRAME)){
            addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }else if (_speed == 0 && hasEventListener(Event.ENTER_FRAME)){
            removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
    }

    
    //==========================================================================
    //  Methods
    //==========================================================================
    override protected function initialize():void{
        asset = new BgAsset();
        initCould();
        initHill();
        initLittleTree();
        initTreeMiddle();
        initRoad();
        initTree();
        speed = 5;
    }
    
    public function pause():void{
        isPause = true;
    }
    
    public function resume():void{
        isPause = false;
    }
    
    private function initRoad():void{
        var distance:int = asset.r1_0.width;
        var count:int = (1024 / distance) + 2;
        var loop:int = distance *  count;
        for (var i:int = 0; i < count; i++){
            create("r1_0", i * distance, 800, 1.2, loop);
        }
        distance = asset.r1_1.width;
        count = (1024 / distance) + 2;
        loop = distance * count;
        for (i = 0; i < count; i++){
            create('r1_1', i * distance, 652, 0.9, loop);
        }
    }
    
    private function initHill():void{
        for (var i:int = 0; i < 2; i++){
            create('m1_0', i * 1200, 765, 0.4, 2400);
        }
    }
    
    private function initLittleTree():void{
        var loop:int = 1600;
        var distance:int = 800;
        for (var i:int = 0; i < 3; i++){
            for (var j:int = 0; j < 6; j++){
                create("t3_" + j, i * distance + j * 100, 615, 0.6, loop);
            }
        }
    }
    
    private function initTreeMiddle():void{
        var loop:int = 1600;
        var distance:int = 800;
        for (var i:int = 0; i < 2; i++){
            create('t2_0', i * distance, 610, 0.7, loop);
            create('t2_1', i * distance + 200, 610, 0.7, loop);
            create('t2_2', i * distance + 400, 610, 0.7, loop);
            create('t2_3', i * distance + 600, 610, 0.7, loop);
        }
    }
    
    private function initCould():void{
        for (var i:int = 0; i < 3; i++){
            create("c1_0", i * 450, 100 + MathUtil.random(100), 0.2, 1350);
        }
    }
    
    private function initTree():void{
        for (var i:int = 0; i < 2; i++){
            create('t1_0', i * 700, 650, 0.95, 1400);
            create('t1_1', i * 700 - 300, 650, 0.95, 1400);
        }
    }
    
    private function create(name:String, x:int, y:int, sc:Number, loop:int = 1024):ItemBitmap{
        var bd:BitmapData = bmdMap.getValue(name) as BitmapData;
        var result:ItemBitmap = new ItemBitmap();
        result.bmd = bd;
        result.initX = x;
        result.loop = loop;
        result.y = y - bd.height;
        result.sc = sc;
        items.push(result);
        return result;
    }
    
    private function createBitmapData(name:String):BitmapData{
        var display:DisplayObject = asset.getChildByName(name);
        return ImageUtil.catchImage(display);
    }
    
    override public function dispose():void{
        bmdMap.dispose();
        DisplayUtil.removeAllChildren(this);
        items = null;
    }
    //==========================================================================
    //  Event Handlers
    //==========================================================================
    private function enterFrameHandler(event:Event):void{
        if (isPause) return;
        moved -= _speed;
        bmd.lock()
        bmd.fillRect(bmd.rect, 0xFBF0B0);
        var pt:Point = new Point();
        for each (var item:ItemBitmap in items){
            var src:BitmapData = item.bmd;
            item.x = item.initX + moved * item.sc;
            if (item.x < -src.width){
                item.initX += item.loop;
            }
            if (item.x > -src.width && item.x < 1024)
            {
                pt.x = item.x;
                pt.y = item.y;
                bmd.copyPixels(src, src.rect, pt);
            }
        }
        bmd.unlock();
    }
}
}
import flash.display.BitmapData;

class ItemBitmap{
    
    public function ItemBitmap(){}
    
    public var bmd:BitmapData;
    public var initX:int;
    public var x:int;
    public var y:int;
    public var sc:Number; 
    public var loop:int;
}