namespace engine.entities.core;

using System.Numerics;
using System.Reflection.Metadata;
using Raylib_cs;

public class AbstractScene
{
    private HashSet<AbstractEntity> _entities = new();
    private Queue<AbstractEntity> _destructionQueue = new();
    public float Scale;
    public RenderTexture2D SceneRenderTexture;

    public Texture2D? Background;

    public AbstractScene()
    {
        SceneRenderTexture = Raylib.LoadRenderTexture(Engine.GameScreenWidth, Engine.GameScreenHeight);
        Raylib.SetTextureFilter(SceneRenderTexture.Texture, TextureFilter.Point);  // Texture scale filter to use
    }

    public void AddEntity(AbstractEntity entity)
    {
        _entities.Add(entity);
        entity.Start();
    }

    public void RemoveEntity(AbstractEntity entity)
    {
        _entities.Remove(entity);
    }

    public virtual void Start()
    {

    }

    public virtual void Tick(float delta)
    {
        foreach (var entity in _entities)
        {
            entity.Tick(delta);
        }
    }
    public virtual void Render()
    {
        Scale = Math.Min((float)Raylib.GetScreenWidth() / Engine.GameScreenWidth, (float)Raylib.GetScreenHeight() / Engine.GameScreenHeight);

        Raylib.BeginTextureMode(SceneRenderTexture);
        Raylib.ClearBackground(Color.Black);
        Raylib.DrawText("If executed inside a window,\nyou can resize the window,\nand see the screen scaling!", 10, 25, 20, Color.White);

        if (Background is not null)
        {
            Raylib.DrawTexturePro(
                (Texture2D)Background,
                new Rectangle
                {
                    X = 0,
                    Y = 0,
                    Width = 1024,
                    Height = 1024,
                },
                new Rectangle
                {
                    X = 0,
                    Y = 0,
                    Width = 1024,
                    Height = 1024,
                },
                Vector2.Zero,
                0,
                Color.White
            );
        }

        foreach (var entity in _entities)
        {
            entity.Render();
        }

        Raylib.EndTextureMode();
    }

    public void Destroy(AbstractEntity entity)
    {
        _destructionQueue.Enqueue(entity);
    }

    public void DestroyQueued()
    {
        while (_destructionQueue.Count > 0)
        {
            var entity = _destructionQueue.Dequeue();
            entity.OnDestroy();
            _entities.Remove(entity);
        }
    }
}