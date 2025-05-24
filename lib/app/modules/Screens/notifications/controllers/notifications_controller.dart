import 'package:get/get.dart';

class NotificationController extends GetxController {
  var selectedTab = 'All'.obs;
  var selectedClearOption = 'Clear'.obs;
  var selectedSource = 'Source'.obs;
  var navTabIndex = 0.obs;

  List<String> sources = [
    'Source 1', 'Source 2', 'Source 3', 'Source 4', 'Source 5',
    'Source 6', 'Source 7', 'Source 8', 'Source 9', 'Source 10', 'Source 11'
  ];

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  void changeSource(String source) {
    selectedSource.value = source;
  }

  void changeClearOption(String option) {
    selectedClearOption.value = option;
    // Implement clear logic
  }

  void clearNotifications() {
    // Logic to clear notifications
  }

  void onNavTap(int index) {
    navTabIndex.value = index;
    // Add page change logic if needed
  }
}
