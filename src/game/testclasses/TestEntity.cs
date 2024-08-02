using System.Numerics;
using engine.core;
using Raylib_cs;
using engine.types.animation;

namespace game.testclasses;

public class TestEntity : AbstractAnimatedEntity
{
    public TestEntity() : base(new AnimatedEnityData
    {
        AtlasPath = "assets/textures/nums.png",
        TileSize = new Vector2(32, 32),
        Animations = [
            new Animation {
                Name = "idle-1",
                Index = 0,
                FrameCount = 3,
                FrameTime = 0.5,
            },
            new Animation {
                Name = "idle-2",
                Index = 1,
                FrameCount = 3,
                FrameTime = 0.5,
            },
            new Animation {
                Name = "idle-3",
                Index = 2,
                FrameCount = 3,
                FrameTime = 0.5,
            }
        ]
    }, new Vector2(200, 200))
    {
        Scale = 5;
    }

    public override void Start()
    {
        base.Start();
        Position = new Vector2(100, 100);
    }

    public override void Tick(double delta)
    {
        base.Tick(delta);

        if (Raylib.IsKeyPressed(KeyboardKey.One)) PlayAnimation("idle-1");
        if (Raylib.IsKeyPressed(KeyboardKey.Two)) PlayAnimation("idle-2");
        if (Raylib.IsKeyPressed(KeyboardKey.Three)) PlayAnimation("idle-3");
    }
}