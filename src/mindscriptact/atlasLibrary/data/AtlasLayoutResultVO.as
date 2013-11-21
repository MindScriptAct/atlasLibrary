package mindscriptact.atlasLibrary.data {
public class AtlasLayoutResultVO {

	public var atlasName:String;
	public var items:Vector.<AtlasItemVO>;
	public const width:int = 100;
	public var height:int = 100;

	public function AtlasLayoutResultVO(atlasName:String, items:Vector.<AtlasItemVO>) {
		this.atlasName = atlasName;
		this.items = items;
	}
}
}
