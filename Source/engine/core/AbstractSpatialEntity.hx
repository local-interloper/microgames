package engine.core;

import openfl.geom.Point;

class AbstractSpatialEntity extends AbstractEntity {
    var position: Point;

    function new(position: Point = null){
        this.position = position ;
        this.position = this.position != null ? this.position : new Point(0,0);
        trace(this.position);
        super();
    }

    function translate(vel: Point) {
        this.position = this.position.add(vel);
    }
}