import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/glass_card/glass_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            const Text("Alex Rivers", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Habit Master • Pro Member", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 30),
            GlassCard(
              child: ListTile(
                title: const Text("Total Rewards", style: TextStyle(color: Colors.white70)),
                subtitle: const Text("2,450 Points", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                trailing: ElevatedButton(onPressed: () {}, child: const Text("Redeem")),
              ),
            ),
            const SizedBox(height: 40),
            _buildProfileOption(Icons.person_outline, "Personal Information"),
            _buildProfileOption(Icons.notifications_none, "Notification Settings"),
            _buildProfileOption(Icons.security, "Privacy & Security"),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              onTap: () => Get.offAllNamed('/login'), // এখানে onTap হবে, onPressed নয়
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white30),
      onTap: () {},
    );
  }
}