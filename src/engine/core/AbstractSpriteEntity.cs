using System.Numerics;
using engine.core;
using Raylib_cs;

public abstract class AbstractSpriteEntity : AbstractSpatialEntity
{
    Texture2D sprite;

    public AbstractSpriteEntity(string spritePath, Vector2 position) : base(position)
    {
        sprite = AssetServer.GetTexture(spritePath);
    }

    public override void Render()
    {
        Raylib.DrawTexture(sprite, (int)position.X, (int)position.Y, Color.White);
    }
}