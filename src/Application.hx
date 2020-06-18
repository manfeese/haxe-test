package;

import haxe.ui.HaxeUIApp;
import haxe.ui.containers.TabView;
import haxe.ui.containers.VBox;
import haxe.ui.core.Component;
import src.ui.MenuBarBuilder;
import src.util.AppUtil;
import ui.tab.ItemType;
import ui.tab.TabHelper;


class Application extends HaxeUIApp
{

	public function new() 
	{
		super();
	}
	
	public function prepare() 
	{
		var mainPanel = createMainPanel();
		createMenuBar(mainPanel);
		createAndFillTab(mainPanel);
	}
	
	
	private var tabView:TabView;
	
	private function createMainPanel() {
		var mainPanel = new VBox();
		mainPanel.percentHeight = 100;
		mainPanel.percentWidth = 100;
		addComponent(mainPanel);
		return mainPanel;
	}

	private function createTab(owner) {
		tabView = new TabView();
		tabView.percentHeight = 100;
		tabView.percentWidth = 100;
		owner.addComponent(tabView);
	}

	private function fillTab(path:String) {
		try{
			TabHelper.clearAndfillFromXmlFile(tabView, path, ItemType.TextArea);
		} catch (e) {
			AppUtil.showErrorMessage(e.message);
		}
	}

	private function createAndFillTab(owner) {
		createTab(owner);
		fillTab("xml/config.xml");
	}
	
	private function createMenuBar(owner) {

		var menuBuilder = new MenuBarBuilder();
		var menuBar = menuBuilder
						.menu("File")
							.menuItem("Load...", function(e) { AppUtil.openFileDialog(onFileOpened, "xml"); })
							.separator()
							.menuItem("Exit", function(e) { onExit(); })
						.build();
		menuBar.percentWidth = 100;
		
		owner.addComponent(menuBar);
	}
	
	private function onFileOpened(path:String):Void {
		fillTab(path);
	}

	private function onExit() {
		Sys.exit(0);
	}
	
}