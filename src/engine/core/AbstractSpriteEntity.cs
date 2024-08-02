using System.Numerics;
using engine.core;
using Raylib_cs;

public abstract class AbstractSpriteEntity : AbstractSpatialEntity
{
    Texture2D sprite;

    public AbstractSpriteEntity(string spritePath) : base()
    {
        sprite = AssetServer.GetTexture(spritePath);
    }

    public override void Render()
    {
        Console.WriteLine(Origin);

        Raylib.DrawTexturePro(
            sprite,
            new Rectangle
            {
                X = 0,
                Y = 0,
                Width = sprite.Width,
                Height = sprite.Height
            },
            new Rectangle
            {
                X = Position.X,
                Y = Position.Y,
                Width = sprite.Width * Scale,
                Height = sprite.Height * Scale
            },
            Origin*Scale,
            Rotation,
            Color.White
        );
    }
}