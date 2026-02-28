import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors/app_colors.dart';

class HomeAlternativeScreen extends StatelessWidget {
  const HomeAlternativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildStreakBanner(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Daily Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: _buildProgressCard("Hydration", "75%", Colors.cyan)),
                      const SizedBox(width: 15),
                      Expanded(child: _buildProgressCard("Steps", "40%", Colors.teal)),
                    ],
                  ),
                  const SizedBox(height: 25),
                  _buildUpNextSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 30),
      color: Colors.grey[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 25, backgroundColor: Colors.blue),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("WELCOME BACK", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Text("Alex Rivera", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const Icon(Icons.notifications_none),
        ],
      ),
    );
  }

  Widget _buildStreakBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.cyan[50], borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: const [
          Icon(Icons.flash_on, color: Colors.cyan),
          SizedBox(width: 10),
          Text("14 Day Streak", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.cyan)),
        ],
      ),
    );
  }

  Widget _buildProgressCard(String title, String val, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          CircularProgressIndicator(value: 0.7, color: color),
          const SizedBox(height: 10),
          Text(title),
          Text(val, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color)),
        ],
      ),
    );
  }

  Widget _buildUpNextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Up Next", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ListTile(
          tileColor: Colors.grey[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          leading: const Icon(Icons.book_outlined),
          title: const Text("Read 10 Pages"),
          subtitle: const Text("Atomic Habits"),
          trailing: const Text("10:00 AM"),
        ),
      ],
    );
  }
}