package ;

import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

import haxe.io.Path;
import sys.FileSystem;

class Main {
    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {
                var main = ComponentMacros.createInstance("assets/main.xml");
            main.Load.onClick=function(e){
                var path:String = main.fileName.text;
                var project:NMEProject = new NMEProject();
                if (FileSystem.exists(path))
                {
                    main.outMsg.text = "Parsing...";
                    new NMMLParser(project, path, true);
                }
                else
                {
                    main.outMsg.text = "Invalid file path...";
                }
            }
            app.addComponent(main);

            app.start();
        });
    }
}
