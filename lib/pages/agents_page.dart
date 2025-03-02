import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/pages/add_agent.dart';

class AgentsPage extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();
  AgentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agents'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => AddAgent());
        },
        label:Text('Add Agent'),
        icon: Icon(Icons.add),
      ),
      body: GetBuilder(
          init: dataController,
          builder: (_) {
            return ListView.builder(
              itemCount: dataController.agents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataController.agents[index].name),
                );
              },
            );
          }),
    );
  }
}
