package engine.core;

import haxe.Int64;

abstract class AbstractEntity {
	private var engine:Engine;
	private var id:Int64;

	public function new(engineRef:Engine) {
		engine = engineRef;
	}

	public function setId(id: Int64): Void {
		this.id = id;
	}

	public function start():Void {}

	public function tick():Void {}

	public function destroy():Void {
		engine.activeScene.destroy(id);
	}
}
