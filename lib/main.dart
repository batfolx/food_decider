import 'package:flutter/material.dart';
import 'package:food_decider/main_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: Colors.green
      ),
      initialRoute: "MainState",
      routes: {
        "MainState": (context) => MainContainer()
      },

    );
  }
}

