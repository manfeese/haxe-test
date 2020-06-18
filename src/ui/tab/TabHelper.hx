package ui.tab;

import haxe.ui.containers.TabView;
import ui.tab.ItemFactory;
import ui.tab.Item;

class TabHelper 
{
	
	private static var textAreaItemFactory:ItemFactory = new TextAreaItemFactory();
	
	public static function fillItems(tabView:TabView, items: List<Item>) 
	{
		for (item in items) {
			tabView.addComponent(item.toComponent());
		}
	}

	public static function addItem(tabView:TabView, item:Item) 
	{
		var items = new List<Item>();
		items.add(item);
		fillItems(tabView, items);
	}
	
	public static function clearAndfillFromXmlFile(tabView:TabView, path:String, itemType:ItemType) 
	{
		var items:List<Item> = new List<Item>();
		switch (itemType) {
			case ItemType.TextArea: items = textAreaItemFactory.fromXmlFile(path);
		}
		
		tabView.removeAllPages();
		fillItems(tabView, items);
	}	
	
}