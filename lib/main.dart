import 'package:flutter/material.dart';
import 'package:googleMapImplementation/screen/screen_start.dart';

void main() {
  runApp(MapApp());
}

class MapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: StartScreen.routeName, routes: {
      StartScreen.routeName: (context) => StartScreen(),
    });
  }
}
