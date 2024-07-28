package engine;

import openfl.ui.Keyboard in Kb;
import openfl.events.KeyboardEvent;

enum GameKeys {
	KEY_MOVEUP;
	KEY_MOVELEFT;
	KEY_MOVEDOWN;
	KEY_MOVERIGHT;
	KEY_ACTION;
	KEY_ACTION2;
}

class Input {
	public static var keyBinds:Map<Int, GameKeys> = [
		Kb.W => KEY_MOVEUP,
		Kb.A => KEY_MOVELEFT,
		Kb.S => KEY_MOVEDOWN,
		Kb.D => KEY_MOVERIGHT,
		Kb.K => KEY_ACTION,
		Kb.L => KEY_ACTION2
	];
	public static var keyStateMap:Map<GameKeys, Bool> = [
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
}
