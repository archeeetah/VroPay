import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var currentStep = 1.obs;
  RxString selectedRole = ''.obs;
  var selectedLevel = ''.obs;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  bool isUserDetailValid() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        selectedRole.value.isNotEmpty;
  }

  void selectLevel(String level) {
    selectedLevel.value = level;
  }

  void nextPage() {
    if (currentIndex < 4) currentIndex++;
  }

  void prevPage() {
    if (currentIndex > 0) currentIndex--;
  }

  final RxList<String> interests = <String>[].obs;
  var selectedInterests = <String>{}.obs;

  bool hasSelectedInterests() => selectedInterests.isNotEmpty;

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  void clearInterests() {
    selectedInterests.clear();
  }

  RxnString selectedCommunityAccess = RxnString();

  void updateCommunityAccess(String option) {
    selectedCommunityAccess.value = option;
  }

  void resetForm() {
    firstNameController.clear();
    lastNameController.clear();
    selectedRole.value = '';
    selectedLevel.value = '';
    selectedInterests.clear();
    selectedCommunityAccess.value = null;
    currentStep.value = 1;
  }

  @override
  void onInit() {
    super.onInit();
    interests.value = [
      "Quantum Leap", "Entrepreneurship", "AI Tools",
      "Finance", "Law", "Health",
      "Stocks", "Technology", "Books",
      "Podcast", "Art", "Funding",
      "History", "News", "Investing", "Visionaries", "Hustle",
      "Vocab", "Spirituality", "Vedi wise",
      "Travel", "USA", "Astrology",
      "Geeta Gyan", "Music", "Startup",
    ];
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.onClose();
  }
}
