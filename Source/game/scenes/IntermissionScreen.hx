package game.scenes;

import game.microgames.balance.scenes.BalanceGame;
import engine.Engine;
import engine.core.AbstractScene;

class IntermissionScreen extends AbstractScene {
    var registeredMicrogames: Array<() -> AbstractScene> = [
        function() return new BalanceGame()
    ];

    override function start() {
        var sceneFunc = Random.fromIterable(registeredMicrogames);
        Engine.loadScene(sceneFunc());
    }
}