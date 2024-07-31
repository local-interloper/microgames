package game.microgames.balance.scenes;

import engine.Engine;
import engine.core.AbstractScene;
import game.microgames.balance.entities.Lifter;

class BalanceGame extends AbstractScene {
    public function new(){
        super();
    }

    override function start() {
        Engine.activeScene.add(new Lifter());
    }
}