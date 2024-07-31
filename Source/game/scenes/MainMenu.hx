package game.scenes;

import openfl.display.Sprite;
import game.entities.ui.MainMenuButton;
import engine.core.AbstractScene;

class MainMenu extends AbstractScene {
    public override function init(root:Sprite){
        super.init(root);
        var testButton:MainMenuButton = new MainMenuButton("kanker", ()->{
            trace("imma firin ma lazor");
        });
        add(testButton);
    }
}