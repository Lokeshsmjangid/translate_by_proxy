import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:translate_interview/resources/app_button.dart';
import 'package:translate_interview/resources/app_colors.dart';
import 'package:translate_interview/resources/text_utility.dart';
import 'package:translate_interview/screens/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (cntrl) {
      return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: addText600("Welcome to Transalte App", color: AppColors.blackColor, fontSize: 20)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: addText300("Please Login", color: AppColors.blackColor)),

                  SizedBox(height: 40,),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: addText500("Email", color: AppColors.blackColor, fontSize: 15)),

                  SizedBox(height: 5,),
//EmailField
                  TextFormField(
                controller: cntrl.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.greyColor),
          borderRadius:BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  const BorderSide(
              color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:  const BorderSide(
              color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
               
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              
                  SizedBox(height: 20,),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: addText500("Password", color: AppColors.blackColor, fontSize: 15)),

                  SizedBox(height: 10,),
//PassField
                  TextFormField(
                controller: cntrl.passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.greyColor),
          borderRadius:BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  const BorderSide(
              color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:  const BorderSide(
              color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
                ),
                obscureText: true, // Hide password input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },

                
              ),


                  SizedBox(height: 40,),
//LoginBtn
                  AppButton( onButtonTap: () {
                    cntrl.validateFunc(context);
                  } , buttonText: "Login",  ),

                 
                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cntrl.hint = !cntrl.hint;
                        cntrl.update();
                      },
                      child: addText500("Hint", color: AppColors.blackColor, fontSize: 15),
                    ),
                    IconButton(onPressed: () {
                    cntrl.hint = !cntrl.hint;
                    cntrl.update();
                  }, icon: Icon(Icons.lightbulb_outline)),
                  ],
                  ),

                  Visibility(
                    visible: cntrl.hint,
                    child: addText500("Email :: test@gmail.com", color: AppColors.blackColor, fontSize: 15)),
                  Visibility(
                    visible: cntrl.hint,
                    child: addText500("Password :: 1234", color: AppColors.blackColor, fontSize: 15)),

                  SizedBox(height: 30,),


                ],
              ),
            ),
          ),
        );
    });
  }
}