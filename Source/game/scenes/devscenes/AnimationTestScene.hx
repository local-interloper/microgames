package game.scenes.devscenes;

import engine.AnimationTest;
import openfl.display.Sprite;
import engine.entities.core.AbstractAnimatedSpriteEntity;
import openfl.geom.Point;
import openfl.utils.Assets;
import engine.SpriteSheet;
import engine.types.Animation;
import engine.Engine;
import engine.entities.core.AbstractScene;
// import engine.entities.core.AbstractAnimatedEntity;

class AnimationTestScene extends AbstractScene {
    public function new(){
        super();
    }

    override function start() {
        var sprite:Sprite = new AnimationTest();
        root.addChild(sprite);
        
        
        // Engine.activeScene.add(new AbstractAnimatedEntity());
    }
}