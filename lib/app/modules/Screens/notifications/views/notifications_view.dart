import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vropay/Components /bottom_navbar.dart';
import 'package:vropay/Components /top_navbar.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends StatelessWidget {
  final NotificationController controller = Get.put(NotificationController());

  final tabs = ['All', 'Unread', 'Today'];
  final clearOptions = ['Clear All', 'Clear Read', 'Clear Today'];
  final sources = [
    'Source 1', 'Source 2', 'Source 3', 'Source 4', 'Source 5',
    'Source 6', 'Source 7', 'Source 8', 'Source 9', 'Source 10', 'Source 11'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Updated top nav bar
            Obx(() => NotifTopBar(
              selectedIndex: controller.navTabIndex.value,
              onItemTap: controller.onNavTap,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tab filters (All, Unread, Today)
                  Row(
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
                  const SizedBox(height: 8),
                  // Dropdowns
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => DropdownButton<String>(
                        value: controller.selectedSource.value == 'Source' ? null : controller.selectedSource.value,
                        hint: const Text('Source'),
                        items: sources.map((source) => DropdownMenuItem(
                          value: source,
                          child: Text(source),
                        )).toList(),
                        onChanged: (value) {
                          if (value != null) controller.changeSource(value);
                        },
                      )),
                      Obx(() => DropdownButton<String>(
                        value: controller.selectedClearOption.value == 'Clear' ? null : controller.selectedClearOption.value,
                        hint: const Text('Clear'),
                        items: clearOptions.map((opt) => DropdownMenuItem(
                          value: opt,
                          child: Text(opt),
                        )).toList(),
                        onChanged: (value) {
                          if (value != null) controller.changeClearOption(value);
                        },
                      )),
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
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 6,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(Icons.notifications, color: Colors.blue.shade800),
                    ),
                    title: Text('Notification Title $index'),
                    subtitle: Text('This is a sample notification body for item $index.'),
                    trailing: Text('${index + 1}h'),
                    onTap: () {
                      // Mark as read logic
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          // Navigation logic
        },
      ),
    );
  }
}
