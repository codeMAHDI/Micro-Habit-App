import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../screen/authentication/controller/auth_controller.dart';
import '../../screen/role/guest/guest_home_screen/view/guest_home/view/guest_home_screen.dart';
import '../../screen/role/property_owner/message/view/message_screen.dart';
import '../../screen/role/property_owner/profile/profile_screen/profile_screen.dart';
import '../../screen/role/property_owner/property_owner_home_screen/property_owner_home_screen/view/property_owner_home_screen.dart';
import '../../screen/role/service_provider/service_provider_home_screen/service_provider_home/view/service_provider_home_screen.dart';
import '../custom_text/custom_text.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;

   NavBar({required this.currentIndex, super.key});
  final AuthController authController = Get.put(AuthController());

  final List<String> navbarNameList = const [
    "Home",
    "Message",
    "Profile",
  ];

  final List<String> selectedIcon = const [
    AppIcons.home,
    AppIcons.message,
    AppIcons.profile,
  ];

  final List<String> unselectedIcon = const [
    AppIcons.home,
    AppIcons.message,
    AppIcons.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: const Color(0xffFEFEFE),
      ),
      height: 85.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          selectedIcon.length,
              (index) => InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                Container(
                  height: 40.h,
                  width: 40.w,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    index == currentIndex
                        ? selectedIcon[index]
                        : unselectedIcon[index],
                    height: 24.h,
                    width: 24.w,
                    color: index == currentIndex
                        ? AppColors.primary
                        : AppColors.gery2,
                  ),
                ),
                CustomText(
                  text: navbarNameList[index],
                  color: index == currentIndex
                      ? AppColors.primary
                      : AppColors.gery2,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index != currentIndex) {
      switch (index) {
        case 0:
          _navigateToHome();
          break;
        case 1:
          Get.offAll(() => const MessageScreen());
          break;
        case 2:
          Get.offAll(() => ProfileScreen());
          break;
      }
    }
  }

  void _navigateToHome() {
    String role = authController.selectedRole.value;
    switch (role) {
      case 'propertyOwner':
        Get.offAll(() =>  PropertyOwnerHomeScreen());
        break;
      case 'serviceProvider':
        Get.offAll(() =>  ServiceProviderHomeScreen());
        break;
      case 'guest':
        Get.offAll(() => const GuestHomeScreen());
        break;
      default:
        Get.offAll(() =>  PropertyOwnerHomeScreen());
    }
  }
}