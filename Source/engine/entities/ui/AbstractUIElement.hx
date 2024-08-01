package engine.entities.ui;

import openfl.Assets;
import openfl.text.Font;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.geom.Point;
import engine.entities.core.AbstractGraphicalEntity;

class AbstractUIElement extends AbstractGraphicalEntity {
    var callback:() -> Void;
    var textfield:TextField;
    function new(label:String, callback:() -> Void, position:Point = null){
        super(position);
        
        this.textfield = new TextField();
        this.textfield.text = label;
        this.textfield.textColor = 0xffffffff;
        var font = Assets.getFont("assets/fonts/terminus-ttf-4.49.3/TerminusTTF-4.49.3.ttf");
        this.textfield.setTextFormat(new TextFormat(font.name, 24, null, null, null, null, null, null, CENTER));
        this.callback = callback;
        this.sprite.addChild(textfield);
        textfield.autoSize = CENTER;
        textfield.width = textfield.textWidth+200;
    }
    public function fire(){
        callback();
    }
    override function tick(){
        super.tick();
    }
}