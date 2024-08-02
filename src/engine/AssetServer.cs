using Raylib_cs;

public static class AssetServer
{
    static private Dictionary<string, Texture2D> _textureCache = new();

    static public Texture2D GetTexture(string path)
    {
        if (!_textureCache.ContainsKey(path))
        {
            _textureCache.Add(path, Raylib.LoadTexture(path));
        }

        return _textureCache[path];
    }
}