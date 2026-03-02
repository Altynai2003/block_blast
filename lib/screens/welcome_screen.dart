// import 'package:flutter/material.dart';
// import 'daily_schedule_screen.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EFE6),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const Text(
//                 "Welcome!",
//                 style: TextStyle(fontSize: 20, color: Colors.black54),
//               ),
//               RichText(
//                 text: const TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "My",
//                       style: TextStyle(
//                         fontSize: 36,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Day",
//                       style: TextStyle(
//                         fontSize: 36,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFFE88C6B),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Text(
//                 "Plan your day effectively",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, color: Colors.black54),
//               ),
//               Expanded(
//                 child: Image.asset(
//                   'assets/images/student.png',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => const DailyScheduleScreen(),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFE88C6B),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                   ),
//                   child: const Text(
//                     "Get Started",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }