import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/controllers/data_controller.dart';

class SelectActionPage extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();
  SelectActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Agent'),
        elevation: 0,
      ),
      body: GetBuilder(
          init: dataController,
          builder: (_) {
            return ListView.builder(
              itemCount: dataController.agents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataController.agents[index].name),
                  onTap: () {
                    dataController.selectedAgent = dataController.agents[index];
                    Get.back();
                  },
                );
              },
            );
          }),
    );
  }
}
