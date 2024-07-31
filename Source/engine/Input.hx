package engine;

import openfl.geom.Point;
import openfl.ui.Keyboard in Kb;
import openfl.events.KeyboardEvent;

enum GameKey {
	KEY_MOVEUP;
	KEY_MOVELEFT;
	KEY_MOVEDOWN;
	KEY_MOVERIGHT;
	KEY_ACTION;
	KEY_ACTION2;
}

class Input {
	public static var keyBinds:Map<Int, GameKey> = [
		Kb.W => KEY_MOVEUP,
		Kb.A => KEY_MOVELEFT,
		Kb.S => KEY_MOVEDOWN,
		Kb.D => KEY_MOVERIGHT,
		Kb.K => KEY_ACTION,
		Kb.L => KEY_ACTION2
	];
	public static var keyStateMap:Map<GameKey, Bool> = [
		KEY_MOVEUP => false,
		KEY_MOVELEFT => false,
		KEY_MOVEDOWN => false,
		KEY_MOVERIGHT => false,
		KEY_ACTION => false,
		KEY_ACTION2 => false
	];

	// I hope this function handler is so bad I am never allowed to write function handlers again.
	public static function onKeyDown(e:KeyboardEvent) {
		if (!keyBinds.exists(e.keyCode))
			return;
		keyStateMap.set(keyBinds.get(e.keyCode), true); // Here we don't dereference a null pointer.
	}

	// I hope this function handler also is so bad I am never allowed to write function handlers again.
	public static function onKeyUp(e:KeyboardEvent) {
		if (!keyBinds.exists(e.keyCode))
			return;
		keyStateMap.set(keyBinds.get(e.keyCode), false); // Here we don't dereference a null pointer.
	}

	public static function isKeyPressed(key:GameKey):Bool {
		return keyStateMap[key];
	}

	public static function getAxis(positive:GameKey, negative:GameKey):Int {
		var value = 0;

		if (isKeyPressed(positive))
			value += 1;
		if (isKeyPressed(negative))
			value -= 1;

		return value;
	}

	public static function getPoint(xPositive:GameKey, xNegative:GameKey, yPositive:GameKey, yNegative, normalized:Bool = true):Point {
		var point = new Point(getAxis(xPositive, xNegative), getAxis(yPositive, yNegative));

		if (normalized)
			point.normalize(1.0);

		return point;
	}
}
