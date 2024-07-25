package game.entities;

import engine.core.AbstractEntity;


class ExampleEntity extends AbstractEntity {
    override function tick() {
        trace("Entity is ticking");
    }
}