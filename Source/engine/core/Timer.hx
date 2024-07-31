package game.entities;

import engine.Engine;
import engine.core.AbstractEntity;

class Timer extends AbstractEntity {
	var defaultTime:Float;
	var time:Float;
	var callback:() -> Void;
	var repeating:Bool;

	public function new(secs:Float, callback:() -> Void, repeating:Bool = false) {
		super();

		defaultTime = secs;
		time = secs;

		this.callback = callback;
		this.repeating = repeating;
	}

	override function tick() {
		super.tick();
		time -= Engine.delta;
		if (time <= 0) {
			callback();
			if (repeating) {
				reset();
			} else {
				destroy();
			}
		}
	}

	function reset() {
		time = defaultTime;
	}
}
