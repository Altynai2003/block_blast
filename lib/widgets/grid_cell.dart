import 'package:flutter/material.dart';

class GridCell extends StatelessWidget {
  final Color? color;
  final bool isGhost;

  const GridCell({super.key, this.color, this.isGhost = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[900],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color != null
              ? Colors.white.withAlpha(50)
              : Colors.white.withAlpha(10),
          width: 0.5,
        ),
        boxShadow: color != null
            ? [
                BoxShadow(
                  color: color!.withAlpha(100),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: isGhost
          ? Container(
              decoration: BoxDecoration(
                color: color?.withAlpha(50),
                borderRadius: BorderRadius.circular(4),
              ),
            )
          : null,
    );
  }
}
