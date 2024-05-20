import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Chart extends CustomPainter {
  Chart(List<double> value) {
    painter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..color = HexColor('#6750A4');

    data = value;
  }
  late List<double> data;
  late Paint painter;

  double mappoint(
    double value,
    double min,
    double max, {
    double newmin = 30,
    double newmax = 170,
  }) {
    return ((value - min) / (max - min)) * (newmax - newmin) + newmin;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    final paneWidth = size.width / 7.0;

    for (int i = 0; i < (data.length); i++) {
      bool isLast = i == data.length - 1;
      bool isFirst = i == 0;

      if (isFirst) {
        const initialX = 0.0;
        final initialY = mappoint((data[i] / 5) * size.height, 0, size.height);

        path.moveTo(initialX, initialY);
        path.lineTo(initialX + 0.5 * paneWidth, initialY);

        final fromX = 0.5 * paneWidth;
        final fromY = mappoint((data[i] / 5) * size.height, 0, size.height);

        final toX = fromX + paneWidth;
        final toY = mappoint((data[i + 1] / 5) * size.height, 0, size.height);

        path.moveTo(fromX, fromY);
        path.lineTo(toX, toY);
      } else if (!isLast) {
        final fromX = paneWidth * (i + 0.5);
        final fromY = mappoint((data[i] / 5) * size.height, 0, size.height);

        final toX = fromX + paneWidth;
        final toY = mappoint((data[i + 1] / 5) * size.height, 0, size.height);

        path.moveTo(fromX, fromY);
        path.lineTo(toX, toY);
      }
    }

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
