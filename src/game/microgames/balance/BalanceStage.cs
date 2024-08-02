using System.Xml.Schema;
using engine;
using engine.entities.core;
using engine.entities.util;
using game.microgames;
using game.microgames.balance.entities;

public class Balance: AbstractScene {

    public Balance() {
        Background = AssetServer.GetTexture("assets/microgames/balance/background.png");
        AddEntity(new Lifter());

        var timer = new TimerEntity(5);

        timer.Finished += () => {
            Engine.LoadScene(new MicrogamesScene());
        };

        timer.Begin();
        AddEntity(timer);
    }
}