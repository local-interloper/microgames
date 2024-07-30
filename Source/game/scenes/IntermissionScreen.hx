package game.scenes;
import engine.Engine;
import engine.core.AbstractScene;

class IntermissionScreen extends AbstractScene {
    var registeredMicrogames = [
        function() new BalanceGame()
    ];

    override function tick() {
        super.tick();
        Engine.loadScene(scene);
    }
}