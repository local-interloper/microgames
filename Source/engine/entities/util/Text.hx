package engine.entities.util;

import openfl.text.TextFormat;
import openfl.Assets;
import openfl.text.TextField;
import openfl.geom.Point;
import engine.entities.core.AbstractGraphicalEntity;

class Text extends AbstractGraphicalEntity {
    var textField: TextField;

    public function new(text: String, position: Point = null) {
        super(position);
        var font = Assets.getFont("assets/fonts/terminus-ttf-4.49.3/TerminusTTF-4.49.3.ttf");

        textField = new TextField();
        textField.text = text;
        this.textField.setTextFormat(new TextFormat(font.name, 24, null, null, null, null, null, null, CENTER));
        this.textField.autoSize = LEFT;
        sprite.addChild(textField);
    }
}