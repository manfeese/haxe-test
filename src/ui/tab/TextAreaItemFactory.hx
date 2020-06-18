package ui.tab;

class TextAreaItemFactory implements ItemFactory 
{
	
	public function new() {
		
	}
	
	public function create():Item {
		var item: TextAreaItem = new TextAreaItem();
		return item;
	}
	
	public function fromXmlFile(path:String):List<Item> {
		var xmlContent:String = util.FileHelper.getContent(path);
		if (xmlContent == null) {
			throw "File " + path + " not found";
		}
		return fromXmlContent(xmlContent.toString());
	}
	
	private function fromXmlContent(xmlContent:String):List<Item> {
		return new TextAreaXmlParser(xmlContent).parse();
	}
	
}