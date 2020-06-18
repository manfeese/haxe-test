package ui.tab;

interface ItemFactory 
{
	
	public function create():Item;
	
	public function fromXmlFile(path:String):List<Item>;
	
}