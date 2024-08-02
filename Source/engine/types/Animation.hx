package engine.types;

import openfl.display.BitmapData;
import openfl.geom.Rectangle;

class Animation {
    public var name: String;
    public var frames: Array<Rectangle>;
    public var framerate:Int;

    public function new(name: String, frames: Array<Rectangle>, framerate=24) {
        this.name = name;
        this.frames = frames;
        this.framerate = framerate;
    }
}