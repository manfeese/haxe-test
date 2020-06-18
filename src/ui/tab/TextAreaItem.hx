package ui.tab;
import haxe.ui.components.TextArea;
import haxe.ui.containers.TabView;
import haxe.ui.containers.VBox;
import haxe.ui.core.Component;
import ui.tab.Item;

class TextAreaItem implements Item
{
	private var _title:Null<String>;
	private var _text:Null<String>;
	
	public function new() {
		
	}
	
	public var title(get, set): Null<String>;
	private function get_title(): Null<String> {
		return _title;
	}
	private function set_title(title: Null<String>): Null<String> {
		_title = title;
		return title;
	}
	
	public var text(get, set): Null<String>;
	private function get_text(): Null<String> {
		return _text;
	}
	private function set_text(text: Null<String>): Null<String> {
		_text = text;
		return text;
	}
	
	public function toComponent(): Component {
		var box = new VBox();
		box.text = getStringOrDefault(_title, "<untitled>");
		box.percentHeight = 100;
		box.percentWidth = 100;

		var textArea = new TextArea();
		textArea.text = _text;
		textArea.wrap = false;
		textArea.percentHeight = 100;
		textArea.percentWidth = 100;
		
		box.addComponent(textArea);
		return box;
	}
	
	private function getStringOrDefault(str:Null<String>, defaultStr:String) {
		return (str == null || str == "") ? defaultStr : str;
	}
	
}