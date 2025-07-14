import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vropay/app/modules/Screens/home/widgets/curvedTextField.dart';
import '../controllers/home_controller.dart';

class UserDetail extends GetView<HomeController> {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: const Text(
                "Welcome to\nVroPay 💙",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFC7D0D7),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                width: double.infinity,
                color: Color(0xFFF7F7F7),
                child: Image.asset("assets/images/home.png", height: 212)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFDEEAF1),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 90,
                          child: CurvedTextField(
                            controller: controller.firstNameController,
                            hint: 'first name',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CurvedTextField(
                          controller: controller.lastNameController,
                          hint: 'last name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _genderSelector(),
                  const SizedBox(height: 12),
                  _roleDropdown(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.isUserDetailValid()) {
                        controller.nextPage();
                      } else {
                        Get.snackbar(
                            "Incomplete", "Please fill in all required fields");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF172B75),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("proceed", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_right_alt),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text("Need help? [FAQs]",
                      style: TextStyle(color: Colors.black54))
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'vropay',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF172B75),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderSelector() {
    final genders = ['female', 'Male', "don't want to disclose"];
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: genders.map((gender) {
          final isSelected = gender == controller.selectedLevel.value;
          return GestureDetector(
            onTap: () => controller.selectLevel(gender),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF61A7FF) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                gender,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }

  Widget _roleDropdown() {
    final roles = [
      {'value': 'Student', 'icon': 'assets/icons/student.png'},
      {
        'value': 'Working professional',
        'icon': 'assets/icons/workingProfessional.png'
      },
      {'value': 'Business owner', 'icon': 'assets/icons/businessOwner.png'},
    ];

    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFB8C9DA),
          borderRadius: BorderRadius.circular(20),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: controller.selectedRole.value.isEmpty
                ? null
                : controller.selectedRole.value,
            hint: const Text("you’re a"),
            icon: const Icon(Icons.keyboard_arrow_down),
            items: roles.map((role) {
              return DropdownMenuItem<String>(
                value: role['value'],
                child: Row(
                  children: [
                    Image.asset(
                      role['icon']!,
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        role['value']!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) => controller.selectedRole.value = value ?? '',
          ),
        ),
      );
    });
  }
}
