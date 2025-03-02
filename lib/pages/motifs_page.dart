import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/pages/add_motif.dart';

class MotifsPage extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();
  MotifsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motifs'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Get.to(() => AddMotif());
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder(
          init: dataController,
          builder: (_) {
            return ListView.builder(
              itemCount: dataController.actions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dataController.actions[index].name),
                );
              },
            );
          }),
    );
  }
}
