using engine;
using engine.core;
using Raylib_cs;

namespace game.testclasses;

public class TestEntity:AbstractEntity
{
    public TestEntity():base(){
        
    }
    
    override public void Tick(double delta){
        Engine.Scene?.Destroy(this);
    }

    public override void Render()
    {
        Raylib.DrawLine(0,0, 100, 100, Color.Beige);
    }
}