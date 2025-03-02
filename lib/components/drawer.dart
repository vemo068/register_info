import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/controllers/tabs_controller.dart';
import 'package:register_info/pages/agents_page.dart';
import 'package:register_info/pages/export_data.dart';
import 'package:register_info/pages/home_page.dart';
import 'package:register_info/pages/motifs_page.dart';
import 'package:register_info/pages/taches_page.dart';

class AppDrawer extends StatelessWidget {
  final TabsController tabsController = Get.find<TabsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: tabsController,
        builder: (_) {
          return Drawer(
            backgroundColor: Colors.grey[200],
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //   ),
                //   child: Text(
                //     'Menu',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 24,
                //     ),
                //   ),
                // ),
                // ListTile(
                //   leading: Icon(Icons.home),
                //   title: Text('Home'),
                //   onTap: () {
                //     Get.to(() => HomePage());
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.task),
                  title: Text('Taches'),
                  onTap: () {
                    tabsController.changeTab(TachesPage());
                    // Get.to(() => TachesPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Agents'),
                  onTap: () {
                    tabsController.changeTab(AgentsPage());
                    //Get.to(() => AgentsPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Motifs'),
                  onTap: () {
                    tabsController.changeTab(MotifsPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.picture_as_pdf),
                  title: Text('export'),
                  onTap: () {
                    tabsController.changeTab(ExportDataPage());
                  },
                ),
                
              ],
            ),
          );
        });
  }
}
