// import 'package:flutter/material.dart';

// class TaskCard extends StatelessWidget {
//   final String title;
//   final String time;
//   final String icon;

//   const TaskCard({
//     super.key,
//     required this.title,
//     required this.time,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: ListTile(
//         leading: Image.asset(icon, width: 40, height: 40),
//         title: Text(title),
//         subtitle: Text(time),
//       ),
//     );
//   }
// }