package game.entities;

import engine.core.AbstractSprite;


class Player extends AbstractSprite {
    public function new() {
        super("assets/thing.png");
    }

    override function tick() {
        super.tick();
        this.position.x++;
    }
}