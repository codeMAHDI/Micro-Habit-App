import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:micro_habit/view/screen/create_challenge/view/create_challenge_view.dart';
import '../controller/navbar_controller.dart';
import 'home_alternative_screen.dart'; // Home
import '../../stats/view/stats_view.dart'; // Stats
import '../../profile/view/profile_view.dart'; // Profile

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // কন্ট্রোলার ইনিশিয়ালাইজ করা
    final NavbarController controller = Get.put(NavbarController());

    // আপনার ডিজাইন অনুযায়ী স্ক্রিন লিস্ট
    final List<Widget> screens = [
      const HomeAlternativeScreen(), // Index 0
      const CreateChallengeView(), // Index 1 (Habits)
      const StatsScreen(),             // Index 2 (Stats)
      const ProfileScreen(),        // Index 3 (Profile)
    ];

    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),

      // Floating Action Button (মাঝখানের বড় বাটনটি)
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/create_challenge'),
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // কাস্টম বটম ন্যাভিগেশন বার
      bottomNavigationBar: Obx(() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_filled, "Home", 0, controller),
            _buildNavItem(Icons.assignment_outlined, "Habits", 1, controller),
            const SizedBox(width: 40), // মাঝখানের FAB এর জন্য গ্যাপ
            _buildNavItem(Icons.bar_chart_rounded, "Stats", 2, controller),
            _buildNavItem(Icons.person_outline, "Profile", 3, controller),
          ],
        ),
      )),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, NavbarController controller) {
    bool isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? Colors.blueAccent : Colors.grey),
          Text(label, style: TextStyle(
            color: isSelected ? Colors.blueAccent : Colors.grey,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          )),
        ],
      ),
    );
  }
}