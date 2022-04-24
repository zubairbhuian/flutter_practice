import 'package:flutter_practice/language/ban.dart';
import 'package:flutter_practice/language/eng.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'bn_BD':ban,
    'en_US':eng
  };
}
