namespace engine;

using System.Numerics;
using engine.core;
using game.testclasses;
using Raylib_cs;

public static class Engine
{
    public static AbstractScene? Scene;


    public static int GameScreenWidth = 1024;
    public static int GameScreenHeight = 1024;
    public static int InitWindowWidth = 1024;
    public static int InitWindowHeight = 1024;
    public static void Run()
    {
        Raylib.SetConfigFlags(ConfigFlags.ResizableWindow);
        Raylib.InitWindow(InitWindowWidth, InitWindowHeight, "microgames");
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
            Raylib.BeginDrawing();
            Raylib.ClearBackground(Color.Black);
            Raylib.DrawTexturePro(
                Scene.SceneRenderTexture.Texture, 
                new Rectangle(0.0f, 0.0f, (float)Scene.SceneRenderTexture.Texture.Width,(float)-Scene.SceneRenderTexture.Texture.Height),
                new Rectangle( 
                    (Raylib.GetScreenWidth() - (GameScreenWidth*Scene.Scale))*0.5f, 
                    (Raylib.GetScreenHeight() - (GameScreenHeight*Scene.Scale))*0.5f,
                    GameScreenWidth*Scene.Scale, GameScreenHeight*Scene.Scale),
                new Vector2(0,0),
                0,
                Color.White
            );
            Console.WriteLine(Scene.Scale);
            Raylib.EndDrawing();
            Scene.DestroyQueued();
        }
    }
}