import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/widgets/background_painter.dart';

class SharedBackground extends StatelessWidget {
  final Widget child;

  const SharedBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          child, // O conteúdo da página, como LoginPage ou ResetPasswordPage
        ],
      ),
    );
  }
}
