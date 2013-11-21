package mindscriptact.atlasLibrary.data {
import mindscriptact.atlasLibrary.definitions.IAssetDefinition;

public class AtlasItemVO {

	public var source:IAssetDefinition;

	public var name:String;

	public var width:int;
	public var height:int;

	public const x:int = 0;
	public const y:int = 0;

	public function AtlasItemVO(source:IAssetDefinition, name:String, width:int, height:int) {
		this.source = source;
		this.name = name;
		this.width = width;
		this.height = height;
	}
}
}
