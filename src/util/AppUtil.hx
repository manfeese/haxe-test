package src.util;

import haxe.ui.containers.dialogs.MessageBox;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import lime.ui.FileDialogType;
import lime.ui.FileDialog;

class AppUtil 
{

	public static function showErrorMessage(message:String) {
		showMessage(message, MessageBoxType.TYPE_ERROR);
	}

	public static function showInfoMessage(message:String) {
		showMessage(message, MessageBoxType.TYPE_INFO);
	}

	private static function showMessage(message:String, type:MessageBoxType) {
		var msBox:MessageBox = new MessageBox();
		msBox.message = message;
		msBox.type = type;
		msBox.showDialog(true);
	}
	
	public static function openFileDialog(fn:String->Void, filter:String) {
		var fDialog = new FileDialog();
		fDialog.onSelect.add(fn);
		fDialog.browse(FileDialogType.OPEN, filter);
	}
	
}