package mkv25.touch.test;

import flash.display.Graphics;
import motion.Actuate;
import motion.easing.Quad;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;

class Particle extends Sprite
{
	public var and(get, null):Particle;
	
	var fillColor:Int = 0xFF9900;
	var size:Float = 40;

	public function new() 
	{
		super();
	}
	
	public function move(x:Float, y:Float):Particle
	{
		this.x = x;
		this.y = y;
		
		return this;
	}
	
	public function setup(fillColor:Int, size:Float):Particle
	{
		this.fillColor = fillColor;
		this.size = size;
		
		draw();
		
		return this;
	}
	
	public function draw():Void
	{
		var graphics:Graphics = this.graphics;
		
		var hs = size / 2;
		graphics.beginFill(fillColor);
		//graphics.drawRect( -hs, -hs, size, size);
		graphics.drawCircle(0, 0, hs);
		graphics.endFill();
	}
	
	function get_and():Particle
	{
		return this;
	}
	
	public function die():Void
	{
		Actuate.tween(this, 1.0, { alpha: 0.0, scaleX: 2.0, scaleY: 2.0 } ).ease(Quad.easeInOut).delay(0.1).onComplete(handle_dieComplete);
	}
	
	function handle_dieComplete():Void
	{
		if (this.parent != null)
		{
			this.parent.removeChild(this);
		}
	}
	
	public static function make(artwork:DisplayObjectContainer):Particle
	{
		var particle = new Particle();
		
		artwork.addChild(particle);
		
		return particle;
	}
	
}