import 'package:get/get.dart';
import '../../view/screen/authentication/view/login_screen.dart';
import '../../view/screen/authentication/view/sign_up_screen.dart';
import '../../view/screen/create_challenge/view/create_challenge_view.dart';
import '../../view/screen/home/view/home_alternative_screen.dart';
import '../../view/screen/home/view/home_screen.dart';
import '../../view/screen/home/view/main_screen.dart';
import '../../view/screen/profile/view/profile_view.dart';
import '../../view/screen/splash_screen/view/splash_screen.dart';
import '../../view/screen/stats/view/stats_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String homeAlternative = '/home_alternative';
  static const String homeDashboard = '/home_dashboard';
  static const String createChallenge = '/create_challenge';
  static const String main = '/main';
  static const String stats = '/stats';
  static const String profile = '/profile';

  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: AppRoutes.homeAlternative, page: () => const HomeAlternativeScreen()),
    GetPage(name: AppRoutes.homeDashboard, page: () => const HomeDashboardScreen()),
    GetPage(name: AppRoutes.main, page: () => const MainScreen()),
    GetPage(name: AppRoutes.createChallenge, page: () => const CreateChallengeView()),
    GetPage(name: AppRoutes.stats, page: () => const StatsScreen()),
    GetPage(name: AppRoutes.profile, page: () => const ProfileScreen()),
  ];
}
