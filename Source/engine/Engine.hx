package engine;

import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.display.Sprite;
import game.scenes.ExampleScene;
import engine.core.AbstractScene;
import Sys.time;

class Engine {
	public static var activeScene:AbstractScene = null;

	static private var root:Sprite;

	public static function bootstrap(root:Sprite) {
		Engine.root = root;
		root.addEventListener(Event.ADDED_TO_STAGE,init);
	}

	public static function init(e:Event) {
		root.stage.addEventListener(Event.ENTER_FRAME, engineTick);
		root.stage.addEventListener(KeyboardEvent.KEY_DOWN, Input.onKeyDown);
		root.stage.addEventListener(KeyboardEvent.KEY_UP, Input.onKeyUp); 

		loadScene(new ExampleScene());
	}
	private static var lastTickTime:Float = 0;
	public static var delta:Float = 0;
	public static function engineTick(e:Event) {
		delta = Sys.time() * 1000 - lastTickTime;
		trace(delta);
		if (activeScene == null)
			return;
		activeScene.tick();
		lastTickTime = Sys.time() * 1000;
	}

	public static function loadScene(scene:AbstractScene) {
		if (activeScene != null)
			activeScene.clear();

		activeScene = scene;

		scene.init(root);
		scene.start();
	}
}
