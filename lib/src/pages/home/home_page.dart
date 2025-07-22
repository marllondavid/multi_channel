import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:multi_channel/src/providers/theme_provider.dart';
import 'package:multi_channel/src/core/ui/widgets/home_drawer.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_scaffold.dart';
import 'package:multi_channel/src/core/ui/widgets/category_pie_chart.dart';
import 'package:multi_channel/src/core/ui/widgets/product_sales_chart.dart';
import 'package:multi_channel/src/core/ui/widgets/sumary_cards_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SharedScaffold(
      title: 'MultiCanal Dashboard',
      drawer: HomeDrawer(
        isDarkMode: themeProvider.isDarkMode,
        onThemeChanged: themeProvider.toggleTheme,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SummaryCardsSection(fadeAnimation: _fadeAnimation),
            const SizedBox(height: 16),
            const ProductSalesChart(),
            const SizedBox(height: 16),
            const CategoryPieChart(),
          ],
        ),
      ),
    );
  }
}
