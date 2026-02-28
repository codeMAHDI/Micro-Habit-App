import 'package:get/get.dart';
import '../core/app_routes/app_routes.dart';
import '../helper/shared_prefe/shared_prefe.dart';
import '../utils/ToastMsg/toast_message.dart';
import '../utils/app_const/app_const.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode == 401) {
      await SharePrefsHelper.remove(AppConstants.bearerToken);
      // Get.offAllNamed(AppRoutes.loginScreen);
    } else {
      if (response.body is Map) {
        if (response.body['error'] != null) {
          showCustomSnackBar(response.body['error'].toString());
        } else if (response.body['message'] != null) {
          showCustomSnackBar(response.body['message'].toString());
        } else {
          showCustomSnackBar("Something went wrong! Code: ${response.statusCode}");
        }
      } else {
        showCustomSnackBar(response.statusText ?? "Server Error: ${response.statusCode}");
      }
    }
  }
}