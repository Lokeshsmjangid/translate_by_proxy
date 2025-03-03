import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:translate_interview/screens/splash_screen/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (cntrl) {
      return Scaffold(
        body: Stack(
          children: [
           Image.asset("assets/images/blackWallpaper.jpg", height: double.infinity, fit: BoxFit.cover,),
           Align(
            alignment: Alignment.center,
            child: SizedBox( height:300, width: 300, child: Image.asset("assets/images/splashIconImg.png",))),
          //  Align(alignment: Alignment.center, child: Image.network("https://img.lovepik.com/photo/45012/4417.jpg_wh300.jpg")),
          ],
        ),
      );
    });
  }
}