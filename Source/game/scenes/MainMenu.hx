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
    public var selectedIndex = 0;
    public override function init(root:Sprite){
        super.init(root);
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
        buttonList[0].focus();
        for (i in 0...buttonList.length){
            if(buttonList[i-1] == null) continue;
            var offset = buttonList[i-1].getPos().clone().add(new Point(0,20));
            buttonList[i].setPos(offset); 
            trace(buttonList[i-1].getPos());
            this.add(buttonList[i]);
        }
    }
    
    private var keyStateMap:Map<GameKey,Bool> = [KEY_MOVEDOWN => false, KEY_MOVEUP => false, KEY_ACTION => false];
    
    public function navigateMenu(dir:Int){
        buttonList[selectedIndex].unfocus();
        if(dir > 0) selectedIndex++;
        else selectedIndex--;
        if (selectedIndex < 0) selectedIndex = buttonList.length-1;
        if (selectedIndex > buttonList.length-1) selectedIndex = 0;
    }
    
    public function handleKey(key:GameKey, locked:Bool){
        if(locked && Input.keyStateMap.get(key)) return;
        if(locked) { keyStateMap.set(key,false); return; }

        if(Input.keyStateMap.get(key)){
            trace(key);
            if(key == KEY_ACTION) { buttonList[selectedIndex].fire(); keyStateMap.set(key, true); return;}
            buttonList[selectedIndex].unfocus();
            if(key == KEY_MOVEUP) navigateMenu(-1);
            if(key == KEY_MOVEDOWN) navigateMenu(1);
            buttonList[selectedIndex].focus();
            keyStateMap.set(key, true);
        }
    }
    
    public override function tick(){
        super.tick();
        for(kvp in keyStateMap.keyValueIterator()){
            handleKey(kvp.key,kvp.value);
        }
    }
}