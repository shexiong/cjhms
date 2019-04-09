
import 'dart:math';

import 'package:cjhms/resources/res_index.dart';
import 'package:flutter/material.dart';

num degToRad(num deg) => deg * (pi / 180.0);
num radToDeg(num rad) => rad * (180.0 / pi);

///  战绩播报pk
class PkPainter extends CustomPainter {
  final int type;

  PkPainter({this.type});

  @override
  void paint(Canvas canvas, Size size) {
    double drawRadius = Dimens.ratio_width_8;
    double strokeWidth = Dimens.space_width_15;
    double offset = asin(0.72);
    // 左
    Paint leftPaints = new Paint();
    leftPaints..color = type == 1 ? Color(0xff08c299) : type == 2 ?
    Color(0xffffc14d) : Color(0xffff8480);
    leftPaints.style = PaintingStyle.stroke;
    leftPaints.strokeWidth = strokeWidth;
    canvas.drawArc(Rect.fromCircle(center:Offset(size.width/2,size.height/2),
        radius: drawRadius ), offset, degToRad(270), false, leftPaints);
    // 右
    offset = -asin(0.72);
    Paint rightPaints = new Paint();
    rightPaints..color = type == 1 ? Color(0xffff8480) : type == 2 ?
    Color(0xffffc14d) : Color(0xff08c299);
    rightPaints.style = PaintingStyle.stroke;
    rightPaints.strokeWidth = strokeWidth;
    canvas.drawArc(Rect.fromCircle(center:Offset(size.width/2,size.height/2),
        radius: drawRadius ), offset, degToRad(93), false, rightPaints);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}