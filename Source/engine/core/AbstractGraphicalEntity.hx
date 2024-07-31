package engine.core;

import openfl.utils.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Point;

class AbstractGraphicalEntity extends AbstractSpatialEntity {
    var sprite: Sprite;
    
    function new(position: Point = null) {
        super(position);
        sprite = new Sprite();
        Engine.activeScene.root.addChild(sprite);
    }

    override function tick() {
        super.tick();
        sprite.x = position.x;
        sprite.y = position.y;
    }
}