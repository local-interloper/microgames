package;

import openfl.display.Sprite;
import engine.Engine;

class Main extends Sprite
{
	public function new() {
		super();
		Engine.bootstrap(this);
	}
}
