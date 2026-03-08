import 'package:flutter/material.dart';
import '../logic/game_logic.dart';
import 'grid_cell.dart';

class DraggableBlock extends StatelessWidget {
  final BlockShape shape;
  final Function(BlockShape) onPlaced;
  final bool isEnabled;

  const DraggableBlock({
    super.key,
    required this.shape,
    required this.onPlaced,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) {
      return const SizedBox(width: 80, height: 80);
    }

    // Calculate bounding box of the shape
    int minX = 0, minY = 0, maxX = 0, maxY = 0;
    for (var p in shape.points) {
      if (p.dx < minX) minX = p.dx.toInt();
      if (p.dy < minY) minY = p.dy.toInt();
      if (p.dx > maxX) maxX = p.dx.toInt();
      if (p.dy > maxY) maxY = p.dy.toInt();
    }
    int width = maxX - minX + 1;
    int height = maxY - minY + 1;

    Widget blockWidget(double cellSize) {
      return SizedBox(
        width: width * cellSize,
        height: height * cellSize,
        child: Stack(
          children: shape.points.map((p) {
            return Positioned(
              left: (p.dx - minX) * cellSize,
              top: (p.dy - minY) * cellSize,
              width: cellSize,
              height: cellSize,
              child: GridCell(color: shape.color),
            );
          }).toList(),
        ),
      );
    }

    return Draggable<BlockShape>(
      data: shape,
      feedback: Transform.scale(
        scale: 1.2,
        child: Opacity(
          opacity: 0.8,
          child: Material(color: Colors.transparent, child: blockWidget(40)),
        ),
      ),
      childWhenDragging: Opacity(opacity: 0.3, child: blockWidget(30)),
      onDragCompleted: () {
        onPlaced(shape);
      },
      child: Center(child: blockWidget(30)),
    );
  }
}
