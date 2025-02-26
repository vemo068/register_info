import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/components/taches_table.dart';
import 'package:register_info/controllers/data_controller.dart';

class HomePage extends StatelessWidget {
  final DataController dataController = Get.put(DataController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Info'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // add three responsive buttons
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/actions');
              },
              child: const Text('Actions'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/agents');
              },
              child: const Text('Agents'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/taches');
              },
              child: const Text('Taches'),
            ),
             TacheTable(),
          ],
        ),
      ),
    );
  }
}
