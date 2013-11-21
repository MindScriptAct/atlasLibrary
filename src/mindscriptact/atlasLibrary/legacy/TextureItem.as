package mindscriptact.atlasLibrary.legacy {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

public class TextureItem extends Sprite {

	public var graphic:BitmapData;
	public var textureName:String = "";
	public var frameName:String = "";
	public var frameX:int = 0;
	public var frameY:int = 0;
	public var frameWidth:int = 0;
	public var frameHeight:int = 0;

	//public var x:Number;
	//public var y:Number;
	//public var width:Number;
	//public var height:Number;


	public function TextureItem(graphic:BitmapData, textureName:String, frameName:String, frameX:int = 0, frameY:int = 0, frameWidth:int = 0, frameHeight:int = 0) {

		this.graphic = graphic;
		this.textureName = textureName;
		this.frameName = frameName;

		this.frameWidth = frameWidth;
		this.frameHeight = frameHeight;
		this.frameX = frameX;
		this.frameY = frameY;

		var bm:Bitmap = new Bitmap(graphic, "auto", false);
		addChild(bm);
	}
}
}