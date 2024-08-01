package engine.extensions;

import openfl.display.BitmapData;
import openfl.display.Bitmap;

class BitmapExtender{
    public static function setAnimationFrame(bmp:Bitmap,frames:Array<BitmapData>, frame:Int){
        bmp = new Bitmap(frames[frame]);
    }
}