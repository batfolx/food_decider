import 'dart:io';

import 'package:path_provider/path_provider.dart';

const RESTAURANT_DIR = "restaurant";

Future<String> getAppDirectory() async {
  return (await getApplicationDocumentsDirectory()).path;
}

class MemoryFileUtils {

  static final MemoryFileUtils _utils = MemoryFileUtils._internal();
  static String appDirectory;

  factory MemoryFileUtils(){
    return _utils;
  }

  bool isAppDirSet() {
    return appDirectory != null;
  }

  setAppDir(String appDir) => appDirectory = appDir;
  String get appDir => appDirectory;

  MemoryFileUtils._internal();

}

class RestaurantFile {

  String name;
  String address;

  RestaurantFile(this.name, this.address);


}

/// sets the app directory on app launch and other cool things
Future<dynamic> setupApp() async {

  MemoryFileUtils utils = MemoryFileUtils();

  /// set the app directory
  if (!utils.isAppDirSet()) utils.setAppDir(await getAppDirectory());


  String appDirPath = "${utils.appDir}/$RESTAURANT_DIR";
  Directory appDir = new Directory(appDirPath);

  /// create restaurant directory
  if ( ! await appDir.exists() ) await appDir.create();


}