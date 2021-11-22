import 'package:flutter/material.dart';
import 'package:notion_api/notion.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  NotionClient notionClient =
      NotionClient(token: 'secret_1RxXwc4WDadn7f9FjXdyJCe6Y6T7DwMSgLMprxjpBjw');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '장치위키',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
