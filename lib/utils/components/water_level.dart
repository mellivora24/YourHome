import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaterLevel extends StatefulWidget {
  final double waterLevel;

  const WaterLevel({
    super.key,
    required this.waterLevel,
  });

  @override
  _WaterLevelState createState() => _WaterLevelState();
}

class _WaterLevelState extends State<WaterLevel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(150, 60),
                    painter: SemiCircleProgressPainter(
                      percentage: widget.waterLevel,
                    ),
                  ),
                  Text(
                    '${widget.waterLevel.toString()}%',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              'Water tank level',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SemiCircleProgressPainter extends CustomPainter {
  final double percentage;

  SemiCircleProgressPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 25
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    Paint progressPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 25
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    Offset center = Offset(size.width / 2, size.height);
    double radius = size.width / 2;

    double startAngle = -math.pi;
    double sweepAngle = math.pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    double progressSweepAngle = (percentage / 100) * math.pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      progressSweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}