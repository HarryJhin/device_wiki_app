import 'package:device_wiki_app/laptop_repository.dart';
import 'package:device_wiki_app/types/failure.dart';
import 'package:device_wiki_app/types/laptop.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Laptop>> _futureLaptops;

  @override
  void initState() {
    super.initState();
    _futureLaptops = LaptopRepository().get();
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
      body: FutureBuilder<List<Laptop>>(
          future: _futureLaptops,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final laptops = snapshot.data!;
              return ListView.builder(
                itemCount: laptops.length,
                itemBuilder: (BuildContext context, int index) {
                  final laptop = laptops[index];
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: 2.0,
                        color: Colors.blue,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(laptop.name),
                      subtitle: Text(laptop.url),
                      onTap: () {},
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              final failure = snapshot.error as Failure;
              return Center(
                child: Text(failure.message),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
