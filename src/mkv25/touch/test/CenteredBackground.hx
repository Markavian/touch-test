package mkv25.touch.test;

import flash.display.BitmapData;
import flash.display.Stage;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.Lib;

class CenteredBackground
{
	public var artwork:Bitmap;
	
	public function new() 
	{
		artwork = new Bitmap();
		
		var stage = Lib.current.stage;
		stage.addChild(artwork);
		stage.addEventListener(Event.RESIZE, handle_stageResize);
	}
	
	public function setAsset(asset:String):CenteredBackground
	{
		artwork.bitmapData = Assets.getBitmapData(asset);
		
		redraw();
		
		return this;
	}
	
	public function setBitmapData(bitmap:BitmapData):CenteredBackground
	{
		artwork.bitmapData = bitmap;
		
		redraw();
		
		return this;
	}
	
	public function dispose():Void
	{
		var stage = Lib.current.stage;
		stage.removeChild(artwork);
		stage.removeEventListener(Event.RESIZE, handle_stageResize);
	}
	
	function redraw():Void
	{
		var stage = Lib.current.stage;
		artwork.x = Math.round((stage.stageWidth / 2) - (artwork.width / 2));
		artwork.y = Math.round((stage.stageHeight / 2) - (artwork.height / 2));
	}
	
	function handle_stageResize(e:Event):Void
	{
		redraw();
	}
	
	public static function make():CenteredBackground
	{
		return new CenteredBackground();
	}
	
}