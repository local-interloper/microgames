package game.entities.ui;

import engine.entities.ui.AbstractUIElement;
import openfl.text.TextField;

class MainMenuButton extends AbstractUIElement{
    public function new(label:String, callback:()->Void){
        super(label,callback);
    }
    public function focus(){
        textfield.textColor = 0xffff0000;
    }
    public function unfocus(){
        textfield.textColor = 0x00000000;
    }
}