import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('This is Home Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '0',
            style: TextStyle(
                color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Next Screen')))
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
