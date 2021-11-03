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
      home: MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MaterialFlutterApp();
  }
}

class _MaterialFlutterApp extends State<MaterialFlutterApp> {
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
              Text('android'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
