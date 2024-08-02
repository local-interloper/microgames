package engine;

import openfl.utils.ByteArray;
import openfl.geom.Point;
import openfl.display.Sprite;
import openfl.display.DisplayObject;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.utils.Assets;

class SpriteSheet {
    public static function extractFrame(bmpd:BitmapData, frameIndex:Int, fd:Point)
    {
        var rect = new Rectangle(frameIndex*fd.x,0,fd.x,fd.y);
        trace(rect);
        var point = new Point(0,0);
        var frame = new BitmapData(
            Math.floor(fd.x),
            Math.floor(fd.y)
        );
        frame.copyPixels( bmpd, rect, point);
        return frame;
    }
    
    public static function getFrames(bmpd:BitmapData, fd:Point){
        var frameCount:Int = Math.floor(bmpd.width/fd.x);
        var frames:Array<BitmapData> = [for (i in 0 ... frameCount) extractFrame(bmpd, i,fd)];
        // var bmpdFrames:Array<BitmapData> = [for(frame in frames) BitmapData.fromBytes(frame)];
        trace(frames);
        return frames;
    }
}