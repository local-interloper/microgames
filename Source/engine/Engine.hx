package engine;

import openfl.geom.Point;
import game.scenes.MainMenu;
import openfl.Lib;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.display.Sprite;
import engine.entities.core.AbstractScene;
import game.scenes.IntermissionScreen;

class Engine {
	public static var activeScene:AbstractScene = null;

	static private var root:Sprite;

	public static function bootstrap(root:Sprite) {
		Engine.root = root;
		root.addEventListener(Event.ADDED_TO_STAGE,init);
	}

	static function centerScreen(){
		var scalar = (root.stage.stageHeight/1024);
		var offset = new Point(root.stage.stageWidth/2 - (1024*scalar)/2, root.stage.stageHeight/2);
		var screenMask = new Sprite();
		root.x = offset.x;
		screenMask.x = offset.x;
		screenMask.graphics.beginFill(0x000000);
		screenMask.graphics.drawRect(0,0,1024,1024);
		root.stage.mask = screenMask;
		root.stage.addChild(screenMask);
		// root.y = centerPoint.y;
		root.scaleX = root.scaleY = scalar;
		screenMask.scaleX = screenMask.scaleY = scalar;

	}

	public static function init(e:Event) {
		root.stage.addEventListener(Event.ENTER_FRAME, engineTick);
		root.stage.addEventListener(KeyboardEvent.KEY_DOWN, Input.onKeyDown);
		root.stage.addEventListener(KeyboardEvent.KEY_UP, Input.onKeyUp); 
		Lib.current.stage.displayState = FULL_SCREEN_INTERACTIVE;
		centerScreen();
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
		Input.tick();
	}

	public static function loadScene(scene:AbstractScene) {
		if (activeScene != null)
			activeScene.clear();

		activeScene = scene;

		scene.init(root);
		scene.start();
	}
}

