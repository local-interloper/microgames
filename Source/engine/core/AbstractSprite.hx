package engine.core;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.Assets;

class AbstractSprite extends AbstractGraphicalEntity {

    function new(spritePath: String, position: Point = null) {
        super(position);
        var bitmapData = Assets.getBitmapData(spritePath);
        var bitmap = new Bitmap(bitmapData);
        sprite.addChild(bitmap);
    }

    override function tick() {
        super.tick();
        sprite.x = position.x;
        sprite.y = position.y;
    }
}