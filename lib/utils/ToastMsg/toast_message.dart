import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomSnackBar(String? message, {bool isError = true}) {
  if (message != null && message.isNotEmpty) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: isError ? Colors.red : Colors.green,
     /* msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP, // Toast appears at the top
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.transparent,
      //isError ? Colors.red : Colors.green,
      textColor: isError ? Colors.red : Colors.green,
      fontSize: 14.sp,*/
    );
  }
}
// import 'package:get/get.dart';
//
// void showCustomSnackBar(String message, {bool isError = true}) {
//   if (Get.context == null) {
//     Fluttertoast.showToast(
//         msg: message,
//         backgroundColor: isError ? Colors.red : Colors.green,
//         textColor: Colors.white,
//         toastLength: Toast.LENGTH_LONG
//     );
//     return;
//   }
//
//   Get.snackbar(
//     isError ? "Error" : "Success",
//     message,
//     snackPosition: SnackPosition.TOP,
//     backgroundColor: isError ? Colors.redAccent : Colors.green,
//     colorText: Colors.white,
//     borderRadius: 10,
//     margin: const EdgeInsets.all(10),
//     duration: const Duration(seconds: 3),
//     icon: Icon(
//       isError ? Icons.error_outline : Icons.check_circle_outline,
//       color: Colors.white,
//     ),
//   );
// }

void toastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    gravity: ToastGravity.TOP,
    toastLength: Toast.LENGTH_LONG,
  );
}
