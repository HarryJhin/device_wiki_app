import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: FontApp(),
    );
  }
}

class FontApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FontApp();
  }
}

class _FontApp extends State<FontApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Design Flutter App'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: const <Widget>[
              Icon(Icons.android),
              Text(
                'android',
                style: TextStyle(
                  fontFamily: 'D2Coding',
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
