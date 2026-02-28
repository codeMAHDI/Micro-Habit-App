import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================Default Custom Controller ==================
    // Get.lazyPut(() => CustomController(), fenix: true);
    // Get.lazyPut(() => GuestManagementController(), fenix: true);
    // Get.lazyPut(() => AuthController(), fenix: true);

  }
}
