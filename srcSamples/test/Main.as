package test {
import flash.display.Sprite;
import flash.utils.getTimer;

import mindscriptact.atlasLibrary.AtlasLib;
import mindscriptact.atlasLibrary.definitions.DisplayObjectDefinition;
import mindscriptact.atlasLibrary.definitions.TestRandomDefinition;

public class Main extends Sprite {


	private var initTime:int;

	public function Main() {

		trace("Start test.");

		// setUp step

		initTime = getTimer();

		var testSprite:Sprite = new Sprite();
		testSprite.graphics.lineStyle(5, 0x123456);
		testSprite.graphics.lineTo(100, 100);


		AtlasLib.atlasIndex
				.addAtlas("atlasTest"
						, new TestRandomDefinition("randTest", 20)
						, new DisplayObjectDefinition("test1", testSprite)
						//, new SwfTestDefinition(new MovieClip())
						//, new AtlasDefinition()
						//, new AtlasLoadedDefinition("assets/hero_atlas.png", "assets/hero_atlas.xml")
						//, new PicAssetDefinition("assets/test.png", "myName")
						//, new SwfLoadedDefiniton("assets/test.swf")
				)
		//.addSound()
		//.addText()
		//.addBytes()
		//.addFont()

		AtlasLib.atlasIndex.debugIn(this);

		AtlasLib.atlasIndex.start(handleAllAssetsReady);


	}

	private function handleAllAssetsReady():void {
		trace("All atlas assets are ready to be used. in:", (getTimer() - initTime));

		AtlasLib.getAsset("assetId");
	}
}
}
