import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This is Notifs View',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
