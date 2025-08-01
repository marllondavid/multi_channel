import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_background.dart';

class SharedScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? drawer;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const SharedScaffold({
    required this.body,
    required this.title,
    this.drawer,
    this.actions,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen = constraints.maxWidth >= 900;

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            elevation: 5,
            shadowColor: ColorsConstants.primaryColor,
            actions: actions ?? [],
          ),
          drawer: isLargeScreen ? null : drawer,
          floatingActionButton: floatingActionButton,
          body: Row(
            children: [
              if (isLargeScreen && drawer != null)
                SizedBox(
                  width: 250,
                  child: drawer,
                ),
              Expanded(
                child: SharedBackground(
                  child: body,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
