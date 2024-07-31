package game.entities.ui;

import openfl.text.TextField;
import engine.core.ui.AbstractUIElement;

class MainMenuButton extends AbstractUIElement{
    public function new(label:String, callback:()->Void){
        super(label,callback);
    }
}