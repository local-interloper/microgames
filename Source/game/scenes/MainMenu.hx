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
        buttonList[0].setPos(buttonList[0].getPos().add(new Point(1024/2-148,0)));
        for (i in 0...buttonList.length){
            if(i != 0) buttonList[i].setPos(buttonList[i-1].getPos().clone().add(new Point(0,20))); 
            this.add(buttonList[i]);
        }
        trace(buttonList);
    }
        
    public function navigateMenu(dir:Int){
        buttonList[selectedIndex].unfocus();
        if(dir > 0) selectedIndex++;
        else selectedIndex--;
        if (selectedIndex < 0) selectedIndex = buttonList.length-1;
        if (selectedIndex > buttonList.length-1) selectedIndex = 0;
    }
    
    public function handleKey(key:GameKey){
        var keyState = Input.keyStateMap.get(key);
        var lastKeyState = Input.lastKeyState.get(key);
        if(lastKeyState) return;
        if(keyState){
            trace(key);
            if(key == KEY_ACTION) buttonList[selectedIndex].fire();
            buttonList[selectedIndex].unfocus();
            if(key == KEY_MOVEUP) navigateMenu(-1);
            if(key == KEY_MOVEDOWN) navigateMenu(1);
            buttonList[selectedIndex].focus();
        }
    }
    
    public override function tick(){
        super.tick();
        for(kvp in Input.keyStateMap.keyValueIterator()){
            handleKey(kvp.key);
        }
    }
}