import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_baurozi_api/model.dart';
import 'package:flutter_baurozi_api/repo.dart';

void main() {
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coba',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Blog> listBlog = [];
  Repository repository = Repository();

  getData() async {
    listBlog = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ok"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            // ignore: avoid_unnecessary_containers
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                children: [
                  Text(
                    listBlog[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(listBlog[index].content),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: listBlog.length),
    );
  }
}
