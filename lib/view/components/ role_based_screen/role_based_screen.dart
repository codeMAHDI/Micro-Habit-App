import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screen/authentication/controller/auth_controller.dart';
import '../../screen/role/guest/guest_home_screen/view/guest_home/view/guest_home_screen.dart';
import '../../screen/role/property_owner/property_owner_home_screen/property_owner_home_screen/view/property_owner_home_screen.dart';
import '../../screen/role/service_provider/service_provider_home_screen/service_provider_home/view/service_provider_home_screen.dart';
import '../custom_nav_bar/navbar.dart';

class RoleBasedScreen extends StatelessWidget {
  final Widget child;
  final int navIndex;
  // final String role; // propertyOwner, provider, guest
  final PreferredSizeWidget? appBar;

  const RoleBasedScreen({
    required this.child,
    required this.navIndex,
    // required this.role,
    this.appBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    // final String currentRole = authController.selectedRole.value;
    return WillPopScope(
      onWillPop: () async {
        if (navIndex != 0) {
          _navigateToHome(authController.selectedRole.value);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: appBar,
        body: child,
        bottomNavigationBar: NavBar(currentIndex: navIndex),
      ),
    );
  }

  void _navigateToHome(String role) {
    print("Navigating Back based on Role: $role");
    switch (role) {
      case 'propertyOwner':
        Get.offAll(() => PropertyOwnerHomeScreen());
        break;
      case 'serviceProvider':
        Get.offAll(() => ServiceProviderHomeScreen());
        break;
      case 'guest':
        Get.offAll(() => GuestHomeScreen());
        break;
      default:
        Get.offAll(() => PropertyOwnerHomeScreen());
    }
  }
}