package mkv25.touch.test;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author John Beech
 */
class Counter
{
	var artwork:Sprite;
	var text:TextField;
	
	var name:String;
	var count:Int;
	
	public function new() 
	{
		artwork = new Sprite();
		text = Text.makeTextField("fonts/finkheavy.ttf", 26, 0xFFDDCC, TextFormatAlign.CENTER);
		text.width = 400;
		text.height = 50;
		
		name = "Unnamed";
		count = 0;
		
		artwork.addChild(text);
	}
	
	public function move(x:Float, y:Float):Counter
	{
		artwork.x = x;
		artwork.y = y;
		
		return this;
	}
	
	public function label(label:String):Counter
	{
		name = label;
		draw();
		
		return this;
	}
	
	public function reset():Counter
	{
		count = 0;
		draw();
		
		return this;
	}
	
	public function increment():Counter
	{
		count = count + 1;
		draw();
		
		return this;
	}
	
	function draw():Void
	{
		text.text = name + " : " + count;
	}
	
	public static function make(stage:DisplayObjectContainer):Counter
	{
		var counter = new Counter();
		
		stage.addChild(counter.artwork);
		
		return counter;
	}
	
	
	
}