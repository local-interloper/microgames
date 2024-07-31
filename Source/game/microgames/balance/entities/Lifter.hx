package game.microgames.balance.entities;

import engine.Engine;
import openfl.geom.Point;
import engine.entities.core.AbstractSpriteEntity;

class Lifter extends AbstractSpriteEntity {
    var speed: Float = 0;

    public function new() {
        super("assets/microgames/balance/lifter.png", CENTER, new Point(250, 250));
        // speed = Random.float(-15.0, 15.0);
        speed = 10;
    }

    override function tick() {
        super.tick();
        sprite.rotation += speed * Engine.delta;
    }
}