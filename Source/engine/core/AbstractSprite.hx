package engine.core;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.Assets;

class AbstractSprite extends AbstractSpatialEntity {
    var sprite: Bitmap;

    function new(spritePath: String, position: Point = null) {
        super(position != null ? position : new Point(0,0));
        var bitmapData = Assets.getBitmapData(spritePath);
        sprite = new Bitmap(bitmapData);
        Engine.activeScene.root.addChild(sprite);
    }

    override function tick() {
        super.tick();
        sprite.x = position.x;
        sprite.y = position.y;
    }
}