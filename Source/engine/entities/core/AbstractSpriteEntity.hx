package engine.entities.core;

import engine.types.AnchorPosition;
import openfl.display.Bitmap;
import openfl.geom.Point;
import openfl.Assets;

class AbstractSpriteEntity extends AbstractGraphicalEntity {
	var anchorPosition:AnchorPosition;

	private var bitmap:Bitmap;

	function new(spritePath:String, anchorPosition:AnchorPosition = CENTER, position:Point = null) {
		super(position);

		this.anchorPosition = anchorPosition;

		loadBitmap(spritePath);
        updateAnchorPosition();
	}

	override function tick() {
		super.tick();
	}

	override function destroy() {
		super.destroy();

		sprite.removeChildren();
	}

	private function loadBitmap(path:String) {
		var bitmapData = Assets.getBitmapData(path);
		bitmap = new Bitmap(bitmapData);

		sprite.addChild(bitmap);
	}

	private function updateAnchorPosition() {
		switch (anchorPosition) {
			case TOP_LEFT:
				bitmap.x = 0;
				bitmap.y = 0;

			case TOP:
				bitmap.x = -bitmap.width / 2;
				bitmap.y = 0;

			case TOP_RIGHT:
				bitmap.x = -bitmap.width;
				bitmap.y = 0;

			case CENTER_LEFT:
				bitmap.x = 0;
				bitmap.y = -bitmap.height / 2;

			case CENTER:
				bitmap.x = -bitmap.width / 2;
				bitmap.y = -bitmap.height / 2;

			case CENTER_RIGHT:
				bitmap.x = -bitmap.width;
				bitmap.y = -bitmap.height / 2;

			case BOTTOM_LEFT:
				bitmap.x = 0;
				bitmap.y = -bitmap.height;

			case BOTTOM:
				bitmap.x = -bitmap.width / 2;
				bitmap.y = -bitmap.height;

			case BOTTOM_RIGHT:
				bitmap.x = -bitmap.width;
				bitmap.y = -bitmap.height;
		}
	}
}
