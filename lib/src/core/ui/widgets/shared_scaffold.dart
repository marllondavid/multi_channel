import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_background.dart';

class SharedScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? drawer; // Drawer opcional

  const SharedScaffold({
    required this.body,
    required this.title,
    this.drawer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(title: Text(title)),
      body: SharedBackground(
        child: body,
      ),
    );
  }
}
