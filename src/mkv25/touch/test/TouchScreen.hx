package mkv25.touch.test;
import flash.display.Stage;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormatAlign;

class TouchScreen
{
	public var artwork:Sprite;
	public var background:CenteredBackground;
	
	var mouseDownCounter:Counter;
	var mouseUpCounter:Counter;
	var mouseClickCounter:Counter;
	var mouseMoveCounter_whileMouseUp:Counter;
	var mouseMoveCounter_whileMouseDown:Counter;
	
	var mouseDown:Bool = false;
	
	public function new() 
	{
		artwork = new Sprite();
	}
	
	public function setup(stage:Stage):Void
	{
		background = CenteredBackground.make().setAsset("img/fire-chibi.png");
		stage.addChild(artwork);
		
		mouseDownCounter = Counter.make(artwork).move(50, 50).label("Mouse Down");
		mouseUpCounter = Counter.make(artwork).move(50, 100).label("Mouse Up");
		mouseClickCounter = Counter.make(artwork).move(50, 150).label("Mouse Click");
		mouseMoveCounter_whileMouseUp = Counter.make(artwork).move(50, 200).label("Mouse Move while Up");
		mouseMoveCounter_whileMouseDown = Counter.make(artwork).move(50, 250).label("Mouse Move while Down");
		
		stage.addEventListener(MouseEvent.MOUSE_DOWN, handle_mouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, handle_mouseUp);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, handle_mouseMove);
		stage.addEventListener(MouseEvent.CLICK, handle_mouseClick);
		
		stage.addEventListener(Event.RESIZE, handle_stageResize);
	}
	
	function handle_mouseDown(e:MouseEvent):Void
	{
		mouseDown = true;
		
		var color:Int = 0xF9EA69;
		Particle.make(artwork).move(e.stageX, e.stageY).setup(color, 20).and.die();
		
		mouseDownCounter.increment();
	}
	
	function handle_mouseUp(e:MouseEvent):Void
	{
		mouseDown = false;
		
		var color:Int = 0xF6B900;
		Particle.make(artwork).move(e.stageX, e.stageY).setup(color, 40).and.die();
		
		mouseUpCounter.increment();
	}
	
	function handle_mouseClick(e:MouseEvent):Void
	{
		var color:Int = 0xE79327;
		Particle.make(artwork).move(e.stageX, e.stageY).setup(color, 80).and.die();
		
		mouseClickCounter.increment();
	}
	
	function handle_mouseMove(e:MouseEvent):Void
	{
		var color:Int = (mouseDown) ? 0xF67A00 : 0x09A9F3;
		Particle.make(artwork).move(e.stageX, e.stageY).setup(color, 10).and.die();
		
		if (mouseDown)
		{
			mouseMoveCounter_whileMouseDown.increment();
		}
		else
		{
			mouseMoveCounter_whileMouseUp.increment();
		}
	}
	
	function handle_stageResize(e:Event):Void
	{
		
	}
}