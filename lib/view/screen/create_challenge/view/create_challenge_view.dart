import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/custom_gradient_button/custom_gradient_button.dart';

class CreateChallengeView extends StatelessWidget {
  const CreateChallengeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Create Challenge"),
        flexibleSpace: Container(decoration: BoxDecoration(gradient: AppColors.primaryGradient)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Design Your Habit", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "Challenge Title", border: OutlineInputBorder())),
            const SizedBox(height: 20),
            const Text("Select Category"),
            Wrap(
              spacing: 10,
              children: [
                ChoiceChip(label: const Text("Health"), selected: true, selectedColor: Colors.blue[100]),
                ChoiceChip(label: const Text("Fitness"), selected: false),
                ChoiceChip(label: const Text("Mindful"), selected: false),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Duration: 21 Days"),
            Slider(value: 21, min: 7, max: 30, onChanged: (v){}),
            const Spacer(),
            CustomGradientButton(
              text: "Save Challenge",
              gradient: AppColors.primaryGradient,
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}