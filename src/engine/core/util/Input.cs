using System.Numerics;
using Raylib_cs;

namespace engine.core.util;

enum GameKey{
    KeyUp,
    KeyDown,
    KeyLeft,
    KeyRight,
    KeyAction,
    KeyAction2,
    KeyMenuSelect
}



enum Axis
{
    X,
    Y
}

static class Input
{
    public static Dictionary<GameKey,bool> GetKeyStates(){
        var dict = new Dictionary<GameKey,bool>();
        dict.Add(GameKey.KeyUp,Raylib.IsKeyDown(KeyboardKey.W));
        dict.Add(GameKey.KeyDown,Raylib.IsKeyDown(KeyboardKey.S));
        dict.Add(GameKey.KeyLeft,Raylib.IsKeyDown(KeyboardKey.A));
        dict.Add(GameKey.KeyRight,Raylib.IsKeyDown(KeyboardKey.D));
        dict.Add(GameKey.KeyAction,Raylib.IsKeyDown(KeyboardKey.J));
        dict.Add(GameKey.KeyAction2,Raylib.IsKeyDown(KeyboardKey.K));
        dict.Add(GameKey.KeyMenuSelect,Raylib.IsKeyDown(KeyboardKey.Space));
        return dict;
    }

   
    public static Vector2 GetAxes(){
        var xComponent = 0;
        var yComponent = 0;
        if(GetKeyStates().GetValueOrDefault(GameKey.KeyUp)) yComponent--;
        if(GetKeyStates().GetValueOrDefault(GameKey.KeyDown)) yComponent++;
        if(GetKeyStates().GetValueOrDefault(GameKey.KeyLeft)) xComponent--;
        if(GetKeyStates().GetValueOrDefault(GameKey.KeyRight)) xComponent++;
        return new Vector2(xComponent,yComponent);
    }
    public static float GetAxis(Axis axis){
        return axis == Axis.X ? GetAxes().X: GetAxes().Y;
    }
}