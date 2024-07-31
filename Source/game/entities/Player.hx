package game.entities;

import engine.Engine;
import engine.Input;
import engine.core.AbstractSprite;

class Player extends AbstractSprite {
	public function new() {
		super("assets/thing.png");
	}

	override function start() {
		sprite.scaleX = 2;
		sprite.scaleY = 2;

		Engine.activeScene.add(new Timer(5, function() {
			trace("TIMER :D");
		}, true));
	}

	override function tick() {
		super.tick();
		var dir = Input.getPoint(KEY_MOVERIGHT, KEY_MOVELEFT, KEY_MOVEDOWN, KEY_MOVEUP);
		translate(dir);
	}
}
