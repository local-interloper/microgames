package engine;

import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.display.Sprite;
import game.scenes.ExampleScene;
import engine.core.AbstractScene;

class Engine {
	public var activeScene:AbstractScene = null;

	var root:Sprite;

	public function new(root:Sprite) {
		this.root = root;
		root.addEventListener(Event.ADDED_TO_STAGE,init);
	}

	public function init(e:Event) {
		root.stage.addEventListener(Event.ENTER_FRAME, engineTick);
		root.stage.addEventListener(KeyboardEvent.KEY_DOWN, Input.onKeyDown);
		root.stage.addEventListener(KeyboardEvent.KEY_UP, Input.onKeyUp); 

		loadScene(new ExampleScene(this));
	}

	public function engineTick(e:Event) {
		if (activeScene == null)
			return;

		activeScene.tick();
	}

	public function loadScene(scene:AbstractScene) {
		if (activeScene != null)
			activeScene.clear();

		activeScene = scene;

		scene.init(root);
		scene.start();
	}
}
