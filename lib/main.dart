import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        home: SafeArea(
          child: Scaffold(
            body: Center(
              child: SizedBox(
                child: Text(
                  'بَ',
                  style: GoogleFonts.amiri(
                      textStyle: const TextStyle(fontSize: 30)),
                ),
              ),
            ),
          ),
        ));
  }
}
