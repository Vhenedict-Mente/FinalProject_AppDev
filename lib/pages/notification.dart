// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample notifications data for feeder
    final List<Map<String, String>> notifications = [
      {
        'title': 'Low Feed Level',
        'description': 'The feed level is low. Please refill the feeder soon.'
      },
      {
        'title': 'Feeder Refill Reminder',
        'description': 'It’s time to refill the feeder for optimal operation.'
      },
      {
        'title': 'Feed Distributed',
        'description': 'Feed has been distributed to the chickens successfully.'
      },
      {
        'title': 'Feeder Maintenance Alert',
        'description': 'Feeder maintenance is due. Please check the equipment.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeder Notifications'),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Color.fromARGB(248, 252, 249, 111),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications_off, size: 100, color: Colors.black),
                    SizedBox(height: 20),
                    Text(
                      'No Notifications Yet!',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  color: Colors.yellow[100],
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.notification_important, color: Colors.black),
                    title: Text(
                      notification['title']!,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(notification['description']!),
                  ),
                );
              },
            ),
    );
  }
}
