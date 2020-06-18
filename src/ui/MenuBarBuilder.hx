package src.ui;


import haxe.ds.List;
import haxe.ui.core.Component;
import haxe.ui.containers.menus.Menu;
import haxe.ui.containers.menus.MenuBar;
import haxe.ui.containers.menus.MenuItem;
import haxe.ui.containers.menus.MenuSeparator;
import haxe.ui.events.MouseEvent;

class MenuBarBuilder 
{
	
	private var head:Item;
	private var node:Item;

	public function new() 
	{
		head = new Item(new MenuBar());
		node = head;
	}

	public function menu(text:String):MenuBarBuilder {
		var menu = new Menu();
		menu.text = text;
		
		node = node.addChild(menu);
		return this;
	}

	public function menuItem(text:String, ?fn:MouseEvent->Void):MenuBarBuilder {
		var menuItem = new MenuItem();
		menuItem.text = text;
		if (fn != null) {
			menuItem.onClick = fn;	
		}
		
		node.addChild(menuItem);
		return this;
	}

	public function separator():MenuBarBuilder {
		var separator = new MenuSeparator();

		node.addChild(separator);
		return this;
	}
	
	public function parent():MenuBarBuilder {
		if (node.parent != null) {
			node = node.parent;
		}
		return this;
	}

	public function build():Component {
		return head.value;
	}
	
}

private class Item
{
	private var _value:Component;
	private var _parent:Item;
	//var children: List<Item> = new List<Item>();
	
	public function new(value:Component) {
		this._value = value;
	}
	
	public var value(get, null):Component;
	private function get_value():Component {
		return _value;
	}

	public var parent(get, set):Item;
	private function get_parent():Item {
		return _parent;
	}
	private function set_parent(parent:Item):Item {
		_parent = parent;
		return parent;
	}
	
	
	public function addChild(child:Component):Item {
		var subNode = subNode(child);
		//this.children.add(subNode);
		this.value.addComponent(child);
		return subNode;
	}

	public function subNode(value:Component):Item {
		var subNode = new Item(value);
		subNode.parent = this;
		return subNode;
	}	
	
}
