import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/components/taches_table.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/pages/add_tache.dart';

class TachesPage extends StatelessWidget {
  final DataController dataController = Get.find<DataController>();
  TachesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taches'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => AddTachePage());
        },
        label: Text('Add Tadche'),
        icon: Icon(Icons.padding_rounded),
      ),
      body: Center(
        child: Column(
          children: [
            TacheTable(),
          ],
        ),
      ),
    );
  }
}
