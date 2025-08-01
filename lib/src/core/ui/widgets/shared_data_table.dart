import 'package:flutter/material.dart';

class SharedDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;

  const SharedDataTable({
    super.key,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16),
      child: DataTable(columns: columns, rows: rows),
    );
  }
}
