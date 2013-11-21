package mindscriptact.atlasLibrary.core {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObjectContainer;
import flash.utils.Dictionary;

import mindscriptact.atlasLibrary.data.AtlasItemVO;
import mindscriptact.atlasLibrary.data.AtlasLayoutResultVO;
import mindscriptact.atlasLibrary.data.AtlasVO;

/**
 * Class to manage asset resources. (for AtlasLib set up.)
 */
public class AtlasIndex {

	private var atlasLayoutManager:AtlasLayoutManager = new AtlasLayoutManager();

	private var atlases:Vector.<AtlasVO> = new <AtlasVO>[];

	private var debugContainer:DisplayObjectContainer;

	// atlas names stored by item names.
	private const atlasNameRegistry:Dictionary = new Dictionary();


	public function AtlasIndex() {

	}


	public function start(allReadyHandlerFunction:Function):void {
		trace("AtlasIndex.start()");

		// handle loading
		var atlasCount:int = atlases.length;
		for (var i:int = 0; i < atlasCount; i++) {
			// init needed loads..
		}

		// if no loads is needed start asset parsing.

		parseDefinitions();

		// start asset preparation.

	}

	// requires atlas asset definitions.
	public function addAtlas(atlasName:String, ...definitions:Array):AtlasIndex {
		// TODO: check atlas name, must be unique, must be not empty.
		atlases.push(new AtlasVO(atlasName, definitions));

		return this;
	}

	public function debugIn(debugContainer:DisplayObjectContainer):AtlasIndex {
		this.debugContainer = debugContainer;

		return this;
	}

	// for sound assets. (can be loaded or passed as class.
	// requires SoundAssetDefinition
	public function addSound():AtlasIndex {

		return this;
	}

	// for xml's, texts, json, and other text based stuff.
	// requires TextAssetDefinition
	public function addText():AtlasIndex {


		return this;
	}

	// for binary objects.
	// requires BytesAssetDefinition
	public function addBytes():AtlasIndex {

		return this;
	}

	// for adding fonts. ??
	// requires FontAssetDefinition
	public function addFont():AtlasIndex {

		return this;
	}


	//---------------------
	// definition handling.
	//---------------------

	private function parseDefinitions():void {
		trace("AtlasIndex.parseDefinitions()");

		var atlasCount:int = atlases.length;
		for (var i:int = 0; i < atlasCount; i++) {
			var atlasDefinition:AtlasVO = atlases[i];

			var items:Vector.<AtlasItemVO> = new <AtlasItemVO>[];

			var atlasDefinitionCount:int = atlasDefinition.definitions.length;
			for (var adId:int = 0; adId < atlasDefinitionCount; adId++) {
				atlasDefinition.definitions[adId].pushAtlasItems(items);
			}

			// check item names.
			var itemConut:int = items.length;
			for (var aiId:int = 0; aiId < itemConut; aiId++) {
				var item:AtlasItemVO = items[aiId];
				if (item.name == null && item.name == "") {
					throw Error("Atlas items should not have empty names. " + item);
				}
				if (atlasNameRegistry[item.name] == null) {
					atlasNameRegistry[item.name] = atlasDefinition.atlasName;
				} else {
					throw Error("All atlas items should have unique names. Item name:" + item.name + " from atlas:" + atlasDefinition.atlasName + " is already used by:" + atlasNameRegistry[item.name]);
				}
			}

			// layout

			atlasLayoutManager.layout(atlasDefinition.atlasName, items, handleLayoutResults);

			// handle layout finish event...

		}

	}

	private function handleLayoutResults(layOutResult:AtlasLayoutResultVO):void {
		trace("AtlasIndex.handleLayoutResults " + layOutResult.atlasName);

		var atlasBitmapData:BitmapData = new BitmapData(layOutResult.width, layOutResult.height)

		// TODO : draw for 100, if it takes longer - skip frame.

		var items:Vector.<AtlasItemVO> = layOutResult.items;
		var itemCount:int = items.length;

		for (var i:int = 0; i < itemCount; i++) {
			var item:AtlasItemVO = items[i];
			item.source.draw(atlasBitmapData, item.name, item.x, item.y);
		}

		if (debugContainer) {
			debugAtlas(atlasBitmapData);
		}

		// TODO: dispose all atlas no longer needed assetDefinitions.

	}

	private function debugAtlas(atlasBitmapData:BitmapData):void {
		if (debugContainer) {
			debugContainer.addChild(new Bitmap(atlasBitmapData));
		}
	}


	public function toString():String {
		return "...";
	}

}
}
