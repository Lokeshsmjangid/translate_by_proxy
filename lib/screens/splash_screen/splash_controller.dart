import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:translate_interview/screens/login/login_screen.dart';

class SplashController extends GetxController{

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigateFunc();
  }

  navigateFunc() {
      Timer(const Duration(seconds: 3), () {
        Get.off(() => const LoginScreen());
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}