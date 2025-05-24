import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vropay/Utilities%20/constants%20/KImages.dart';
import 'package:vropay/app/modules/Screens/home/widgets/interestScreen.dart';
import '../../../../../Components /constant_buttons.dart';
import '../controllers/home_controller.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

Widget _customInputField(
    TextEditingController controller, String hint, String imagePath) {
  return SizedBox(
    height: 70,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFF172B75),
                  fontSize: 16,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
              style: const TextStyle(fontSize: 16, color: Color(0xFF172B75)),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ),
      ],
    ),
  );
}

class _UserDetailsState extends State<UserDetails> {
  final HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUserFormDialog();
    });
  }

  void _showUserFormDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final screenWidth = MediaQuery.of(context).size.width;

        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 200),
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          "hii :) Welcome to VroPay",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF172B75),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: _customInputField(
                                controller.firstNameController,
                                'First Name',
                                KImages.nameVector,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _customInputField(
                                controller.lastNameController,
                                'Last Name',
                                KImages.surnameVector,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Obx(() => customDropdownField(
                          imagePath: KImages.professionVector,
                          hint: "What best describes you?",
                          value: controller.selectedRole.value,
                          hintTextColor: Color(0xFF172B75),
                          itemsWithIcons: [
                            {'value': 'Student', 'icon': KImages.studentIcon},
                            {'value': 'Working professional', 'icon': KImages.workingProfessionalIcon},
                            {'value': 'Business owner', 'icon': KImages.businessOwnerIcon},
                          ],
                          onChanged: (value) => controller.selectedRole.value = value!,
                        )),
                        const SizedBox(height: 50),
                        const SizedBox(height: 40),
                        CommonButton(
                          text: "Continue",
                          onPressed: () {
                            controller.currentStep.value = 2;
                            if (controller.isUserDetailValid()) {
                              Navigator.pop(context); // close the dialog
                              Get.to(() => InterestsScreen());
                            } else {
                              Get.snackbar("Error", "Please fill all the fields");
                            }
                          },
                        ),

                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildProgressDot(false),
                            _buildProgressDot(false),
                            _buildProgressDot(false),
                            _buildProgressDot(true)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              KImages.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),

          const Center(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  InputDecoration _dropdownDecoration(String hint) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF0F0F0),
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    );
  }
}

Widget _buildProgressDot(bool isActive) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    width: isActive ? 9 : 30,
    height: 4,
    decoration: BoxDecoration(
      color: isActive ? Color(0xFF172B75) : Color(0xFFD0D0D0),
      borderRadius: BorderRadius.circular(19),
    ),
  );
}

Widget customDropdownField({
  required String imagePath,
  required String hint,
  required String value,
  required List<Map<String, dynamic>> itemsWithIcons,
  required Function(String?) onChanged,
  required Color hintTextColor,
}) {
  return SizedBox(
    height: 80,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              value: value.isEmpty ? null : value,
              icon: const Icon(Icons.keyboard_arrow_down,
              color: Color(0xFF172B75),),
              dropdownColor: Colors.white,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(color: hintTextColor),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black),
              items: itemsWithIcons.map((item) {
                return DropdownMenuItem<String>(
                  value: item['value'],
                  child: Row(
                    children: [
                      Image.asset(
                        item['icon'],
                        height: 20,
                        width: 20,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 10),
                      Text(item['value']),
                    ],
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    ),
  );
}




