package mindscriptact.atlasLibrary.definitions {
public class AssetDefinition {

	public static const PIC_TYPE:int = 1;
	public static const ATLAS_TYPE:int = 2;
	public static const DYNAMIC_TYPE:int = 3;

	//public var type:int;
	//public var assetUrl:String;
	//public var assetName:String;

	public function AssetDefinition() {
		/*type:int, assetUrl:String, assetName:String*/
		//this.type = type;
		//this.assetUrl = assetUrl;
		//this.assetName = assetName;

	}

	public function getAsset(assetId:String):void {
		throw Error("Must be overridden.");
	}
}
}
