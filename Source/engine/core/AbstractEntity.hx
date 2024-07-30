package engine.core;

import haxe.Int64;

abstract class AbstractEntity {
	private var id:Int64;

	public function new() {
		
	}

	public function setId(id: Int64): Void {
		this.id = id;
	}

	public function start():Void {}

	public function tick():Void {}

	public function destroy():Void {
		Engine.activeScene.destroy(id);
	}
}
