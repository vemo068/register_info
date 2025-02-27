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
        title: const Text('Select Motif'),
        elevation: 0,
      ),
      body:GetBuilder(
        init: dataController,
        builder: (_) {
          return ListView.builder(
            itemCount: dataController.actions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dataController.actions[index].name),
                onTap: () {
                  dataController.selectedAction = dataController.actions[index];
                  Get.back();
                },
              );
            },
          );
        }
      ) ,
    );
  }
}