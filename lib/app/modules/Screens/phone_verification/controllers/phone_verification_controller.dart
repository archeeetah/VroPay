import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../OtpScreen/controllers/otp_screen_controller.dart';

class PhoneVerificationController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  var isValid = false.obs;
  var userPhone = ''.obs;

  void sendOtpToPhone() {
    final phone = phoneController.text.trim();
    if (phone.length == 10 && RegExp(r'^[0-9]+$').hasMatch(phone)) {
      userPhone.value = phone;
      
      // Set up OTP controller with the entered phone number
      OTPController otpController;
      if (Get.isRegistered<OTPController>()) {
        otpController = Get.find<OTPController>();
      } else {
        otpController = Get.put(OTPController());
      }
      
      // Set the phone values in OTP controller
      otpController.userPhone.value = phone;
      otpController.phoneController.text = phone;
      otpController.isPhoneOtp.value = true;
      
      Get.snackbar("OTP Sent", "OTP has been sent to $phone",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFF172B75),
          colorText: Colors.white);
    } else {
      Get.snackbar("Error", "Invalid phone number",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0xFFE74C3C),
          colorText: Colors.white);
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
