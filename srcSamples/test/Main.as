package test {
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.utils.getTimer;

import mindscriptact.atlasLibrary.AtlasLib;
import mindscriptact.atlasLibrary.definitions.AtlasDefinition;
import mindscriptact.atlasLibrary.definitions.AtlasLoadedDefinition;
import mindscriptact.atlasLibrary.definitions.PicAssetDefinition;
import mindscriptact.atlasLibrary.definitions.SwfLoadedDefiniton;
import mindscriptact.atlasLibrary.definitions.SwfTestDefinition;

public class Main extends Sprite {


	private var initTime:int;

	public function Main() {

		trace("Start test.");

		// setUp step

		initTime = getTimer();


		AtlasLib.atlasIndex
				.addAtlas("atlasName"
						, new SwfTestDefinition(new MovieClip())
						, new AtlasDefinition()
						, new AtlasLoadedDefinition("assets/hero_atlas.png", "assets/hero_atlas.xml")
						, new PicAssetDefinition("assets/test.png", "myName")
						, new SwfLoadedDefiniton("assets/test.swf")
				)
				.addSound()
				.addText()
				.addBytes()
				.addFont()

		AtlasLib.atlasIndex.debugIn(this);

		AtlasLib.atlasIndex.start(handleAllAssetsReady);


	}

	private function handleAllAssetsReady():void {
		trace("All atlas assets are ready to be used. in:", (getTimer() - initTime));

		AtlasLib.getAsset("assetId");
	}
}
}
