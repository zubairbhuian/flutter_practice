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
  Widget build(BuildContext context) =>
      OrientationBuilder(builder: (contex, orientation) {
        final isPortrait = orientation == Orientation.portrait;
        final isMobail = MediaQuery.of(contex).size.shortestSide < 600;
        return Scaffold(
          appBar: AppBar(title: const Text('My app')),
          drawer: isMobail ? const Drawer() : null,
          body: Row(
            children: [
              if (!isMobail)
                Container(
                  color: Colors.blue,
                  width: 300,
                  child: const Center(
                    child: Text("Sidebar"),
                  ),
                ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: isPortrait ? 2 : 3,
                  children: List.generate(
                      40,
                      (index) => Card(
                            color: Colors.orange,
                            child: Center(child: Text('Items $index')),
                          )),
                ),
              ),
            ],
          ),
        );
      });
}
 