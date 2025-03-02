import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/components/drawer.dart';
import 'package:register_info/components/taches_table.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/controllers/tabs_controller.dart';

class HomePage extends StatelessWidget {
  
  final TabsController tabsController = Get.find<TabsController>();
 
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
        title: const Text('Register Info'),
        elevation: 0,
      ),
      body: GetBuilder(
        init: tabsController,
        builder: (_) {
          return Row(
            children: [
              Expanded(flex: 1, child: AppDrawer()),
              Expanded(
                flex: 3,
                child: tabsController.selectedTab,
              ),
            ],
          );
        }
      ),
    );
  }
}
