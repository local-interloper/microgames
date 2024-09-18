namespace engine;

using System.Numerics;
using engine.core;
using engine.entities.core;
using game.microgames;
using Raylib_cs;

public static class Engine
{
    public static AbstractScene? Scene;
    private static AbstractScene? _nextScene;


    public static int GameScreenWidth = 1024;
    public static int GameScreenHeight = 1024;
    public static int InitWindowWidth = 1024;
    public static int InitWindowHeight = 1024;
    public static bool StartFullScreen = true;
    public static void Run()
    {
        Raylib.SetConfigFlags(ConfigFlags.ResizableWindow);
        Raylib.InitWindow(
            StartFullScreen ? Raylib.GetMonitorHeight(Raylib.GetCurrentMonitor()) : InitWindowWidth,
            StartFullScreen ? Raylib.GetMonitorWidth(Raylib.GetCurrentMonitor()) : InitWindowHeight, "microgames"
        );
        Raylib.SetTargetFPS(300);
        Raylib.MaximizeWindow();
        Raylib.ToggleFullscreen();

        LoadScene(new MicrogamesScene());

        Mainloop();

        Raylib.CloseWindow();
    }

    public static void LoadScene(AbstractScene newScene)
    {
        _nextScene = newScene;
    }

    public static void Mainloop()
    {
        while (!Raylib.WindowShouldClose())
        {
            HandleSceneChange();

            if (Scene is null)
            {
                return;
            }

            Scene.DestroyQueued();

            Scene.Tick(Raylib.GetFrameTime());

            Scene.Render();

            Console.WriteLine(Raylib.GetMonitorWidth(Raylib.GetCurrentMonitor()));

            Raylib.BeginDrawing();
            Raylib.ClearBackground(Color.Black);
            Raylib.DrawTexturePro(
                Scene.SceneRenderTexture.Texture,
                new Rectangle(0.0f, 0.0f, Scene.SceneRenderTexture.Texture.Width, -Scene.SceneRenderTexture.Texture.Height),
                new Rectangle(
                    ((Raylib.IsWindowFullscreen() ? Raylib.GetMonitorWidth(Raylib.GetCurrentMonitor()) : Raylib.GetScreenWidth()) - (GameScreenWidth * Scene.Scale)) * 0.5f,
                    ((Raylib.IsWindowFullscreen() ? Raylib.GetMonitorHeight(Raylib.GetCurrentMonitor()) : Raylib.GetScreenHeight()) - (GameScreenHeight * Scene.Scale)) * 0.5f,
                    GameScreenWidth * Scene.Scale,
                    GameScreenHeight * Scene.Scale
                ),
                new Vector2(0, 0),
                0,
                Color.White
            );
            Raylib.EndDrawing();
        }
    }

    private static void HandleSceneChange()
    {
        if (_nextScene is null)
            return;

        Scene = _nextScene;
        _nextScene = null;

        Scene.Start();
    }
}