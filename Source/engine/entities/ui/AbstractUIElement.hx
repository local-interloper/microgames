package engine.entities.ui;

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
        this.callback = callback;
        this.sprite.addChild(textfield);
    }
    public function fire(){
        callback();
    }
    override function tick(){
        super.tick();
    }
}