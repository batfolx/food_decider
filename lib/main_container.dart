import 'package:flutter/material.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {


  Widget viewWidget;

  @override
  Widget build(BuildContext context) {

    if (viewWidget == null) ;

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
                setState(() {
                  viewWidget = getRestaurantsWidget(null);
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Restaurants Near Me"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
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
