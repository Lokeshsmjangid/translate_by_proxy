import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:translate_interview/custom_widgets/customToast.dart';
import 'package:translate_interview/screens/translateScreen/translate_screen.dart';

class LoginController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hint = false;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  validateFunc(BuildContext context) {
    if(emailController.text.trim().isEmpty || emailController.text.trim() != "test@gmail.com"){
          showToast(context: context, msg: "Please enter valid Email.", isError: false, isPositioned: true);
    }
    else if (passwordController.text.trim().isEmpty || passwordController.text.trim() != "1234"){
          showToast(context: context, msg: "Please enter valid Password.", isError: false, isPositioned: true);
    }
    else {
      Get.offAll(() => TranslateScreen());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}