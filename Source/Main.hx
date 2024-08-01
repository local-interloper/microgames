package;

import openfl.Lib;
import openfl.display.BitmapData;
import openfl.geom.Point;
import openfl.Assets;
import engine.SpriteSheet;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import engine.Engine;
using engine.extensions.BitmapExtensions.BitmapExtender;

class Main extends Sprite
{
	public function new() {
		super();
		Engine.bootstrap(this);
	}
}