import 'package:get/get.dart';
import 'package:vropay/app/modules/Screens/subscription/widgets/free_pop_up.dart';

import '../../TrialTransitionView/trial_transition_view.dart';

enum UserType { student, professional, business }

class SubscriptionController extends GetxController {
  var userType = UserType.student.obs;
  var selectedPlan = 'yearly'.obs;
  var enableTrial = false.obs;

  bool _navigating = false;

  void toggleTrial(bool value) {
    enableTrial.value = value;

    if (value && !_navigating) {
      _navigating = true;

      // Navigate to dialog popup
      Get.dialog(
        FreePopUp(onNext: () {
          Get.back();
          Get.to(() => TrialTransitionView());
        },));

      // After delay, go to home screen
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAllNamed('/notification');
        _navigating = false;
      });
    }
  }

  void selectPlan(String plan) => selectedPlan.value = plan;
  void setUserType(UserType type) => userType.value = type;
}
