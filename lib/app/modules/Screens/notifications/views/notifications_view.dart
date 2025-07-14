import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vropay/Components /bottom_navbar.dart';
import 'package:vropay/Components /top_navbar.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  final tabs = ['All', 'Unread', 'Today'];
  final clearOptions = ['Clear All', 'Clear Read', 'Clear Today'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomTopNavBar(
              selectedIndex: -1,
              onItemTap: (index) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tab filters (All, Unread, Today)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: tabs.map((tab) => Obx(() => GestureDetector(
                        onTap: () => controller.changeTab(tab),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: controller.selectedTab.value == tab ? Colors.blue : Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            tab,
                            style: TextStyle(
                              color: controller.selectedTab.value == tab ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ))).toList(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Source and Clear popups
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () => _showSourcePopup(context),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Source',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down_rounded, color: Colors.blue),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () => _showClearPopup(context),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Clear',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(Icons.info_outline, color: Colors.red, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Single-tapping a notification will mark it as read',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Notification List
            Expanded(
              child: Obx(() => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.filteredNotifications.length,
                itemBuilder: (context, index) {
                  final notif = controller.filteredNotifications[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: notif.isRead ? Colors.white : Colors.blue.shade50,
                    child: ListTile(
                      leading: _buildIcon(notif.iconType),
                      title: Text(
                        notif.title,
                        style: TextStyle(
                          fontWeight: notif.isRead ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                      subtitle: notif.body.isNotEmpty ? Text(notif.body) : null,
                      trailing: Text(_formatTimeAgo(notif.dateTime)),
                      onTap: () => controller.markAsRead(notif),
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          CustomBottomNavBar(currentIndex: 4,),
          Positioned(
            bottom: 8,
            right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.notifications_none_outlined, color: Colors.blue, size: 20),
                  const SizedBox(width: 4),
                  Text('Notifs', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSourcePopup(BuildContext context) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 150, 24, 0),
      items: controller.sources.map((source) => PopupMenuItem<String>(
        value: source,
        child: Row(
          children: [
            Icon(Icons.label_outline, size: 18),
            const SizedBox(width: 8),
            Text(source),
          ],
        ),
      )).toList(),
    ).then((value) {
      if (value != null) controller.changeSource(value);
    });
  }

  void _showClearPopup(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(250, 150, 24, 0),
      items: [
        PopupMenuItem<String>(
          value: 'Clear All',
          child: Row(children: [Icon(Icons.list, size: 18), SizedBox(width: 8), Text('clear all')]),
        ),
        PopupMenuItem<String>(
          value: 'Clear Read',
          child: Row(children: [Icon(Icons.mail, size: 18), SizedBox(width: 8), Text('read')]),
        ),
        PopupMenuItem<String>(
          value: 'Clear Today',
          child: Row(children: [Icon(Icons.calendar_today, size: 18), SizedBox(width: 8), Text('today')]),
        ),
      ],
    ).then((value) {
      if (value != null) controller.changeClearOption(value);
    });
  }

  Widget _buildIcon(String type) {
    switch (type) {
      case 'gift':
        return CircleAvatar(backgroundColor: Colors.green.shade100, child: Icon(Icons.card_giftcard, color: Colors.green));
      case 'badge':
        return CircleAvatar(backgroundColor: Colors.purple.shade100, child: Icon(Icons.emoji_events, color: Colors.purple));
      case 'points':
        return CircleAvatar(backgroundColor: Colors.orange.shade100, child: Icon(Icons.stars, color: Colors.orange));
      case 'post':
        return CircleAvatar(backgroundColor: Colors.blue.shade100, child: Icon(Icons.forum, color: Colors.blue));
      case 'score':
        return CircleAvatar(backgroundColor: Colors.indigo.shade100, child: Icon(Icons.bar_chart, color: Colors.indigo));
      case 'settings':
        return CircleAvatar(backgroundColor: Colors.grey.shade200, child: Icon(Icons.settings, color: Colors.grey));
      case 'chat':
        return CircleAvatar(backgroundColor: Colors.blue.shade100, child: Icon(Icons.chat_bubble_outline, color: Colors.blue));
      default:
        return CircleAvatar(backgroundColor: Colors.blue.shade100, child: Icon(Icons.notifications, color: Colors.blue.shade800));
    }
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()}w';
    } else if (diff.inDays > 0) {
      return '${diff.inDays}d';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h';
    } else {
      return '${diff.inMinutes}m';
    }
  }
}
