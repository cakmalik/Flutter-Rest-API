import 'dart:convert';
import 'dart:io';

import 'package:flutter_baurozi_api/model.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class Repository {
  Uri url = Uri.parse('https://620c7c99b5736325938f55c6.mockapi.io/blog');
  Future getData() async {
    try {
      HttpOverrides.global = MyHttpOverrides();
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
