import 'package:flight_tracker/widgets/painters/progress_line_painter.dart';
import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  final double progress;
  final double lineHeight;
  final Color lineColor;
  final Color dottedColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final int quarterTurns;

  const ProgressLine({
    super.key,
    required this.progress,
    this.lineHeight = 2.0,
    this.lineColor = Colors.blue,
    this.dottedColor = Colors.grey,
    this.icon = Icons.circle,
    this.iconColor = Colors.blue,
    this.iconSize = 20.0,
    this.quarterTurns = 0,
  }) : assert(progress >= 0.0 && progress <= 1.0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final iconPosition = totalWidth * progress;

        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              child: Container(
                width: iconPosition,
                height: lineHeight,
                color: lineColor,
              ),
            ),

            Positioned(
              left: iconPosition,
              child: SizedBox(
                width: totalWidth - iconPosition,
                child: CustomPaint(
                  size: Size(totalWidth - iconPosition, lineHeight),
                  painter: DottedLinePainter(
                    color: dottedColor,
                    dashWidth: 5.0,
                    dashSpace: 3.0,
                    strokeWidth: lineHeight,
                  ),
                ),
              ),
            ),

            // Icon at the progress position
            if (progress != 0)
              Positioned(
                left: iconPosition - (iconSize / 2),
                child: RotatedBox(
                  quarterTurns: quarterTurns,
                  child: Icon(icon, color: iconColor, size: iconSize),
                ),
              ),
          ],
        );
      },
    );
  }
}
