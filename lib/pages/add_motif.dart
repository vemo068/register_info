import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/components/txt_field_pc.dart';
import 'package:register_info/controllers/data_controller.dart';

class AddMotif extends StatelessWidget {
  DataController dataController = Get.find<DataController>();
  AddMotif({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Motif'),
        elevation: 0,
      ),
      body: Center(
        child: GetBuilder(
          init: dataController,
          builder: (_) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Add Motif',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                TxtFldPC(
                  autofocus: true,
                  hint: "Motif name",
                  controller: dataController.motifNameController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    dataController.insertAction();
                    Get.back();
                  },
                  child: Text('Add Motif'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
