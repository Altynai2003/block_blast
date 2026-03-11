import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'block_blast_page.dart';

/// The landing page for the Block Blast game. Shows the title, the stored
/// high score and a button to start a new game.  The high score is read from
/// and written to `SharedPreferences` so it survives app restarts.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _highScore = 0;

  @override
  void initState() {
    super.initState();
    _loadHighScore();
  }

  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _highScore = prefs.getInt('highScore') ?? 0;
    });
  }

  Future<void> _navigateToGame() async {
    // push the game page and then refresh the high score when the player
    // returns.  We intentionally don't rely on a return value; the game page
    // will save the score itself.
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const BlockBlastPage()),
    );

    // reload the saved high score in case it changed while the user was
    // playing.
    _loadHighScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3B3B98), Color(0xFF6A89CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Block Blast',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'High Score',
                    style: TextStyle(fontSize: 24, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_highScore',
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: _navigateToGame,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
