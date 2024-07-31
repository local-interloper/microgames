package engine.entities.core;

import openfl.geom.Point;

class AbstractSpatialEntity extends AbstractEntity {
    var position: Point;

    function new(position: Point = null){
        this.position = position ;
        this.position = this.position != null ? this.position : new Point(0,0);
        super();
    }

    public function translate(vel: Point) {
        this.position = this.position.add(vel);
    }
    public function getPos(){
        return this.position;
    }
    public function setPos(position:Point){
        this.position = position;
    }
}