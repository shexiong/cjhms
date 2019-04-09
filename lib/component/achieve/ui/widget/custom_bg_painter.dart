
import 'package:cjhms/resources/res_index.dart';
import 'package:flutter/material.dart';

///  战绩播报画头部底下两个三角形
class BgPainter extends CustomPainter {
  final Color color;

  BgPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paints = new Paint();
    paints..color = color;
    paints.style = PaintingStyle.fill;
    Path path = new Path();
    path.moveTo(0, size.height - Dimens.ratio_width_4);
    path.lineTo(Dimens.ratio_width_4, size.height);
    path.lineTo(size.width - Dimens.ratio_width_4, size.height);
    path.lineTo(size.width, size.height - Dimens.ratio_width_4);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paints);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}