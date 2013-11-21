package mindscriptact.atlasLibrary.data {
public class LayoutJobVO {

	public var atlasName:String;
	public var items:Vector.<AtlasItemVO>;
	public var handleFunction:Function;

	public function LayoutJobVO(atlasName:String, items:Vector.<AtlasItemVO>, handleFunction:Function) {
		this.atlasName = atlasName;
		this.items = items;
		this.handleFunction = handleFunction;

	}
}
}
