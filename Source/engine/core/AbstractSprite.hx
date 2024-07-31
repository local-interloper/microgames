package engine.core;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.Assets;

class AbstractSprite extends AbstractSpatialEntity {
    var sprite: Sprite;

    function new(spritePath: String, position: Point = null) {
        super(position != null ? position : new Point(0,0));
        sprite = new Sprite();
        var bitmapData = Assets.getBitmapData(spritePath);
        var bitmap = new Bitmap(bitmapData);
        sprite.addChild(bitmap);
        Engine.activeScene.root.addChild(sprite);
    }

    override function tick() {
        super.tick();
        sprite.x = position.x;
        sprite.y = position.y;
    }
}