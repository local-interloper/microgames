package game.microgames.balance.entities;

import engine.Input;
import engine.Engine;
import openfl.geom.Point;
import engine.entities.core.AbstractSpriteEntity;

class Lifter extends AbstractSpriteEntity {
    var speed: Float = 0;
    var force: Float = 50;

    public function new() {
        super("assets/microgames/balance/lifter.png", BOTTOM, new Point(250, 250));
        speed = Random.float(-40.0, 40.0);
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