package engine.entities.util;

import engine.entities.core.AbstractSpriteEntity;

class Background extends AbstractSpriteEntity {
	public function new(spritePath:String, scale: Float = 1.0) {
		super(spritePath, TOP_LEFT);
		sprite.scaleX = scale;
		sprite.scaleY = scale;
	}
}
