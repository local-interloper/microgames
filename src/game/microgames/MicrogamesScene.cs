namespace game.microgames;

using engine;
using engine.entities.core;
using engine.entities.util;

public class MicrogamesScene : AbstractScene
{
    public MicrogamesScene()
    {
        Background = AssetServer.GetTexture("assets/textures/backgrounds/intermission.png");
    }

    public override void Start()
    {
        base.Start();
        var minigame = Microgames.MicrogamesRegistry[0]; // TODO: Update this to pick a random game

        var timer = new TimerEntity(5);
        AddEntity(timer);

        timer.Finished += () =>
        {
            Engine.LoadScene(minigame.sceneGenerator());
        };

        timer.Begin();

        AddEntity(new TextEntity("Imminent holding with both hands"));
    }
}