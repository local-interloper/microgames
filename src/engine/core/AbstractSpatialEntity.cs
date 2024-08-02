using System.Numerics;
using engine.types.spatial;
using Raylib_cs;

namespace engine.core;


public abstract class AbstractSpatialEntity : AbstractEntity
{
    public Vector2 Position = Vector2.Zero;
    public float Rotation = 0;
    public float Scale = 1;
    public Vector2 Origin = new Vector2(0, 0);

    public AbstractSpatialEntity() : base() { }

}