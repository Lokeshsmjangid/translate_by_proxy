import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translate_interview/resources/app_colors.dart';


showToastBack(BuildContext context,String msg, bool isError, bool isPositioned){

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: isError ? Colors.red : Colors.black,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logoIc.jpg",height: 20,width: 20,),
        SizedBox(width: 12.0),
        Text(msg, style: TextStyle(color: Colors.white),),
        // addText400(msg, color: Colors.white),
      ],
    ),
  );

  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => isPositioned
        ? Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: toast,
            ),
          )
        : Positioned(
            bottom: 30.0,
            left: 20,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: toast,
            ),
          ),
  );

  Overlay.of(context).insert(overlayEntry);

  Future.delayed(Duration(seconds: 2), () {
    overlayEntry.remove();
  });

}

showToast({required BuildContext context,required String msg, bool isError = false, bool isPositioned = true}) {
  FToast fToast = FToast();
  fToast.init(context);

  Widget snackToast = Container(
    alignment: Alignment.center ,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    // width: MediaQuery.of(context).size.width ,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: isError ? Colors.red : AppColors.primaryColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/logoIc.jpg", height: 20, width: 20,),
        SizedBox(
          width: 12.0,
        ),
        Expanded(child: Text(msg, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)),
      ],
    ),
  );

  fToast.showToast(
    child: snackToast,
    gravity:isPositioned ? ToastGravity.TOP : ToastGravity.BOTTOM ,
    toastDuration: Duration(seconds: 2),
  );

}

// _showToast() {
//   Widget toast = Container(
//     padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(25.0),
//       color: Colors.greenAccent,
//     ),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(Icons.check),
//         SizedBox(
//           width: 12.0,
//         ),
//         Text("This is a Custom Toast"),
//       ],
//     ),
//   );
//
//
//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.BOTTOM,
//     toastDuration: Duration(seconds: 2),
//   );
//
//   // Custom Toast Position
//   // fToast.showToast(
//   //     child: toast,
//   //     toastDuration: Duration(seconds: 2),
//   //     positionedToastBuilder: (context, child) {
//   //       return Positioned(
//   //         child: child,
//   //         top: 16.0,
//   //         left: 16.0,
//   //       );
//   //     }
//   //    );
// }