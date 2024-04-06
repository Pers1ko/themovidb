import 'dart:math';
import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: RadialPercentWidget(
          percent: 0.72,
          fillColor: AppColors.mainDarkBlue,
          lineColor: Color.fromARGB(255, 195, 255, 0),
          freeColor: const Color.fromARGB(150, 158, 158, 158),
          lineWidth: 5,
          child: Text(
            '72%',
            style: TextStyle(color: Colors.white),
          )
        ),
      ),);
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
          ),
        ),
        Center(
          child: child,
        ),
      ],
    );
  }
}


class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor, 
    required this.lineColor, 
    required this.freeColor, 
    required this.lineWidth, 
  });

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFillArc(canvas, arcRect);
  }

  void drawFillArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;

    canvas.drawArc(
      arcRect,
      -pi / 2,
      pi * 2 * percent,
      false,
      paint,
    );
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;

    canvas.drawArc(arcRect,
    pi * 2 * percent - (pi / 2),
    pi * 2 * (1.0 - percent),
    false,
    paint,);
  }
  

void drawBackground(Canvas canvas, Size size) {
  final paint = Paint();
  paint.color = fillColor;
  paint.style = PaintingStyle.fill;
  canvas.drawOval(Offset.zero & size, paint);
}

Rect calculateArcsRect(Size size) {
  final linesMargin = 3;
  final offset = lineWidth / 2 + linesMargin;
  final arcRect = Offset(offset, offset) &
  Size(size.width - offset * 2, size.height - offset * 2);
  return arcRect;
}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return true;
}
}