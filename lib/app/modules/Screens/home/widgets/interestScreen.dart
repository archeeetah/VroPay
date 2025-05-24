import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'communityAccess.dart';
import 'difficultyScreen.dart';
import 'notificationPopUp.dart';
import '../controllers/home_controller.dart';

class InterestsScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                Image.asset(
                  'assets/images/Interest.png',
                  height: 120,
                  width: 146,
                ),

                const SizedBox(height: 10),

                const Text(
                  "Follow your Interests",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0066FF),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10),

                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "we'll build\n",
                        style: TextStyle(fontSize: 20, color: Color(0xA6172B75)),
                      ),
                      TextSpan(
                        text: "Your Personalised CONTENT STREAK\n",
                        style: TextStyle(fontSize: 20, color: Color(0xFF00B8F0)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Obx(() {
                  return Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: controller.interests.map((topic) {
                      final isSelected = controller.selectedInterests.contains(topic);
                      return ChoiceChip(
                        showCheckmark: false,
                        label: Text(topic),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Color(0xFF172B75),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        backgroundColor: Colors.white,
                        selectedColor: Color(0xFF172B75),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFF172B75)),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        selected: isSelected,
                        onSelected: (_) => controller.toggleInterest(topic),
                      );
                    }).toList(),
                  );
                }),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!controller.hasSelectedInterests()) {
                        Get.snackbar(
                          "Hold on!",
                          "Please select at least one interest.",
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.all(15),
                        );
                        return;
                      }

                      Get.dialog(
                        DifficultyLevelScreen(
                          onNext: () {
                            Get.back();
                            Get.dialog(
                              NotificationScreen(
                                onNext: () {
                                  Get.back();
                                  Get.dialog(
                                    CommunityAccessScreen(
                                      onFinish: () {
                                        Get.back();
                                        Get.offAllNamed('/subscription');
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        barrierDismissible: false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEF2D56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // small breathing room at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
