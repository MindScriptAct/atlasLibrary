package mindscriptact.atlasLibrary.definitions {
import flash.display.BitmapData;

import mindscriptact.atlasLibrary.data.AtlasItemVO;

public interface IAssetDefinition {


	function pushAtlasItems(items:Vector.<AtlasItemVO>):void;


	function draw(canvas:BitmapData, assetName:String, x:int, y:int):void;

	function dispose():void;
}
}
