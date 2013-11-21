package mindscriptact.atlasLibrary.definitions {
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.geom.Matrix;

import mindscriptact.atlasLibrary.data.AtlasItemVO;

public class DisplayObjectDefinition implements IAssetDefinition {

	private static var drawMatrix:Matrix = new Matrix();

	private var viewObject:DisplayObjectContainer;
	private var name:String;

	public function DisplayObjectDefinition(name:String, viewObject:DisplayObjectContainer) {
		this.name = name;
		this.viewObject = viewObject;
	}

	public function pushAtlasItems(items:Vector.<AtlasItemVO>):void {
		var item:AtlasItemVO = new AtlasItemVO(this, name, viewObject.width, viewObject.height);

		items.push(item);
	}

	public function draw(canvas:BitmapData, assetName:String, x:int, y:int):void {

		drawMatrix.tx = x;
		drawMatrix.ty = y;

		if (assetName != name) {
			throw Error("Item with name:" + assetName + " is not found.");
		}

		canvas.draw(viewObject, drawMatrix);

	}

	public function dispose():void {
		viewObject = null;
	}
}
}
