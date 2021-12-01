import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '메인 페이지',
          style: TextStyle(),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed('/login');
            },
            icon: const Icon(Icons.account_circle_rounded),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed('/search');
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
