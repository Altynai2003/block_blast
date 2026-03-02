// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         backgroundColor: const Color(0xFFE88C6B),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "John Doe",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "Student",
//               style: TextStyle(fontSize: 16, color: Colors.black54),
//             ),
//             const SizedBox(height: 24),
//             ListTile(
//               leading: const Icon(Icons.calendar_today),
//               title: const Text("Daily Schedule"),
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text("Settings"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }