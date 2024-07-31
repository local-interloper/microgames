package game.entities;

import engine.Input;
import openfl.geom.Point;
import engine.core.AbstractSprite;


class Player extends AbstractSprite {
    public function new() {
        super("assets/thing.png");
    }

    override function tick() {
        super.tick();
        var dir = new Point(0,0);
    }
}