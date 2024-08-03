namespace engine.entities.util;

using engine.entities.core;
using Raylib_cs;

public class TextEntity : AbstractSpatialEntity
{
    string Text;
    float FontSize = 20;
    float Spacing = 1;
    Color TextColor = Color.White;
    Font Font = Raylib.GetFontDefault();

    public TextEntity(string text) : base()
    {
        Text = text;
    }

    public override void Render()
    {
        Raylib.DrawTextPro(Font, Text, Position, Origin, Rotation, FontSize, Spacing, TextColor);
    }
}