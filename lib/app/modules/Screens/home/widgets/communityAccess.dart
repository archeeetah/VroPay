import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class CommunityAccessScreen extends StatelessWidget {
  final VoidCallback onFinish;

  const CommunityAccessScreen({required this.onFinish});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/communityAccess.png',
              height: 150,
              width: 293,
            ),
            const SizedBox(height: 20),
            const Text(
              'Community Access',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600,
                  color: Color(0xFF172B75)),
            ),
            const Text(
              'engage, connect and share.',
              style: TextStyle(color: Color(0x8F172B75),
                  fontSize: 14),
            ),
            const SizedBox(height: 20),

            Obx(() {
              final selected = controller.selectedCommunityAccess.value;

              return Column(
                children: [
                  _buildOption(
                    "Interact and share ideas",
                    "on your preferred topics",
                    selected,
                    controller,
                  ),
                  _buildOption(
                    "Only read content",
                    "on your preferred topics",
                    selected,
                    controller,
                  ),
                ],
              );
            }),



            const SizedBox(height: 40),
            SizedBox(
              width: 290,
              child: ElevatedButton(
                onPressed: onFinish,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEF2D56),
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(28),
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                ),
                child: const Text("Allow to Join",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String title, String description, String? selectedOption, HomeController controller) {
    final bool selected = selectedOption == title;
    final borderColor = const Color(0xFF172B75);

    return GestureDetector(
      onTap: () => controller.updateCommunityAccess(title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: selected ? 2.1 : 0.2,
          ),
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF172B75)
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    selected ? Icons.check_circle_outline : Icons.circle_outlined,
                    color: borderColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 12.58,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF172B75),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}