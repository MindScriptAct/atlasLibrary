package mindscriptact.atlasLibrary {
import mindscriptact.atlasLibrary.core.AtlasIndex;

/**
 * Static class to get atlas assets.
 */
public class AtlasLib {

	private static var _atlasIndex:AtlasIndex = new AtlasIndex();

	public static function get atlasIndex():AtlasIndex {
		return _atlasIndex;
	}


	// todo rename.
	public static function getAsset(assetId:String):void {

	}
}
}
