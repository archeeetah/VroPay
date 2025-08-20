import 'package:flutter/material.dart';

class SubscriptionDialog extends StatelessWidget {
  final VoidCallback onMonthly;
  final VoidCallback onAnnual;
  final VoidCallback onBack;

  const SubscriptionDialog({
    super.key,
    required this.onMonthly,
    required this.onAnnual,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Back Button
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.orange),
                onPressed: onBack,
              ),
            ),

            // Image
            Image.asset(
              'assets/images/monthly.png',
              height: 150,
            ),

            const SizedBox(height: 20),

            const Text(
              'wanna keep paying monthly\n on autopay ?\nOr switch to a cheaper,\none-time yearly plan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF006DF4),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            // Monthly Button (white background + red text)
            _buildPlanButton(
              label: "pay for monthly autopay\nsubscription",
              onPressed: onMonthly,
              bgColor: Color(0xFFF7F7F7),
              textColor: const Color(0xFFEF2D56),
              arrowColor: const Color(0xFFEF2D56),
              borderColor: const Color(0xFFEF2D56),
              underline: true,
            ),

            const SizedBox(height: 14),

            // Annual Button (solid red background + white text)
            _buildPlanButton(
              label: "Go for annual",
              onPressed: onAnnual,
              bgColor: const Color(0xFFEF2D56),
              textColor: Colors.white,
              arrowColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanButton({
    required String label,
    required VoidCallback onPressed,
    required Color bgColor,
    required Color textColor,
    required Color arrowColor,
    Color borderColor = Colors.transparent,
    bool underline = false,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: const StadiumBorder(),
        minimumSize: const Size(double.infinity, 55),
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Left arrows
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_forward_ios, color: arrowColor, size: 20),
                Transform.translate(
                  offset: const Offset(-6, 0),
                  child: Icon(Icons.arrow_forward_ios,
                      color: arrowColor, size: 20),
                ),
              ],
            ),
          ),

          // Center text
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: textColor,
              decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
