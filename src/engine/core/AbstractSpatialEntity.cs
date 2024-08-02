using System.Numerics;
using Raylib_cs;

namespace engine.core;


public abstract class AbstractSpatialEntity: AbstractEntity
{
    public Vector2 position;

    public AbstractSpatialEntity(Vector2 position): base(){
        this.position = position;
    }
    
}