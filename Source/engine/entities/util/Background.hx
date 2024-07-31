package engine.entities.util;

import engine.entities.core.AbstractSpriteEntity;

class Background extends AbstractSpriteEntity {
	public function new(spritePath:String) {
		super(spritePath, TOP_LEFT);
	}
}
