using System.Numerics;
using engine.core;
using Raylib_cs;

namespace game.testclasses;

public class TestEntity : AbstractSpriteEntity
{
    public TestEntity() : base("assets/textures/dev.png", new Vector2(200, 200))
    {

    }

    public override void Tick(double delta)
    {
        base.Tick(delta);

        position.X = (float)(Math.Sin(Raylib.GetTime()) + 1) / 2 * 100;
    }
}