import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:translate_interview/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static String splashScreen = '/splashScreen';
  static String homeScreen = '/homeScreen';
  static String loginScreen = '/loginScreen';

  static final getRoute = [

   GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
  //   GetPage(
  //     name: AppRoutes.homeScreen,
  //     page: () => HomeScreen(),
  //   ),
  
    //  GetPage(
    //   name: AppRoutes.loginScreen,
    //   page: () => LoginScreen(),
    // ), 
  ];
}