import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/pages/select_action.dart';
import 'package:register_info/pages/select_agent.dart';

class AddTachePage extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();
  AddTachePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Tache'),
        elevation: 0,
      ),
      body: GetBuilder(
          init: dataController,
          builder: (_) {
            return Column(
              children: [
                // 2 buttons to select action and agent
                Text('Select Motif'),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => SelectActionPage());
                  },
                  child: Text(
                      dataController.selectedAction?.name ?? "Select Motif"),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Select Agent'),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => SelectAgentPage());
                  },
                  child: Text(
                      dataController.selectedAgent?.name ?? "Select Agent"),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      dataController.insertTache();
                      Get.back();
                    },
                    label: Text('Add Tache'),
                    icon: Icon(Icons.save)),
              ],
            );
          }),
    );
  }
}
