package mindscriptact.atlasLibrary.core {
import flash.display.DisplayObjectContainer;

import mindscriptact.atlasLibrary.data.AtlasItemVo;
import mindscriptact.atlasLibrary.definitions.AssetDefinition;
import mindscriptact.atlasLibrary.definitions.SwfTestDefinition;

/**
 * Class to manage asset resources. (for AtlasLib set up.)
 */
public class AtlasIndex {

	private var atlases:Vector.<AtlasItemVo> = new <AtlasItemVo>[];

	private var debugContainer:DisplayObjectContainer;


	public function AtlasIndex() {

	}


	public function start(allReadyHandlerFunction:Function):void {

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

		atlases.push(new AtlasItemVo(atlasName, definitions));


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

		var atlasCount:int = atlases.length;
		for (var i:int = 0; i < atlasCount; i++) {
			var atlasDefinition:AtlasItemVo = atlases[i];

			var atlasDefinitionCount:int = atlasDefinition.definitions.length;
			for (var j:int = 0; j < atlasDefinitionCount; j++) {

				var assetDefinition:AssetDefinition = atlasDefinition.definitions[j];

				if (assetDefinition is SwfTestDefinition) {
					var swfTest:SwfTestDefinition = assetDefinition as SwfTestDefinition;
					// do stuff..
				}
			}

		}

	}


}
}
