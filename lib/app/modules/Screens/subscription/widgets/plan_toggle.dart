import 'package:flutter/material.dart';

class PlanToggleButton extends StatelessWidget {
  final String label;
  final String value;
  final String selectedValue;
  final VoidCallback onTap;

  const PlanToggleButton({
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSelected = selectedValue == value;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.85,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(11),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(11)
          ),
          border: Border.all(color: isSelected ? Color(0xFF172B75) : Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontWeight: FontWeight.w300,
            color: isSelected? Color(0xFF172B75): Colors.grey)),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Color(0xFF172B75) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

