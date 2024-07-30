package game.scenes;

import engine.core.AbstractScene;

import game.entities.ExampleEntity;

class ExampleScene extends AbstractScene {
    override function start() {
        add(new ExampleEntity());
    }
}