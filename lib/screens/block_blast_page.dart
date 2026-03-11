import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logic/game_logic.dart';
import '../widgets/grid_cell.dart';
import '../widgets/draggable_block.dart';

class BlockBlastPage extends StatefulWidget {
  const BlockBlastPage({super.key});

  @override
  State<BlockBlastPage> createState() => _BlockBlastPageState();
}

class _BlockBlastPageState extends State<BlockBlastPage> {
  final GameLogic _game = GameLogic();
  List<BlockShape> _availableBlocks = [];
  int _highScore = 0;

  @override
  void initState() {
    super.initState();
    _loadHighScore();
    _refreshBlocks();
  }

  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _highScore = prefs.getInt('highScore') ?? 0;
    });
  }

  Future<void> _saveHighScore() async {
    if (_game.score <= _highScore) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('highScore', _game.score);
    setState(() {
      _highScore = _game.score;
    });
  }

  void _refreshBlocks() {
    setState(() {
      _availableBlocks = List.generate(3, (_) => BlockShape.random());
    });
  }

  void _onBlockPlaced(BlockShape shape, int r, int c) {
    setState(() {
      _game.placeBlock(shape, r, c);
      _availableBlocks.remove(shape);
      if (_game.score > _highScore) {
        _highScore = _game.score;
      }
      if (_availableBlocks.isEmpty) {
        _refreshBlocks();
      }
      if (_game.isGameOver(_availableBlocks)) {
        _showGameOver();
      }
    });
  }

  void _showGameOver() {
    // make sure persisted score is updated before showing dialog so the
    // home page can rely on whatever is saved.
    _saveHighScore();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('Оюн бүттү!', style: TextStyle(color: Colors.white)),
        content: Text(
          'Сиздин упайыңыз: ${_game.score}',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _game.grid = List.generate(
                  8,
                  (_) => List.generate(8, (_) => null),
                );
                _game.score = 0;
                _game.combo = 0;
                _refreshBlocks();
              });
            },
            child: const Text('Кайра баштоо'),
          ),
          TextButton(
            onPressed: () {
              // return to menu -- value not used but could be extended
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Меню'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Упай',
                        style: TextStyle(color: Colors.white60, fontSize: 16),
                      ),
                      Text(
                        '${_game.score}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Рекорд',
                        style: TextStyle(color: Colors.white60, fontSize: 14),
                      ),
                      Text(
                        '$_highScore',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[950],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white10),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Stack(
                        children: [
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 8,
                                ),
                            itemCount: 64,
                            itemBuilder: (context, index) {
                              int r = index ~/ 8;
                              int c = index % 8;
                              return DragTarget<BlockShape>(
                                onWillAcceptWithDetails: (details) =>
                                    _game.canPlaceBlock(details.data, r, c),
                                onAcceptWithDetails: (details) =>
                                    _onBlockPlaced(details.data, r, c),
                                builder:
                                    (context, candidateData, rejectedData) {
                                      bool isHovered = candidateData.isNotEmpty;
                                      return GridCell(
                                        color: isHovered
                                            ? candidateData.first!.color
                                                  .withAlpha(150)
                                            : _game.grid[r][c],
                                        isGhost: isHovered,
                                      );
                                    },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Available Blocks
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                height: 120,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _availableBlocks.map((shape) {
                    return DraggableBlock(
                      shape: shape,
                      onPlaced: (s) {
                        // handled by DragTarget
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
