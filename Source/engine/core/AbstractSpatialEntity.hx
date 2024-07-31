package engine.core;

import openfl.geom.Point;

class AbstractSpatialEntity extends AbstractEntity {
    var position: Point;

    function new(position: Point = null){
        this.position != null ? this.position : new Point(0,0);
        super();

        this.position = position;
    }

    function translate(vel: Point) {
        this.position = this.position.add(vel);
    }
}