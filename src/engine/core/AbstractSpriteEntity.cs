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
        Raylib.DrawTexture(sprite, (int)Position.X, (int)Position.Y, Color.White);
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
                Width = sprite.Width,
                Height = sprite.Height
            },
            Origin,
            Rotation,
            Color.White
        );
    }
}