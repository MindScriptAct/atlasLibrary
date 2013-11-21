package mindscriptact.atlasLibrary.data {
public class AtlasItemVo {

	public var atlasName:String;

	public var definitions:Array;

	public function AtlasItemVo(atlasName:String, definitions:Array) {
		this.atlasName = atlasName;
		this.definitions = definitions;
	}
}
}
