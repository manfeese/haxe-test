package ui.tab;

class TextAreaXmlParser 
{

	private var xmlString:String;
	
	public function new(xmlString:String) 
	{
		this.xmlString = xmlString;
	}
	
	public function parse():List<Item> {
		var root:Xml = Xml.parse(xmlString).firstElement();
		var count:Int = parseRoot(root);
		return parseItems(root.elementsNamed("item"), count);
	}
	
	private function parseRoot(root:Xml):Int {
		if (root.nodeName != "items" || !root.exists("count")) {
			throw "Wrong xml data";
		}
		return Std.parseInt(root.get("count"));
	}

	private function parseItems(elements:Iterator<Xml>, count:Int):List<Item> {
		var items:List<Item> = new List<Item>();

		for (i in 0...count) {
			
			var item = new TextAreaItem();
			
			if (elements.hasNext()) {
				parseItem(elements.next(), item);
			}

			items.add(item);
		}
		
		return items;
	}

	private function parseItem(item:Xml, tabItem:TextAreaItem) {
		if (item.exists("title")) { 
			tabItem.title = item.get("title");
		}
		var innerData:Xml;
		if ((innerData = item.firstChild()) != null) {
			tabItem.text = innerData.nodeValue;
		}
	}
	
}