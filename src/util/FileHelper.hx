package util;

import openfl.Assets;
import sys.io.File;

class FileHelper 
{

    public static function getContent(file:String):String {
        if (sys.FileSystem.exists(file)) {
			return File.getContent(file);
        } else if (Assets.exists(file)) {
			return Assets.getText(file);
        }
		return null;
    }
	
}