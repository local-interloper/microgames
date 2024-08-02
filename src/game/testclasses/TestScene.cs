using engine.core;

namespace game.testclasses;

public class TestScene:AbstractScene
{
    public TestScene():base(){

    }

    public override void Start() {
        AddEntity(new TestEntity());
    }    
}