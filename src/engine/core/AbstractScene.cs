using Raylib_cs;

namespace engine.core;

public class AbstractScene
{
    private static HashSet<AbstractEntity> _entities = new();
    private static Queue<AbstractEntity> _destructionQueue = new();

    public void AddEntity(AbstractEntity entity)
    {
        _entities.Add(entity);
    }

    public void RemoveEntity(AbstractEntity entity)
    {
        _entities.Remove(entity);
    }

    public virtual void Start()
    {

    }

    public virtual void Tick(double delta)
    {
        foreach (var entity in _entities)
        {
            entity.Tick(delta);
        }
    }

    public virtual void Render()
    {
        Raylib.BeginDrawing();
        Raylib.ClearBackground(Color.Black);

        foreach (var entity in _entities)
        {
            entity.Render();
        }

        Raylib.EndDrawing();
    }

    public void Destroy(AbstractEntity entity) {
        _destructionQueue.Enqueue(entity);
    }

    public void DestroyQueued() {
        while (_destructionQueue.Count > 0) {
            var entity = _destructionQueue.Dequeue();
            entity.OnDestroy();
            _entities.Remove(entity);
        }
    }
}