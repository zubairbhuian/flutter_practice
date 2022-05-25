import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Future Build with https',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              'بَ',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
