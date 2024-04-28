import 'package:flutter/material.dart';

export 'custom_table.dart';

class CustomTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  CustomTable({required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (data.isEmpty) {
      return Center(
        child: Text('Nenhum dado para exibir'),
      );
    }

    List<String> columns = data.first.keys.toList();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: theme.colorScheme.primary)
      ),
      child:
        DataTable(
          columns: columns.map((String column) {
            return DataColumn(
              label:
                Text(
                  column,
                  style:
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    )
                )
            );
          }).toList(),
          rows: data.map((Map<String, dynamic> row) {
            return DataRow(
              cells: columns.map((String column) {
                return DataCell(
                  Center(child: 
                    Text(
                      row[column].toString(),
                    ),
                  )
                );
              }).toList(),
            );
          }).toList(),
        )
    ,);
  }
}