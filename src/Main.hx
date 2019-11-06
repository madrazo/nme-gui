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
    static var mRunning:Bool;
    static var mProject:NMEProject;

    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {
            var main = ComponentMacros.createInstance("assets/main.xml");
            main.fileName.text = "E:\\gamesdev\\ika\\project.nmml";

            main.Load.onClick=function(e){
                var path:String = main.fileName.text;
                if (FileSystem.exists(path))
                {
                    mProject = null; //new NMEProject( );
                    mProjectPath = main.fileName.text;
                    mProject = CommandLineToolsOverride.commandToolsMain(["prepareproject", mProjectPath, "cpp"],mProject);
                    mLoadedOK = CommandLineToolsOverride.loadProject(mProject,false);
                    main.outMsg.text = "LOADED "+ (mLoadedOK ? "OK" : "FAIL");

                    main.IsDebug.selected = mProject.debug;
#if 0
                    trace(mProject.embedAssets);
                    trace(mProject.skipAssets);
                    trace(mProject.openflCompat);
                    trace(mProject.iosConfig.compiler);
                    trace(mProject.staticLink);
                    trace(mProject.stdLibs);
                    trace(mProject.relocationDir);
                    trace(mProject.engines);
                    trace(mProject.export);
                    trace(mProject.exportFilter);
                    trace(mProject.exportSourceDir);
                    trace(mProject.projectFilename);
                    trace(mProject.localDefines);
                    //trace(mProject.environment);
                    trace(mProject.targetFlags);
                    trace(mProject.haxedefs);
                    trace(mProject.haxeflags);
                    trace(mProject.classPaths);

                    trace(mProject.debug);
                    trace(mProject.window.background);
                    trace(mProject.window.fullscreen);
                    trace(mProject.window.orientation);
                    trace(mProject.window.allowShaders);
                    trace(mProject.window.requireShaders);
                    trace(mProject.window.depthBuffer);
                    trace(mProject.window.stencilBuffer);
                    trace(mProject.window.alphaBuffer);

                    trace(mProject.platformType);
                    trace(mProject.ndllCheckDir);
                    trace(mProject.command);
                    trace(mProject.target);
                    trace(mProject.targetName);
#end   
                }
                else
                {
                    main.outMsg.text = "Invalid file path...";
                    mLoadedOK = false;
                }
            }

            main.Test.onClick=function(e){
                if(mLoadedOK && !mRunning)
                {
                    mRunning = true;
                    main.outMsg.text = "Testing...";

                    mProject.debug = main.IsDebug.selected;

                    #if (target.threaded)
                        sys.thread.Thread.create(() -> {
                    #end

#if 0
                    trace(mProject.embedAssets);
                    trace(mProject.skipAssets);
                    trace(mProject.openflCompat);
                    trace(mProject.iosConfig.compiler);
                    trace(mProject.staticLink);
                    trace(mProject.stdLibs);
                    trace(mProject.relocationDir);
                    trace(mProject.engines);
                    trace(mProject.export);
                    trace(mProject.exportFilter);
                    trace(mProject.exportSourceDir);
                    trace(mProject.projectFilename);
                    trace(mProject.localDefines);
                    //trace(mProject.environment);
                    trace(mProject.targetFlags);
                    trace(mProject.haxedefs);
                    trace(mProject.haxeflags);
                    trace(mProject.classPaths);

                    trace(mProject.debug);
                    trace(mProject.window.background);
                    trace(mProject.window.fullscreen);
                    trace(mProject.window.orientation);
                    trace(mProject.window.allowShaders);
                    trace(mProject.window.requireShaders);
                    trace(mProject.window.depthBuffer);
                    trace(mProject.window.stencilBuffer);
                    trace(mProject.window.alphaBuffer);

                    trace(mProject.platformType);
                    trace(mProject.ndllCheckDir);
                    trace(mProject.command);
                    trace(mProject.target);
                    trace(mProject.targetName);
#end
                    CommandLineToolsOverride.commandToolsMain(["test", mProjectPath, "cpp"],mProject);
#if 0
                    trace(mProject.embedAssets);
                    trace(mProject.skipAssets);
                    trace(mProject.openflCompat);
                    trace(mProject.iosConfig.compiler);
                    trace(mProject.staticLink);
                    trace(mProject.stdLibs);
                    trace(mProject.relocationDir);
                    trace(mProject.engines);
                    trace(mProject.export);
                    trace(mProject.exportFilter);
                    trace(mProject.exportSourceDir);
                    trace(mProject.projectFilename);
                    trace(mProject.localDefines);
                    //trace(mProject.environment);
                    trace(mProject.targetFlags);
                    trace(mProject.haxedefs);
                    trace(mProject.haxeflags);
                    trace(mProject.classPaths);

                    trace(mProject.debug);
                    trace(mProject.window.background);
                    trace(mProject.window.fullscreen);
                    trace(mProject.window.orientation);
                    trace(mProject.window.allowShaders);
                    trace(mProject.window.requireShaders);
                    trace(mProject.window.depthBuffer);
                    trace(mProject.window.stencilBuffer);
                    trace(mProject.window.alphaBuffer);

                    trace(mProject.platformType);
                    trace(mProject.ndllCheckDir);
                    trace(mProject.command);
                    trace(mProject.target);
                    trace(mProject.targetName);
#end
                    mProject.haxeflags=["--remap flash:nme","--remap lime:nme"];
                    mProject.command = "";
                    mRunning = false;

                    #if (target.threaded)
                        });
                    #end

                }
                else
                {
                    main.outMsg.text = mRunning ? "Running..." : "First load an xml/nmml file...";
                }
            }

            app.addComponent(main);

            app.start();
        });
    }
}

