import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/widgets/sumary_report_card.dart';

class SummaryCardsSection extends StatelessWidget {
  final Animation<double> fadeAnimation;

  const SummaryCardsSection({required this.fadeAnimation, super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return GridView.count(
      crossAxisCount: isMobile ? 1 : 4,
      shrinkWrap: true,
      childAspectRatio: 1.8,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SummaryReportCard(
          fadeAnimation: fadeAnimation,
          title: 'Total Clientes',
          value: '567.899',
          icon: Icons.people_outline,
          percentChange: 2.5,
        ),
        SummaryReportCard(
          fadeAnimation: fadeAnimation,
          title: 'Receita Total',
          value: '\$3,465M',
          icon: Icons.attach_money,
          percentChange: 0.5,
        ),
        SummaryReportCard(
          fadeAnimation: fadeAnimation,
          title: 'Pedidos',
          value: '1.136M',
          icon: Icons.shopping_cart_outlined,
          percentChange: -0.2,
        ),
        SummaryReportCard(
          fadeAnimation: fadeAnimation,
          title: 'Devoluções',
          value: '1.789',
          icon: Icons.store,
          percentChange: 0.12,
        ),
      ],
    );
  }
}
