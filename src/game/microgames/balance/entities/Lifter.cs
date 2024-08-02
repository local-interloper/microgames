using System.Numerics;

namespace game.microgames.balance.entities;

public class Lifter : AbstractSpriteEntity
{
    public Lifter() : base("assets/microgames/balance/lifter.png")
    {
        Position = new Vector2(256, 256);
    }
}