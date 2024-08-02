using System.Numerics;
using Raylib_cs;

namespace game.microgames.balance.entities;

public class Lifter : AbstractSpriteEntity
{
    public Lifter() : base("assets/microgames/balance/lifter.png")
    {
        Position = new Vector2(505, 854);
        Scale = 5;
        Origin = new Vector2(128 / 2, 135);
    }

    public override void Tick(float delta)
    {
        Rotation += 15 * delta;
    }
}