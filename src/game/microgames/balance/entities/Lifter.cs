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

    public override void Render()
    {
        base.Render();

        var marker = AssetServer.GetTexture("assets/textures/debug/marker.png");
        Raylib.DrawTexturePro(
            marker,
            new Rectangle
            {
                X = 0,
                Y = 0,
                Width = marker.Width,
                Height = marker.Height
            },
            new Rectangle
            {
                X = Position.X,
                Y = Position.Y,
                Width = marker.Width,
                Height = marker.Height,
            },
            new Vector2(32, 32),
            Rotation,
            Color.White
        );
    }
}