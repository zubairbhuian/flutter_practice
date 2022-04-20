import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final data = [
      "this is one",
      "this is two",
      "this is three",
      "this is four",
      "this is five",
      "this is six",
      "this is seven",
      "this is eight",
      "this is nine",
      "this is ten",
      "this is eleven",
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid View'),
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: ((context, index) {
              return Container(
                color: Colors.red,
                height: 100,
                child: Text('$data[index]'),
              );
            })));
  }
}
