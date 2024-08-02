package game.scenes;

import engine.entities.util.Text;
import engine.entities.util.Background;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import game.microgames.balance.scenes.BalanceGame;
import engine.Engine;
import engine.entities.core.AbstractScene;

class IntermissionScreen extends AbstractScene {
	var registeredMicrogames:Array<() -> AbstractScene> = [function() return new BalanceGame()];
	var timer:Timer;

	override function start() {
		Engine.activeScene.add(new Background("assets/backgrounds/intermission.png", 2));
        Engine.activeScene.add(new Text("IMMINENT HOLDING WITH BOTH HANDS"));

		timer = new Timer(5000, 1);

		timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:TimerEvent) {
			Engine.loadScene(Random.fromIterable(registeredMicrogames)());
		});

		timer.start();
	}
}
