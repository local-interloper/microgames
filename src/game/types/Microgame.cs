using engine.core;
using engine.entities.core;

public delegate AbstractScene SceneGenerator();

public struct MicrogameData
{
    public string Name;
    public SceneGenerator sceneGenerator;
}