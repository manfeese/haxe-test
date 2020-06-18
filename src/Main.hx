package;

class Main
{

	public static function main() 
	{
		var app = new Application();
		app.ready(function() {
			app.prepare();
			app.start();
		});
	}
	
	
}
