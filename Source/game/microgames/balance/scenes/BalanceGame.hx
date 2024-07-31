package game.microgames.balance.scenes;

import engine.entities.util.Background;
import engine.Engine;
import engine.entities.core.AbstractScene;
import game.microgames.balance.entities.Lifter;

class BalanceGame extends AbstractScene {
    public function new(){
        super();
    }

    override function start() {
        Engine.activeScene.add(new Background("assets/microgames/balance/bg.png"));
        Engine.activeScene.add(new Lifter());
    }
}