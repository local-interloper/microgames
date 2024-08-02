namespace engine;

using engine.core;
using game.testclasses;
using Raylib_cs;

public static class Engine
{
    public static AbstractScene? Scene;

    public static void Run()
    {
        Raylib.InitWindow(1024, 1024, "microgames");
        Raylib.SetTargetFPS(300);

        LoadScene(new TestScene());

        Mainloop();

        Raylib.CloseWindow();
    }

    public static void LoadScene(AbstractScene newScene)
    {
        Scene = newScene;
        Scene.Start();
    }

    public static void Mainloop()
    {
        while (!Raylib.WindowShouldClose())
        {
            if (Scene is null)
            {
                return;
            }

            Scene.Tick(Raylib.GetFrameTime());
            Scene.Render();
            Scene.DestroyQueued();
        }
    }
}