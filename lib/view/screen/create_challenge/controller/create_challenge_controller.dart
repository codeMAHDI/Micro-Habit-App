import 'package:get/get.dart';

class CreateChallengeController extends GetxController {
  final titleController = ''.obs;
  final selectedCategory = 'Health'.obs;
  final selectedDays = 21.obs;

  final List<Map<String, dynamic>> categories = [
    {'label': 'Health', 'icon': '❤️'},
    {'label': 'Focus', 'icon': '🎯'},
    {'label': 'Fitness', 'icon': '💪'},
    {'label': 'Mindful', 'icon': '🧘'},
    {'label': 'Growth', 'icon': '📈'},
  ];

  final List<int> durationOptions = [7, 14, 21, 30];

  void selectCategory(String cat) => selectedCategory.value = cat;
  void selectDays(int days) => selectedDays.value = days;
}