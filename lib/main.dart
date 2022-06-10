import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
        body: IntroductionScreen(
      showBackButton: false,
      showDoneButton: false,
      showNextButton: falsegit ,
      back: const Text('Bact'),
      next: const Text('Next'),
      pages: [
        PageViewModel(body: 'demo1', title: 'This is demo one'),
        PageViewModel(body: 'demo2', title: 'This is demo two'),
        PageViewModel(body: 'demo3', title: 'This is demo three'),
        PageViewModel(body: 'demo4', title: 'This is demo four'),
      ],
      onDone: () {},
      done: const Text('Dome'),
    ));
  }
}
