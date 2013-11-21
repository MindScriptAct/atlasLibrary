package mindscriptact.atlasLibrary.definitions {
import flash.display.BitmapData;
import flash.display.Shape;
import flash.geom.Matrix;
import flash.utils.Dictionary;

import mindscriptact.atlasLibrary.data.AtlasItemVO;

public class TestRandomDefinition implements IAssetDefinition {

	private static var drawMatrix:Matrix = new Matrix();

	private static var drawShape:Shape = new Shape();

	private var namePrefix:String;

	private var randomAssetRegistry:Dictionary = new Dictionary();

	private var amount:uint;
	private var minWidth:int;
	private var maxWidth:int;
	private var minHeight:int;
	private var maxHeight:int;
	private var centerPivot:Boolean;
	private var pivotRandomOffsetX:int;
	private var pivotRandomOffsetY:int;

	public function TestRandomDefinition(namePrefix:String, amount:uint, minWidth:int = 20, maxWidth:int = 50, minHeight:int = 20, maxHeight:int = 50, centerPivot:Boolean = true, pivotRandomOffsetX:int = 0, pivotRandomOffsetY:int = 0) {
		this.namePrefix = namePrefix;
		this.amount = amount;
		this.minWidth = minWidth;
		this.maxWidth = maxWidth;
		this.minHeight = minHeight;
		this.maxHeight = maxHeight;
		this.centerPivot = centerPivot;
		this.pivotRandomOffsetX = pivotRandomOffsetX;
		this.pivotRandomOffsetY = pivotRandomOffsetY;
	}


	public function pushAtlasItems(items:Vector.<AtlasItemVO>):void {

		for (var i:int = 0; i < amount; i++) {

			var randItem:RandomAssetVO = new RandomAssetVO();
			randItem.width = Math.floor(Math.random() * (maxWidth - minWidth)) + minWidth;
			randItem.height = Math.floor(Math.random() * (maxHeight - minHeight)) + minHeight;

			if (centerPivot) {
				randItem.offsetX = randItem.width >> 1;
				randItem.offsetY = randItem.height >> 1;
			}

			randomAssetRegistry[namePrefix + (i + 1)] = randItem;

			var item:AtlasItemVO = new AtlasItemVO(this, namePrefix + (i + 1), randItem.width, randItem.height);

			items.push(item)
		}

	}

	public function draw(canvas:BitmapData, assetName:String, x:int, y:int):void {

		var assetParams:RandomAssetVO = randomAssetRegistry[assetName];

		if (!assetParams) {
			throw Error("Item with name:" + assetName + " is not found.");
		}

		drawShape.graphics.lineStyle(0.1, 0xFF0000);
		drawShape.graphics.beginFill(Math.random() * 0xFFFFFF, 0.3);
		drawShape.graphics.drawRect(0, 0, assetParams.width, assetParams.height);

		drawMatrix.tx = x;
		drawMatrix.ty = y;

		canvas.draw(drawShape, drawMatrix);

	}

	public function dispose():void {
		randomAssetRegistry = null;
	}
}
}

class RandomAssetVO {
	public var width:int;
	public var height:int;
	public var offsetX:int;
	public var offsetY:int;

}