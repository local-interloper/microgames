namespace engine.entities.util;

using engine;
using engine.entities.core;

public delegate void TimerCallback();

class TimerEntity : AbstractEntity
{
    public float DefaultTime;

    public event TimerCallback? Finished;

    public float Time;

    private bool _isRunning;

    public bool Repeat = false;


    public TimerEntity(float defaultTime) : base()
    {
        DefaultTime = defaultTime;
        Time = DefaultTime;
    }

    public void Begin()
    {
        _isRunning = true;
    }

    public void Stop()
    {
        _isRunning = false;
    }

    public void Reset()
    {
        Time = DefaultTime;
    }

    public override void Tick(float delta)
    {
        base.Tick(delta);

        if (!_isRunning)
        {
            return;
        }

        Time -= delta;

        if (Time > 0)
        {
            return;
        }

        Finished?.Invoke();

        if (!Repeat)
        {
            Engine.Scene?.Destroy(this);
            return;
        }

        Time = DefaultTime;
    }
}