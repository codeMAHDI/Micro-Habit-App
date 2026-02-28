import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';
import '../controller/create_challenge_controller.dart';
import '../widgets/category_selector.dart';
import '../widgets/gradient_header.dart';
import '../widgets/image_picker_container.dart';
import '../widgets/section_card.dart';

class CreateChallengeView extends StatelessWidget {
  const CreateChallengeView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CreateChallengeController());
    final titleEditController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FA),
      body: Column(
        children: [
          const GradientHeader(
            title: 'Create Challenge',
            subtitle: 'Design Your Habit',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  // Title Section
                  SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Challenge Title', fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          textEditingController: titleEditController,
                          hintText: 'e.g., Morning Yoga Flow',
                          keyboardType: TextInputType.text,
                          hintStyle: TextStyle(color: AppColors.black.withOpacity(0.5), fontSize: 14),
                          fillColor: const Color(0xFFF0F3FA),
                          fieldBorderRadius: 14,
                          fieldBorderColor: Colors.transparent,
                          suffixIcon: Icon(Icons.edit_note_rounded, color: Colors.grey.withOpacity(0.5), size: 22),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),
                  CustomText(text: 'Select Category', fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black87),
                  SizedBox(height: 14.h),

                  // Category Section
                  Obx(() => CategorySelector(
                    categories: c.categories,
                    selectedCategory: c.selectedCategory.value,
                    onSelect: c.selectCategory,
                  )),

                  SizedBox(height: 28.h),

                  // Duration Header
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Duration', fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black87),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                        decoration: BoxDecoration(color: const Color(0xFFE8EFFE), borderRadius: BorderRadius.circular(20.r)),
                        child: CustomText(text: '${c.selectedDays.value} Days', fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF4A6FE8)),
                      ),
                    ],
                  )),

                  SizedBox(height: 16.h),

                  // Slider Section
                  Obx(() => Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 4,
                          activeTrackColor: const Color(0xFF4A6FE8),
                          thumbColor: const Color(0xFF4A6FE8),
                        ),
                        child: Slider(
                          value: (c.selectedDays.value - 7) / (30 - 7),
                          onChanged: (v) {
                            final raw = 7 + v * (30 - 7);
                            final snapped = c.durationOptions.reduce((a, b) => (a - raw).abs() < (b - raw).abs() ? a : b);
                            c.selectDays(snapped);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: c.durationOptions.map((d) => CustomText(
                          text: '$d DAYS', fontSize: 11,
                          fontWeight: c.selectedDays.value == d ? FontWeight.w700 : FontWeight.w400,
                          color: c.selectedDays.value == d ? const Color(0xFF4A6FE8) : Colors.grey,
                        )).toList(),
                      ),
                    ],
                  )),

                  SizedBox(height: 24.h),
                  ImagePickerContainer(onTap: () {}),

                  SizedBox(height: 28.h),
                  CustomButton(
                    title: 'Save Challenge 🚀',
                    height: 54,
                    borderRadius: 30,
                    gradient: const LinearGradient(colors: [Color(0xFF4A6FE8), Color(0xFF6A8FF8)]),
                    onTap: () => Get.back(),
                  ),

                  SizedBox(height: 10.h),
                  const Center(child: CustomText(text: 'You can edit the frequency in the next step', fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}