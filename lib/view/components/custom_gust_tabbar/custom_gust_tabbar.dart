import 'package:flutter/material.dart';
import '../../../../../../utils/app_colors/app_colors.dart';
import '../custom_text/custom_text.dart';

class CustomGustTabbar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final Color selectedColor;
  final Color? textColor;
  final bool? isPadding;

  const CustomGustTabbar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.selectedColor,
    this.textColor,
    this.isPadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(tabs.length, (index) {
          bool isSelected = index == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 8.0,
              right: index == tabs.length - 1 ? 0 : 0,
            ),
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? selectedColor : AppColors.white,
                  border: Border.all(
                    color: isSelected ? selectedColor : AppColors.primary,
                    width: 1.5,
                  ),
                ),
                child: CustomText(
                  text: tabs[index],
                  color: isSelected ? AppColors.white : AppColors.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}