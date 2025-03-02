import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/components/txt_field_pc.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/models/agent.dart';

class AddAgent extends StatelessWidget {
  DataController dataController = Get.find<DataController>();
   AddAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Agent'),
        elevation: 0,
      ),
      body:  Center(
        child: GetBuilder(
          init: dataController,
          builder: (_) {
            return Column(
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                  'Add Agent',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                TxtFldPC(
                  autofocus: true,
                  hint: "Agent name",
                  controller: dataController.agentNameController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                  dataController.insertAgent();
                  Get.back();
                  },
                  child: Text('Add Agent'),
                  style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                ],
              
            );
          }
        ),
      ),
    );
  }
}