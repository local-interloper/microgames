package game.entities;

import engine.Engine;
import engine.Input;
import engine.core.AbstractSpriteEntity;

class Player extends AbstractSpriteEntity {
	public function new() {
		super("assets/thing.png");
	}

	override function start() {
		sprite.scaleX = 2;
		sprite.scaleY = 2;
	}

	override function tick() {
		super.tick();
		var dir = Input.getPoint(KEY_MOVERIGHT, KEY_MOVELEFT, KEY_MOVEDOWN, KEY_MOVEUP);
		translate(dir);

        if(Input.isKeyPressed(KEY_ACTION)) {
            destroy();
        }
	}
}
