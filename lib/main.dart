import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app_routes/app_routes.dart';
import 'utils/app_colors/app_colors.dart';

void main() {
  // অ্যাপ শুরু হওয়ার আগে কোনো ইনিশিয়াল কনফিগ থাকলে এখানে করা যায়
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MicroHabitApp());
}

class MicroHabitApp extends StatelessWidget {
  const MicroHabitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // টাইটেল এবং ডিবাগ ব্যানার অফ করা
      title: 'MicroHabit Challenge',
      debugShowCheckedModeBanner: false,

      // থিম সেটিংস (আপনার ডিজাইন অনুযায়ী প্রিমিয়াম লুক)
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins', // যদি ফন্ট অ্যাড করে থাকেন
        scaffoldBackgroundColor: AppColors.scaffoldBg,

        // অ্যাপবার এবং কার্ডের ডিফল্ট স্টাইল
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),

      // প্রথম যে স্ক্রিনটা দেখাবে (Splash Screen)
      initialRoute: AppRoutes.splash,

      // সব স্ক্রিনের রাউট লিস্ট (AppPages থেকে আসবে)
      getPages: AppRoutes.routes,

      // ডিফল্ট ট্রানজিশন (স্মুথ এনিমেশনের জন্য)
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}