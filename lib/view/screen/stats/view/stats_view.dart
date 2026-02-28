import 'package:flutter/material.dart';
import '../../../../utils/app_colors/app_colors.dart';
import '../../../components/glass_card/glass_card.dart';
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(title: const Text("Premium Analytics"), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Center(
              child: SizedBox(
                height: 200, width: 200,
                child: CircularProgressIndicator(value: 0.78, strokeWidth: 10, color: Colors.blueAccent),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatBox("Total Completed", "1,284", "+12%"),
                _buildStatBox("Success Rate", "92%", "+3.4%"),
              ],
            ),
            const SizedBox(height: 30),
            const Align(alignment: Alignment.centerLeft, child: Text("Weekly Progress", style: TextStyle(color: Colors.white, fontSize: 18))),
            const SizedBox(height: 10),
            Container(height: 150, decoration: BoxDecoration(color: AppColors.lightBlue, borderRadius: BorderRadius.circular(20))),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String t, String v, String tr) {
    return GlassCard(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(t, style: const TextStyle(color: Colors.white70)),
            Text(v, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            Text(tr, style: const TextStyle(color: Colors.greenAccent)),
          ],
        ),
      ),
    );
  }
}