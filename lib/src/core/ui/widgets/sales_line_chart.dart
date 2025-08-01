import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';

class SalesLineChart extends StatefulWidget {
  const SalesLineChart({super.key});

  @override
  State<SalesLineChart> createState() => _SalesLineChartState();
}

class _SalesLineChartState extends State<SalesLineChart> {
  final List<String> months = ['Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  int index = value.toInt();
                  return Text(
                    months[index],
                    style: TextStyle(fontSize: 12),
                  );
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
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1500),
                FlSpot(1, 980),
                FlSpot(2, 2568),
                FlSpot(3, 1870),
                FlSpot(4, 4253),
                FlSpot(5, 3650),
              ],
              isCurved: true,
              color: ColorsConstants.primaryColor,
              dotData: FlDotData(show: false),
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 587),
                FlSpot(1, 596),
                FlSpot(2, 1235),
                FlSpot(3, 1478),
                FlSpot(4, 3200),
                FlSpot(5, 3500),
              ],
              isCurved: true,
              color: Colors.white,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
