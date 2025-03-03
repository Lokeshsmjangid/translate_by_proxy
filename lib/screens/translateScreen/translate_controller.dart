import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class TranslateController extends GetxController {

  
  var currentLocale = const Locale('en', 'US').obs;

  Locale get locale => currentLocale.value;

@override
  void onInit() {
    super.onInit();
  }


  void toggleLanguage() {
    print("Translation App :: ${currentLocale.value}");
    if (currentLocale.value.languageCode == 'en') {
      currentLocale.value = const Locale('es', 'ES');
    } else {
      currentLocale.value = const Locale('en', 'US');
    }
    Get.updateLocale(currentLocale.value); 
  }

  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
}