import 'package:get/get.dart';

class CountControler extends GetxController {
  int count = 0;

  void incriment() {
    count++;
    update();
  }
}
