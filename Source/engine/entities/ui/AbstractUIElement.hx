package engine.entities.ui;

import openfl.text.TextField;
import openfl.geom.Point;
import engine.entities.core.AbstractGraphicalEntity;

class AbstractUIElement extends AbstractGraphicalEntity {
    var callback:() -> Void;
    var selected:Bool = false;
    var textfield:TextField;
    function new(label:String, callback:() -> Void, position:Point = null){
        super(position);
        this.textfield = new TextField();
        textfield.text = label;
        this.callback = callback;
        this.sprite.addChild(textfield);
    }
    function onSelect(){
        selected = true;
    }
    function onFire(){
        if (!selected) return;
        callback();
    }
    override function tick(){
        super.tick();
    }
}