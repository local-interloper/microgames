using engine.core;
using game.microgames.balance.entities;

public class Balance: AbstractScene {
    public Balance() {
        Background = AssetServer.GetTexture("assets/microgames/balance/background.png");
        AddEntity(new Lifter());
    }
}