import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/pages/report/widgets/category_pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:multi_channel/src/providers/theme_provider.dart';
import 'package:multi_channel/src/core/ui/widgets/home_drawer.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_scaffold.dart';
import 'package:multi_channel/src/pages/report/widgets/report_card.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_data_table.dart';
import 'package:multi_channel/src/pages/report/widgets/product_sales_chart.dart';
import 'package:multi_channel/src/pages/report/widgets/channel_dropdown.dart';
import 'package:multi_channel/src/pages/report/widgets/date_picker_form_field.dart';

class ReportPages extends StatefulWidget {
  const ReportPages({super.key});

  @override
  State<ReportPages> createState() => _ReportPagesState();
}

class _ReportPagesState extends State<ReportPages>
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
      title: 'Relatórios',
      drawer: HomeDrawer(
        isDarkMode: themeProvider.isDarkMode,
        onThemeChanged: themeProvider.toggleTheme,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: DatePickerFormField(label: 'Data Início')),
                  const SizedBox(width: 12),
                  Expanded(child: DatePickerFormField(label: 'Data Fim')),
                  const SizedBox(width: 12),
                  Expanded(child: ChannelDropdown()),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstants.primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Aplicar Filtros',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ReportCard(title: 'Receita Bruta', value: 'R\$ 3.465,00'),
                  ReportCard(title: 'Total de Vendas', value: '1.136'),
                  ReportCard(title: 'Pedidos Cancelados', value: '1789'),
                  ReportCard(title: 'Ticket Médio', value: 'R\$ 700'),
                ],
              ),
              const SizedBox(height: 30),
              Text('Vendas por Dia',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              const ProductSalesChart(),
              const SizedBox(height: 30),
              Text('Participação por Canal',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              CategoryPieChart(),
              const SizedBox(height: 30),
              Text('Detalhamento de Vendas',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              SharedDataTable(
                columns: const [
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Pedido')),
                  DataColumn(label: Text('Cliente')),
                  DataColumn(label: Text('Canal')),
                  DataColumn(label: Text('Valor')),
                  DataColumn(label: Text('Status')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('30/07/2025')),
                    DataCell(Text('#123456')),
                    DataCell(Text('João Silva')),
                    DataCell(Text('Loja Física')),
                    DataCell(Text('R\$ 250,00')),
                    DataCell(Text('Concluído')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('30/07/2025')),
                    DataCell(Text('#123457')),
                    DataCell(Text('Maria Oliveira')),
                    DataCell(Text('Mercado Livre')),
                    DataCell(Text('R\$ 320,00')),
                    DataCell(Text('Cancelado')),
                  ]),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstants.primaryColor,
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Exportar PDF',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsConstants.primaryColor,
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.table_view,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Exportar Excel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
