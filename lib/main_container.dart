import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_decider/file_utils.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {

  MemoryFileUtils utils = MemoryFileUtils();
  bool loaded = false;
  Widget viewWidget;

  @override
  Widget build(BuildContext context) {

    if (viewWidget == null) {
      viewWidget = Center(child: CircularProgressIndicator());
      setup();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Food decider"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Text("Decider"),
                alignment: Alignment.center,
              ),
              duration: Duration(seconds: 5),
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text("My Restaurants"),
              onTap: () async {
                if ( !loaded ) return;
                setState(() {
                  viewWidget = getRestaurantsWidget(null);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Restaurants Near Me"),
              onTap: () async {
                if ( !loaded ) return;
              },
            )
          ],
        ),
      ),
      body: viewWidget,
    );
  }


  void setup() async {

    String restDirPath = "${utils.appDir}/$RESTAURANT_DIR";
    Directory restDir = Directory(restDirPath);
    List<FileSystemEntity> entities = restDir.listSync();
    if (entities.isEmpty) {
      setState(() {
        viewWidget = Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You have no restaurants selected."),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                child: RaisedButton(
                  color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text("Find a Restaurant", style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    ),
              )
            ],
          ),
        );
      });
    } else {

    }

    loaded = true;
  }


  Widget getRestaurantsWidget(List<dynamic> items) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),

    );


  }

}
