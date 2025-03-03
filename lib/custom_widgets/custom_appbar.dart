import 'package:flutter/material.dart';
import 'package:translate_interview/resources/app_colors.dart';

PreferredSizeWidget customAppBar({double? leadingWidth , Widget? leadingIcon, Color? backgroundColor, String? titleTxt , Color? titleColor, double? titleFontSize,
  FontWeight? titleFontWeigth, bool? centerTitle, List<Widget>? actionItems, bool? bottomLine,
})
{
  return AppBar(
    leadingWidth: leadingWidth ?? 0,
    leading: leadingIcon ?? const IgnorePointer(),
    backgroundColor: backgroundColor ?? AppColors.whiteColor,
    title: Text(
      titleTxt ?? "",
      style: TextStyle(
        color: titleColor ?? Color(0xFF241F1F),
        fontSize: titleFontSize ?? 20,
        fontFamily: 'Inter',
        fontWeight: titleFontWeigth ?? FontWeight.w600,
        letterSpacing: -1,
      ),
    ),
    centerTitle: centerTitle ?? false,
    actions: actionItems,
    bottom: bottomLine ?? true ? PreferredSize(
      preferredSize: const Size.fromHeight(10.0), // Height of the line
      child: Container(
        color: AppColors.blackColor, // Line color
        height: 1.0, // Line thickness
      ),
    ) : PreferredSize(
      preferredSize: const Size.fromHeight(10.0), // Height of the line
      child: Container(),
    ),
  );
}