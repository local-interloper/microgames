package engine.entities.core;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.net.dns.AAAARecord;
import openfl.display.Tilemap;
import openfl.geom.Rectangle;

using Lambda;

import openfl.Assets;
import openfl.display.Tileset;
import openfl.events.Event;
import openfl.events.TimerEvent;
import openfl.utils.Timer;
import engine.types.Animation;

abstract class AbstractAnimatedSpriteEntity extends AbstractGraphicalEntity {
	var timer:Timer;
	var animations:Map<String, Animation> = [];
	var bitmap:Bitmap;
	public var tilemap:Tileset;

	public function new(bitmapPath:String, animations:Array<Animation>) {
		super();

		for (animation in animations) {
			this.animations.set(animation.name, animation);
		}

		var bitmapData = Assets.getBitmapData(bitmapPath);
		var frames = [for (item in animations.iterator()) item].fold(function(animation, acc:Array<Rectangle>) {
			return acc.concat(animation.frames);
		}, []);
		
		
			// tilemap = new Tilemap(bitmapData, rects);
		bitmap = new Bitmap();
		

		
	}
	public function playAnimation(animationName:String) {
		var animation = animations.get(animationName);
		timer = new Timer(1/animation.framerate);
		timer.start();
		timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(e:Event) {
			progressFrame();
		});
	}

	public function progressFrame() {
		trace("Progress frame");
	}
}
