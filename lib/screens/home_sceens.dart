   import 'package:flutter/material.dart';

import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyDay"),
        backgroundColor: const Color(0xFFE88C6B),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => const ProfileScreen(),
              //   ),
              // );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [

            Text(
              "Today's Schedule",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            TaskCard(
              title: "Math",
              time: "9:00 AM - Room 204",
            ),

            TaskCard(
              title: "History",
              time: "10:30 AM - Room 105",
            ),

            TaskCard(
              title: "English",
              time: "1:00 PM - Room 301",
            ),
          ],
        ),
      ),
    );
  }
}