import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/models/tache.dart';

class TacheTable extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();
  TacheTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: dataController,
        builder: (_) {
          return DataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Action ID')),
              DataColumn(label: Text('Agent ID')),
              DataColumn(label: Text('Date')),
            ],
            rows: dataController.taches
                .map(
                  (tache) => DataRow(cells: [
                    DataCell(Text(tache.id.toString())),
                    DataCell(Text(
                        dataController.getActionNameByID(tache.action_id))),
                    DataCell(
                        Text(dataController.getAgentNameByID(tache.agent_id))),
                    DataCell(Text(tache.date.toString())),
                  ]),
                )
                .toList(),
          );
        });
  }
}
