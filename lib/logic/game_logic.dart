import 'dart:math';
import 'package:flutter/material.dart';

class BlockShape {
  final List<Offset> points;
  final Color color;

  BlockShape({required this.points, required this.color});

  static List<BlockShape> get allShapes => [
    // 1x1
    BlockShape(points: [const Offset(0, 0)], color: Colors.blue),
    // 1x2
    BlockShape(
      points: [const Offset(0, 0), const Offset(1, 0)],
      color: Colors.red,
    ),
    BlockShape(
      points: [const Offset(0, 0), const Offset(0, 1)],
      color: Colors.red,
    ),
    // 1x3
    BlockShape(
      points: [const Offset(0, 0), const Offset(1, 0), const Offset(2, 0)],
      color: Colors.green,
    ),
    BlockShape(
      points: [const Offset(0, 0), const Offset(0, 1), const Offset(0, 2)],
      color: Colors.green,
    ),
    // 1x4
    BlockShape(
      points: [
        const Offset(0, 0),
        const Offset(1, 0),
        const Offset(2, 0),
        const Offset(3, 0),
      ],
      color: Colors.orange,
    ),
    BlockShape(
      points: [
        const Offset(0, 0),
        const Offset(0, 1),
        const Offset(0, 2),
        const Offset(0, 3),
      ],
      color: Colors.orange,
    ),
    // 2x2
    BlockShape(
      points: [
        const Offset(0, 0),
        const Offset(1, 0),
        const Offset(0, 1),
        const Offset(1, 1),
      ],
      color: Colors.purple,
    ),
    // L-shape
    BlockShape(
      points: [const Offset(0, 0), const Offset(0, 1), const Offset(1, 1)],
      color: Colors.yellow,
    ),
    BlockShape(
      points: [const Offset(0, 0), const Offset(1, 0), const Offset(1, 1)],
      color: Colors.yellow,
    ),
    // T-shape
    BlockShape(
      points: [
        const Offset(0, 0),
        const Offset(1, 0),
        const Offset(2, 0),
        const Offset(1, 1),
      ],
      color: Colors.cyan,
    ),
  ];

  static BlockShape random() {
    return allShapes[Random().nextInt(allShapes.length)];
  }
}

class GameLogic {
  static const int gridSize = 8;
  List<List<Color?>> grid = List.generate(
    gridSize,
    (_) => List.generate(gridSize, (_) => null),
  );
  int score = 0;
  int combo = 0;

  bool canPlaceBlock(BlockShape shape, int row, int col) {
    for (var point in shape.points) {
      int r = row + point.dy.toInt();
      int c = col + point.dx.toInt();
      if (r < 0 ||
          r >= gridSize ||
          c < 0 ||
          c >= gridSize ||
          grid[r][c] != null) {
        return false;
      }
    }
    return true;
  }

  void placeBlock(BlockShape shape, int row, int col) {
    for (var point in shape.points) {
      int r = row + point.dy.toInt();
      int c = col + point.dx.toInt();
      grid[r][c] = shape.color;
    }
    score += shape.points.length * 10;
    checkClears();
  }

  void checkClears() {
    List<int> rowsToClear = [];
    List<int> colsToClear = [];

    // Check rows
    for (int r = 0; r < gridSize; r++) {
      if (grid[r].every((cell) => cell != null)) {
        rowsToClear.add(r);
      }
    }

    // Check columns
    for (int c = 0; c < gridSize; c++) {
      bool full = true;
      for (int r = 0; r < gridSize; r++) {
        if (grid[r][c] == null) {
          full = false;
          break;
        }
      }
      if (full) {
        colsToClear.add(c);
      }
    }

    if (rowsToClear.isNotEmpty || colsToClear.isNotEmpty) {
      combo++;
      score += (rowsToClear.length + colsToClear.length) * 100 * combo;

      for (var r in rowsToClear) {
        for (int c = 0; c < gridSize; c++) {
          grid[r][c] = null;
        }
      }
      for (var c in colsToClear) {
        for (int r = 0; r < gridSize; r++) {
          grid[r][c] = null;
        }
      }
    } else {
      combo = 0;
    }
  }

  bool isGameOver(List<BlockShape> availableBlocks) {
    if (availableBlocks.isEmpty) return false;

    for (var shape in availableBlocks) {
      for (int r = 0; r < gridSize; r++) {
        for (int c = 0; c < gridSize; c++) {
          if (canPlaceBlock(shape, r, c)) {
            return false;
          }
        }
      }
    }
    return true;
  }
}
