import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';

class SalesBarChart extends StatefulWidget {
  const SalesBarChart({super.key});

  @override
  State<SalesBarChart> createState() => _SalesBarChartState();
}

class _SalesBarChartState extends State<SalesBarChart> {
  final List<String> channels = [
    'Shopee',
    'Mercado Livre',
    'Amazon',
    'Loja Física'
  ];

  final List<double> values = [1243, 3508, 1350, 2598];

  final List<Color> barColors = [
    Colors.deepOrange,
    ColorsConstants.mercadoLivre,
    Colors.blueAccent,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          barGroups: List.generate(
            channels.length,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: values[index],
                  color: barColors[index],
                  width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  int index = value.toInt();
                  if (index < channels.length) {
                    return Text(channels[index],
                        style: TextStyle(fontSize: 12));
                  } else {
                    return Text('');
                  }
                },
                interval: 1,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                interval: 500,
                getTitlesWidget: (value, meta) {
                  if (value % 500 == 0 && value >= 1000 && value <= 10000) {
                    return Text(
                      'R\$ ${value.toInt()}',
                      style: const TextStyle(fontSize: 12),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }
}
