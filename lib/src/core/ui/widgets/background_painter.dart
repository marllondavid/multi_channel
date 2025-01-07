import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Fundo principal com degradê
    paint.shader = LinearGradient(
      colors: [
        Color(0x66A29BFE),
        Color(0x6683EAF1),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Camada 1 - Forma orgânica
    paint.color = Color(0x66A29BFE); // Púrpura translúcido
    canvas.drawPath(_getFirstLayerPath(size), paint);

    // Camada 2 - Forma orgânica
    paint.color = ColorsConstants.primaryColor; // Cor primária
    canvas.drawPath(_getSecondLayerPath(size), paint);

    // Camada 3 - Forma orgânica
    paint.color = Color(0x6683EAF1); // Azul esverdeado translúcido
    canvas.drawPath(_getThirdLayerPath(size), paint);
  }

  Path _getFirstLayerPath(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.8, 0);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.2,
        size.width * 0.9, size.height * 0.4);
    path.quadraticBezierTo(
        size.width, size.height * 0.6, size.width * 0.6, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.8, size.width * 0.2, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  Path _getSecondLayerPath(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.2,
        size.width * 0.4, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.6,
        size.width * 0.3, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.9, 0, size.height);
    path.lineTo(0, size.height * 0.5);
    path.close();
    return path;
  }

  Path _getThirdLayerPath(Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.5,
        size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.7,
        size.width * 0.4, size.height * 0.9);
    path.quadraticBezierTo(
        size.width * 0.6, size.height, size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
