package engine;

import game.scenes.MainMenu;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.display.Sprite;
import engine.core.AbstractScene;
import game.scenes.IntermissionScreen;

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

		loadScene(new MainMenu());
	}
	private static var lastTickTime:Float = 0;
	public static var delta:Float = 0;
	public static function engineTick(e:Event) {
		if(lastTickTime != 0) 
		delta = Sys.time() - lastTickTime;
		if (activeScene == null)
			return;
		activeScene.tick();
		lastTickTime = Sys.time();
	}

	public static function loadScene(scene:AbstractScene) {
		if (activeScene != null)
			activeScene.clear();

		activeScene = scene;

		scene.init(root);
		scene.start();
	}
}

