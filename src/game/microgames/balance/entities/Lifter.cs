using System.Numerics;
using engine.core.util;

namespace game.microgames.balance.entities;

public class Lifter : AbstractSpriteEntity
{
    private float _velocity;
    private float _force = 2.5f;

    private bool IsAlive;

    public Lifter() : base("assets/microgames/balance/lifter.png")
    {
        Position = new Vector2(505, 854);
        Scale = 5;
        Origin = new Vector2(128 / 2, 135);
    }

    public override void Start()
    {
        base.Start();
        _velocity = Globals.RNG.NextSingle() - 0.5f;
    }

    public override void Tick(float delta)
    {
        IsAlive = MathF.Abs(Rotation) < 60;

        if(!IsAlive) {
            Position.Y += 500 * delta;
            return;
        }

        _velocity += Input.GetAxis(Axis.X) * _force * delta;
        _velocity += Rotation / 180 * delta;
        Rotation += _velocity;
    }
}