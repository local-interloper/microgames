package engine.types;

import openfl.geom.Rectangle;

class Animation {
    public var name: String;
    public var frames: Array<Rectangle>;

    public function new(name: String, frames: Array<Rectangle>) {
        this.name = name;
        this.frames = frames;
    }
}