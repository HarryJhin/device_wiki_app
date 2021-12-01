import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:device_wiki_app/types/laptop.dart';
import 'package:device_wiki_app/types/failure.dart';

class LaptopRepository {
  final http.Client _client;

  LaptopRepository({http.Client? client}) : _client = client ?? http.Client();

  void dispose() {
    _client.close();
  }

  Future<List<Laptop>> get() async {
    try {
      final url =
          'https://api.notion.com/v1/databases/${dotenv.env['NOTION_DATABASE_ID']}/query';
      final responese = await _client.post(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader:
            'Bearer ${dotenv.env['NOTION_API_KEY']}',
        'Notion-Version': '2021-08-16',
      });

      if (responese.statusCode == 200) {
        final data = jsonDecode(responese.body) as Map<String, dynamic>;
        return (data['results'] as List).map((e) => Laptop.fromMap(e)).toList();
      } else {
        throw const Failure(message: 'Something went wrong!');
      }
    } catch (error) {
      print(error);
      throw const Failure(message: 'Something went wrong!');
    }
  }
}
