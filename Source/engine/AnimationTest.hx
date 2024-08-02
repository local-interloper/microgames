package engine;

import openfl.geom.Rectangle;
import openfl.geom.Point;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class AnimationTest extends Sprite{
    public function new(dimensions:Point = null){
        super();
        if(dimensions == null) dimensions = new Point(16,16);
        var bitmapData:BitmapData = Assets.getBitmapData("assets/testanimation.png");
        var bitmap:Bitmap = new Bitmap(bitmapData);
        var mask:Sprite = new Sprite();
        mask.graphics.beginFill(0x000000);
        mask.graphics.drawRect(0,0,dimensions.x,dimensions.y);
        this.addChild(bitmap);
        this.addChild(mask);
        bitmap.mask = mask;
        bitmap.bitmapData.scroll(-8,0);
        this.scaleX = this.scaleY = 10;
    }
}