namespace game.microgames;

using engine;
using engine.core;
using engine.entities.core;
using game.microgames;

public class MicrogamesScene : AbstractScene
{
    public MicrogamesScene()
    {
    }

    public override void Start()
    {
        base.Start();
        var minigame = Microgames.MicrogamesRegistry[0];
        Engine.LoadScene(minigame.sceneGenerator());
    }
}