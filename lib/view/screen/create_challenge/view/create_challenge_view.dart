import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_button/custom_button.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/custom_text_field/custom_text_field.dart';
import '../controller/create_challenge_controller.dart';

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
          _GradientHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  _SectionCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Challenge Title',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10.h),
                        CustomTextField(
                          textEditingController: titleEditController,
                          hintText: 'e.g., Morning Yoga Flow',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          fillColor: const Color(0xFFF0F3FA),
                          fieldBorderRadius: 14,
                          fieldBorderColor: Colors.transparent,
                          cursorColor: AppColors.primary,
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontSize: 14,
                          ),
                          inputTextStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                          suffixIcon: Icon(Icons.edit_note_rounded,
                              color: Colors.grey.withOpacity(0.5), size: 22),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Select Category
                  CustomText(
                    text: 'Select Category',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 14.h),

                  Obx(() => Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: c.categories.map((cat) {
                      final isSelected =
                          c.selectedCategory.value == cat['label'];
                      return GestureDetector(
                        onTap: () => c.selectCategory(cat['label']),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? const LinearGradient(
                              colors: [
                                Color(0xFF4A6FE8),
                                Color(0xFF6A8FF8)
                              ],
                            )
                                : null,
                            color: isSelected ? null : Colors.white,
                            borderRadius: BorderRadius.circular(30.r),
                            boxShadow: [
                              BoxShadow(
                                color: isSelected
                                    ? const Color(0xFF4A6FE8).withOpacity(0.3)
                                    : Colors.black.withOpacity(0.04),
                                blurRadius: isSelected ? 10 : 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(cat['icon'],
                                  style: TextStyle(fontSize: 14.sp)),
                              SizedBox(width: 6.w),
                              CustomText(
                                text: cat['label'],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )),

                  SizedBox(height: 28.h),

                  // Duration
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Duration',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8EFFE),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: CustomText(
                          text: '${c.selectedDays.value} Days',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4A6FE8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),

                  SizedBox(height: 16.h),

                  // Slider
                  Obx(() {
                    final days = c.selectedDays.value;
                    final sliderVal =
                        (days - 7) / (30 - 7);
                    return Column(
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 4,
                            activeTrackColor: const Color(0xFF4A6FE8),
                            inactiveTrackColor: Colors.grey.withOpacity(0.2),
                            thumbColor: const Color(0xFF4A6FE8),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 10),
                            overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 0),
                          ),
                          child: Slider(
                            value: sliderVal,
                            min: 0,
                            max: 1,
                            onChanged: (v) {
                              // Snap to nearest option
                              final raw = 7 + v * (30 - 7);
                              final opts = c.durationOptions;
                              final snapped = opts.reduce((a, b) =>
                              (a - raw).abs() < (b - raw).abs() ? a : b);
                              c.selectDays(snapped);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: c.durationOptions.map((d) {
                              final isActive = c.selectedDays.value == d;
                              return CustomText(
                                text: '$d DAYS',
                                fontSize: 11,
                                fontWeight: isActive
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                color: isActive
                                    ? const Color(0xFF4A6FE8)
                                    : Colors.grey,
                                textAlign: TextAlign.center,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }),

                  SizedBox(height: 24.h),

                  // Add Cover Image
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 110.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xFF4A6FE8).withOpacity(0.4),
                          width: 1.5,
                          // dashed effect via custom paint below
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF1FD),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Icons.add_a_photo_outlined,
                                color: const Color(0xFF4A6FE8), size: 22.sp),
                          ),
                          SizedBox(height: 8.h),
                          CustomText(
                            text: 'Add Cover Image',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 28.h),

                  CustomButton(
                    title: 'Save Challenge 🚀',
                    height: 54,
                    borderRadius: 30,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4A6FE8), Color(0xFF6A8FF8)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF4A6FE8).withOpacity(0.4),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    onTap: () => Get.back(),
                  ),

                  SizedBox(height: 10.h),

                  Center(
                    child: CustomText(
                      text: 'You can edit the frequency in the next step',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      textAlign: TextAlign.center,
                    ),
                  ),

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

class _GradientHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5B6FF5), Color(0xFF7B9CF8)],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 16.sp),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  CustomText(
                    text: 'Create Challenge',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              CustomText(
                text: 'Step 1 of 2',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.75),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: 'Design Your Habit',
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}