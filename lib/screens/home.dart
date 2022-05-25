import 'package:flutter/material.dart';
import 'package:flutter_practice/controler/count_controler.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('This is Home Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<CountControler>(
            init: CountControler(),
            builder: (_) => Text(
              '${_.count}',
              style: const TextStyle(
                  color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/about");
                  },
                  child: const Text('Next Screen')))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<CountControler>().incriment();
          },
          child: const Icon(Icons.add)),
    );
  }
}
