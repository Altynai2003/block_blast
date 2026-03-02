import 'package:flutter/material.dart';

void main() {
  runApp(const MyDayApp());
}

// Башкы App классы
class MyDayApp extends StatelessWidget {
  const MyDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // DEBUG баннерди өчүрөт
      title: 'MyDay',
      theme: ThemeData(
        fontFamily: 'Arial',
        primaryColor: const Color(0xFFE88C6B), // негизги түс
      ),
      home: const WelcomeScreen(),
    );
  }
}

// =============================
// Welcome Screen (Баштоо Экран)
// =============================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFE6), // жумшак крем түс
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const SizedBox(height: 20),

              // Кош келиниз тексти
              const Text(
                "Кош келиңиз!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),

              // App аталышы: MyDay
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "My",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "Day",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE88C6B), // пастель кызгылт
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Кыскача түшүндүрүү
              const Text(
                "Күнүңүздү натыйжалуу пландаңыз",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 20),

              // Иллюстрация
              Expanded(
                child: Image.asset(
                  'assets/images/student.png', // assets/images/student.png сүрөт керек
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              // Баштоо кнопкасы
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    //  кийинки экранга өтүү
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => NextScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE88C6B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Баштоо",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}