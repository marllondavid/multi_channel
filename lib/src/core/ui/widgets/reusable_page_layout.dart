import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/widgets/home_drawer.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_scaffold.dart';
import 'package:multi_channel/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ReusablePageLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  const ReusablePageLayout({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SharedScaffold(
      title: title,
      drawer: HomeDrawer(
        isDarkMode: themeProvider.isDarkMode,
        onThemeChanged: themeProvider.toggleTheme,
      ),
      floatingActionButton: floatingActionButton,
      body: body,
    );
  }
}
