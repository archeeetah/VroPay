import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isDifferent;

  const CustomFilledButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
    this.isDifferent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 250,
      height: 60,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: Color(0xFF172B75),
            width: 1.8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isDifferent ? 28 : 8),
              topRight: Radius.circular(isDifferent ? 8 : 28),
              bottomLeft: Radius.circular(isDifferent ? 8 : 28),
              bottomRight: Radius.circular(isDifferent ? 28 : 8),
            ),
          ),
          backgroundColor: isSelected
              ? Color(0xFF172B75)
              : Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: isSelected? Colors.white: Color(0xFF172B75),
          ),
        ),
      ),
    );
  }
}
