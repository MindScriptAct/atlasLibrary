package mindscriptact.atlasLibrary.core {
import mindscriptact.atlasLibrary.data.AtlasItemVO;
import mindscriptact.atlasLibrary.data.AtlasLayoutResultVO;
import mindscriptact.atlasLibrary.data.LayoutJobVO;

public class AtlasLayoutManager {

	public function layout(atlasName:String, items:Vector.<AtlasItemVO>, handleFunction:Function):void {

		var layOutJob:LayoutJobVO = new LayoutJobVO(atlasName, items, handleFunction);

		doJob(layOutJob);
	}

	private function doJob(layOutJob:LayoutJobVO):void {

		// job is done..


		layOutJob.handleFunction(new AtlasLayoutResultVO(layOutJob.atlasName, layOutJob.items));
	}
}
}
