
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translate_interview/resources/app_colors.dart';
import 'package:translate_interview/resources/text_utility.dart';


class AppButton extends StatefulWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? buttonTxtColor;
  void Function()? onButtonTap;
  bool isPrefixIcon;
  AppButton({super.key, required this.buttonText,this.onButtonTap,this.buttonColor,this.buttonTxtColor,this.isPrefixIcon = false});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onButtonTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 52,
        decoration: BoxDecoration(
            color: widget.buttonColor??AppColors.primaryColor,
            borderRadius: BorderRadius.circular(1000)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // if(widget.isPrefixIcon)
            // SvgPicture.asset(AppAssets.boostIcon).marginOnly(right: 12),
            addText700(widget.buttonText,fontFamily: 'Manrope',color: widget.buttonTxtColor??AppColors.whiteColor,fontSize: 20),
          ],
        ),
      ),
    );
  }
}
