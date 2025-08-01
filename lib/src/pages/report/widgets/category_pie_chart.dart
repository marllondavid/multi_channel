import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/widgets/legend_item.dart';

class CategoryPieChart extends StatefulWidget {
  final String? title;
  const CategoryPieChart({
    super.key,
    this.title,
  });

  @override
  State<CategoryPieChart> createState() => _CategoryPieChartState();
}

class _CategoryPieChartState extends State<CategoryPieChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              widget.title != null ? widget.title! : '',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 4,
                  centerSpaceRadius: 40,
                  pieTouchData: PieTouchData(
                    touchCallback: (event, response) {
                      setState(() {
                        touchedIndex =
                            response?.touchedSection?.touchedSectionIndex ?? -1;
                      });
                    },
                  ),
                  sections: showingSections(),
                ),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: const [
                LegendItem(color: Colors.blue, text: 'Loja'),
                LegendItem(color: Colors.green, text: 'Mercado Livre'),
                LegendItem(color: Colors.orange, text: 'Shoppe'),
                LegendItem(color: Colors.purple, text: 'Hotmart'),
                LegendItem(color: Colors.teal, text: 'Amazon'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    const radius = 60.0;
    const selectedRadius = 70.0;

    return [
      PieChartSectionData(
        color: Colors.blue,
        value: 25,
        title: '25%',
        radius: touchedIndex == 0 ? selectedRadius : radius,
        titleStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 20,
        title: '20%',
        radius: touchedIndex == 1 ? selectedRadius : radius,
        titleStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 15,
        title: '15%',
        radius: touchedIndex == 2 ? selectedRadius : radius,
        titleStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 10,
        title: '10%',
        radius: touchedIndex == 3 ? selectedRadius : radius,
        titleStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      PieChartSectionData(
        color: Colors.teal,
        value: 30,
        title: '30%',
        radius: touchedIndex == 4 ? selectedRadius : radius,
        titleStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ];
  }
}
