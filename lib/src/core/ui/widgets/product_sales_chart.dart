import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProductSalesChart extends StatelessWidget {
  const ProductSalesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Vendas por Dia',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                // Ou BarChart
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 15),
                        FlSpot(1, 25),
                        FlSpot(2, 20),
                        FlSpot(3, 40),
                        FlSpot(4, 35),
                        FlSpot(5, 50),
                        FlSpot(6, 45),
                      ],
                      isCurved: true,
                      color: Colors.deepPurple,
                      barWidth: 4,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.deepPurple.withValues(alpha: 0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
