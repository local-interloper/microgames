using engine;
using engine.core;
using game.microgames;
using game.microgames.balance.entities;

public class Balance: AbstractScene {
    float _stageTime = 10;

    public Balance() {
        Background = AssetServer.GetTexture("assets/microgames/balance/background.png");
        AddEntity(new Lifter());
    }

    public override void Start()
    {
        base.Start();
        Console.WriteLine("XD");
    }

    public override void Tick(float delta)
    {
        base.Tick(delta);
        _stageTime -= delta;

        if (_stageTime <= 0) {
            Engine.LoadScene(new MicrogamesScene());
        }
    }
}