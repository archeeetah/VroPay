import 'package:flutter/material.dart';

class NotifTopBar extends StatelessWidget {
  final Function(int)? onItemTap;
  final int selectedIndex;

  const NotifTopBar({
    super.key,
    this.onItemTap,
    required this.selectedIndex,
  });

  final List<_NavItem> _items = const [
    _NavItem(icon: Icons.cloud, label: 'Chat'),
    _NavItem(icon: Icons.library_books, label: 'Library'),
    _NavItem(icon: Icons.storefront, label: 'Launch Pad'),
    _NavItem(icon: Icons.edit, label: 'Feedback'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onItemTap?.call(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  size: 30,
                  color: isSelected ? Colors.blue : Colors.grey,
                ),
                const SizedBox(height: 4),
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.blue : Colors.black54,
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
