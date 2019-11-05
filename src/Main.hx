package ;

import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

import haxe.io.Path;
import sys.FileSystem;

import nme.Loader;
import nme.net.SharedObject;

class Main {

    static var mProjectPath:String;
    static var mLoadedOK:Bool;
    static var mProject:NMEProject;

    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {
            var main = ComponentMacros.createInstance("assets/main.xml");
            //main.fileName.text = "E:\\gamesdev\\ika\\project.nmml";

            main.Load.onClick=function(e){
                var path:String = main.fileName.text;
                if (FileSystem.exists(path))
                {
                    mProject = null; //new NMEProject( );
                    mProjectPath = main.fileName.text;
                    mProject = CommandLineToolsOverride.commandToolsMain(["prepareproject", mProjectPath, "cpp"],mProject);
                    mLoadedOK = CommandLineToolsOverride.loadProject(mProject,false);
                    main.outMsg.text = "LOADED "+ (mLoadedOK ? "OK" : "FAIL");
                }
                else
                {
                    main.outMsg.text = "Invalid file path...";
                    mLoadedOK = false;
                }
            }

            main.Test.onClick=function(e){
                if(mLoadedOK)
                {
                    main.outMsg.text = "Testing...";
                        #if (target.threaded)
                        sys.thread.Thread.create(() -> {
                        #end
                            CommandLineToolsOverride.commandToolsMain(["test", mProjectPath, "cpp"],mProject);
                        #if (target.threaded)
                        });
                        #end
                }
                else
                {
                    main.outMsg.text = "First load an xml/nmml file...";
                }
            }

            app.addComponent(main);

            app.start();
        });
    }
}

