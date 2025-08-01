import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/reusable_page_layout.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_data_table.dart';
import 'package:multi_channel/src/data/models/client_model.dart';
import 'package:multi_channel/src/data/repository/client_repository.dart';

class ListClientPage extends StatelessWidget {
  const ListClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final clientRepository = ClientRepository();
    final List<ClienteModel> clientes = clientRepository.getClientes();

    final rows = clientes.map((cliente) {
      return DataRow(
        cells: [
          DataCell(Text(cliente.nome)),
          DataCell(Text(cliente.cpfCnpj)),
          DataCell(Text(cliente.telefone)),
          DataCell(Text('${cliente.rua}, ${cliente.numero}')),
          DataCell(Text(cliente.origem)),
          DataCell(
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Editar',
              onPressed: () {
                context.go('/cadastro-cliente', extra: cliente);
              },
            ),
          ),
        ],
      );
    }).toList();

    return ReusablePageLayout(
      title: 'Clientes Cadastrados',
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/cadastro-cliente'),
        elevation: 5,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        backgroundColor: ColorsConstants.primaryColor,
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedDataTable(
            columns: const [
              DataColumn(label: Text('Nome')),
              DataColumn(label: Text('CPF/CNPJ')),
              DataColumn(label: Text('Telefone')),
              DataColumn(label: Text('Endereço')),
              DataColumn(label: Text('Onde Comprou')),
              DataColumn(label: Text('Ações')),
            ],
            rows: rows,
          ),
        ],
      ),
    );
  }
}
