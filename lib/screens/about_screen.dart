import 'package:flutter/material.dart';
import 'package:flutter_practice/controler/user_controler.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  final UserControler userControler = Get.put(UserControler());
  AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
          child: Obx(() => Text(
                "${userControler.user}",
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userControler.incriment();
        },
      ),
    );
  }
}
