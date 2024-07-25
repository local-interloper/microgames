package engine.core;

import openfl.display.Sprite;
import haxe.Int64;

abstract class AbstractScene {
	var entities = new Map<String, AbstractEntity>();
	var engine: Engine;
	var root:Sprite;
    var nextId: Int64 = 0;

    public function new(engineRef: Engine){
		engine = engineRef;
	}

	public function start() {
		for (entId in entities.keys()) {
			var ent = entities[entId];
			ent.start();
		}
	}

	public function tick() {
		for (entId in entities.keys()) {
			var ent = entities[entId];
			ent.tick();
		}
	}

	public function init(root:Sprite) {
		this.root = root;
	}

    public function add(entity: AbstractEntity) {
        var id = nextId;
        nextId += 1;

        entity.setId(id);
        entities.set(Std.string(id), entity);
    }

	public function destroy(entId:Int64) {
		entities.remove(Std.string(entId));
	}

	public function clear() {
		root.removeChildren();
	}
}
