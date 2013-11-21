package mindscriptact.atlasLibrary.data {
import mindscriptact.atlasLibrary.definitions.IAssetDefinition;

public class AtlasVO {

	public var atlasName:String;

	public var definitions:Vector.<IAssetDefinition> = new <IAssetDefinition>[];

	public function AtlasVO(atlasName:String, definitions:Array) {
		this.atlasName = atlasName;

		var definitionCount:int = definitions.length;

		for (var i:int = 0; i < definitionCount; i++) {
			if (definitions[i] is IAssetDefinition) {
				this.definitions.push(definitions[i])
			} else {
				throw Error("Only IAssetDefinition objects can be added to Atlas definition.");
			}
		}
	}
}
}
