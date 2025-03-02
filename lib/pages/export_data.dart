import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/services/taches_pdf.dart';

class ExportDataPage extends StatelessWidget {
  DataController dataController = Get.find<DataController>();
  ExportDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Data'),
        elevation: 0,
      ),
      body: GetBuilder(
          init: dataController,
          builder: (_) {
            return Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        PdfInvoiceApi.generateTaches(dataController.taches);
                      },
                      child: Text('Export Data')),
                ],
              ),
            );
          }),
    );
  }
}
