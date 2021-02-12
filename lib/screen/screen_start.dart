import 'package:flutter/material.dart';
//import 'package:zoomable_image/zoomable_image.dart';
//import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';

class StartScreen extends StatefulWidget {
  static const routeName = '/startScreen';
  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen> {
  final _transformationController = TransformationController();
  TapDownDetails _doubleTapDetails;

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wheel Chair Map'),
          actions: [
            /* IconButton(
                icon: Icon(Icons.alarm),
                onPressed: () {
                  print('Alarm');
                }),
            IconButton(
                icon: Icon(Icons.message_sharp),
                onPressed: () {
                  print('Message');
                }),*/
          ],
        ),
        body: GestureDetector(
          onDoubleTapDown: _handleDoubleTapDown,
          onDoubleTap: _handleDoubleTap,
          child: Center(
            child: InteractiveViewer(
              transformationController: _transformationController,
              child: Image.asset('images/UCOmap.png'),
              /* ... */
            ),
          ),
        ));
  }
  /* drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Message'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),*/
  /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button");
        },
        child: Icon(Icons.star_outline),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
        ],
        currentIndex: 0,
        onTap: (index) {
          print('Current index = $index');
        },
      ),*/
  //   );
  //}
}
