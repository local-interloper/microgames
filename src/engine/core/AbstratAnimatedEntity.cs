using System.Numerics;
using engine.types.animation;
using Raylib_cs;

namespace engine.core;

public class AbstractAnimatedEntity : AbstractSpatialEntity
{
    private Texture2D _atlas;
    private Dictionary<string, Animation> _animations = new();
    private AnimatedEnityData _data;
    private AnimatdEntityState _state;
    private Animation _currentAnimation;


    public AbstractAnimatedEntity(AnimatedEnityData data, Vector2 position) : base()
    {
        _data = data;
        _atlas = AssetServer.GetTexture(data.AtlasPath);
        foreach (var animation in data.Animations)
        {
            _animations.Add(animation.Name, animation);
        }
        _currentAnimation = _animations.Values.First();
    }

    public void PlayAnimation(string animationName)
    {
        if (!_animations.ContainsKey(animationName))
        {
            return;
        }

        _currentAnimation = _animations[animationName];
        _state = new AnimatdEntityState
        {
            FrameIndex = 0,
            FrameTimer = _currentAnimation.FrameTime
        };
    }

    public override void Tick(double delta)
    {
        base.Tick(delta);
        _state.FrameTimer -= delta;
        if (_state.FrameTimer <= 0)
        {
            _state.FrameIndex++;
            _state.FrameTimer = _currentAnimation.FrameTime;
        }

        if (_state.FrameIndex >= _currentAnimation.FrameCount)
        {
            _state.FrameIndex = 0;
        }
    }

    public override void Render()
    {
        Raylib.DrawTexturePro(
            _atlas,
             new Rectangle
             {
                 X = _state.FrameIndex * _data.TileSize.X,
                 Y = _currentAnimation.Index * _data.TileSize.Y,
                 Width = _data.TileSize.X,
                 Height = _data.TileSize.Y,
             },
            new Rectangle
            {
                X = Position.X,
                Y = Position.Y,
                Width = _data.TileSize.X * Scale,
                Height = _data.TileSize.Y * Scale,
            },
            new Vector2(0, 0),
            Rotation,
            Color.White
        );
    }
}