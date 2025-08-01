import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/data/models/pedido_model.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_data_table.dart';
import 'package:multi_channel/src/data/repository/pedidos_repository.dart';
import 'package:multi_channel/src/core/ui/widgets/reusable_page_layout.dart';

class ListPedidosPage extends StatelessWidget {
  const ListPedidosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pedidoRepository = PedidosRepository();
    final List<PedidoModel> pedidos = pedidoRepository.getPedidos();

    final currencyFormatter =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    final dateFormatter = DateFormat('dd/MM/yyyy');

    final rows = pedidos.map((pedido) {
      return DataRow(
        cells: [
          DataCell(Text(
            pedido.id,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
          DataCell(Text(pedido.cliente.nome)),
          DataCell(Text(pedido.canal)),
          DataCell(Text(dateFormatter.format(pedido.data))),
          DataCell(Text(pedido.status)),
          DataCell(Text(currencyFormatter.format(pedido.valorTotal))),
        ],
      );
    }).toList();

    return ReusablePageLayout(
      title: 'Pedidos',
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/criar-pedido'),
        elevation: 5,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        backgroundColor: ColorsConstants.primaryColor,
        child: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedDataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Cliente')),
              DataColumn(label: Text('Canal')),
              DataColumn(label: Text('Data')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Valor Total')),
            ],
            rows: rows,
          ),
        ],
      ),
    );
  }
}
