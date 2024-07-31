package game.scenes;

import openfl.geom.Point;
import engine.Input;
import lime.app.Application;
import openfl.display.Window;
import engine.Engine;
import openfl.display.Sprite;
import game.entities.ui.MainMenuButton;
import engine.entities.core.AbstractScene;



class MainMenu extends AbstractScene {
    public var buttonList:Array<MainMenuButton> = [];
    public override function init(root:Sprite){
        super.init(root);
        trace("perkele");
        buttonList = [
            new MainMenuButton("Start Game",()->{
                Engine.loadScene(new IntermissionScreen());
            }),
            new MainMenuButton("Settings",()->{
                trace("unimplemented");
            }),
            new MainMenuButton("Quit Game",()->{
                Application.current.window.close();
            })
        ];
        for (i in 0...buttonList.length){
            if(buttonList[i-1] == null) continue;
            var offset = buttonList[i-1].getPos().clone().add(new Point(0,20));
            buttonList[i].setPos(offset); 
            trace(buttonList[i-1].getPos());
            this.add(buttonList[i]);
        }
    }
    public var selectedIndex = 0;
    private var lockKeyMap:Map<GameKey,Bool> = [KEY_MOVEDOWN => false, KEY_MOVEUP => false, KEY_ACTION => false];
    public override function tick(){
        super.tick();
        if(Input.isKeyPressed(KEY_MOVEDOWN)&&!lockKeyMap.get(KEY_MOVEDOWN)){
            selectedIndex++; 
            lockKeyMap.set(KEY_MOVEDOWN,true);
        }
        else{
            lockKeyMap.set(KEY_MOVEDOWN,false);
        }
        if(Input.isKeyPressed(KEY_MOVEUP)&&!lockKeyMap.get(KEY_MOVEUP)){
            selectedIndex--; 
            lockKeyMap.set(KEY_MOVEUP,true);
        }
        else{
            lockKeyMap.set(KEY_MOVEUP,false);
        }
        if(selectedIndex < 0)                   selectedIndex = buttonList.length-1;
        if(selectedIndex > buttonList.length-1) selectedIndex = 0;
        if(Input.isKeyPressed(KEY_ACTION) && !lockKeyMap.get(KEY_ACTION)){
            lockKeyMap.set(KEY_ACTION,true);
        }
        else{
            lockKeyMap.set(KEY_ACTION,false);
        }
    }


}