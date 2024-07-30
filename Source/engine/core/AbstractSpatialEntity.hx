package engine.core;

import openfl.geom.Point;

class AbstractSpatialEntity extends AbstractEntity {
    var position: Point;

    function new(position: Point){
        super();

        this.position = position;
    }
}