package game.microgames.balance.entities;

import engine.Input;
import engine.Engine;
import openfl.geom.Point;
import engine.entities.core.AbstractSpriteEntity;

class Lifter extends AbstractSpriteEntity {
    var speed: Float = 0;
    var force: Float = 75;

    public function new() {
        super("assets/microgames/balance/lifter.png", BOTTOM, new Point(512, 1024 / 4 * 3));
        sprite.scaleX = 10;
        sprite.scaleY = 10;
        speed = Random.fromIterable([-1, 1]) * 40;
    }

    override function tick() {
        super.tick();

        speed += Input.getAxis(KEY_MOVERIGHT, KEY_MOVELEFT) * force * Engine.delta;
        speed += (sprite.rotation / 2) * Engine.delta;

        sprite.rotation += speed * Engine.delta;

        if (Math.abs(sprite.rotation) > 60) {
            destroy();
        }
    }
}