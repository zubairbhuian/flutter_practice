// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var url = 'https://jsonplaceholder.typicode.com/photos';
  var data = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future fetchData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data'),
        ),
        body:ListView.builder(
                itemBuilder: (_, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(data[index]['title']),
                    leading: Image.network(data[index]['url']),
                    onTap: () {},
                  ),
                ),
                itemCount: data.length,
              )
            );
  }
}
