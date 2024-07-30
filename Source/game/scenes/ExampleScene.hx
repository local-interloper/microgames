package game.scenes;

import engine.core.AbstractScene;

import game.entities.Player;

class ExampleScene extends AbstractScene {
    override function start() {
        add(new Player());
    }
}