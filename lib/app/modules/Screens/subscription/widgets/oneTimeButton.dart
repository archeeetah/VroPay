import 'package:flutter/material.dart';

class OneTimeOfferButton extends StatelessWidget {
  final VoidCallback onTap;

  const OneTimeOfferButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          // Red Button
          Container(
            width: screenWidth * 0.85,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFEF2D56),
              borderRadius: BorderRadius.circular(46),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text block
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '₹1122 - ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'One time',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Text(
                      'for next 5 years',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                // Arrows
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22),
                    Transform.translate(
                      offset: Offset(-6, 0), // move left to overlap
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22),
                    ),
                    Transform.translate(
                      offset: Offset(-12, 0), // move further left
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Blue Label - Overlapping
          Positioned(
            top: -18, // push slightly above red button
            left: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1B2C80).withOpacity(0.40),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'For first 1000 paid users',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
