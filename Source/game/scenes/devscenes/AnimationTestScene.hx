package game.scenes.devscenes;

import engine.Engine;
import engine.entities.core.AbstractScene;
import engine.entities.core.AbstractAnimatedEntity;

class AnimationTestScene extends AbstractScene {
    public function new(){
        super();
    }

    override function start() {
        Engine.activeScene.add(new AbstractAnimatedEntity("assets/testanimation.png"));
    }
}