import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:register_info/controllers/data_controller.dart';
import 'package:register_info/controllers/tabs_controller.dart';
import 'package:register_info/pages/home_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:system_info2/system_info2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  print('User id                 : ${SysInfo.userId}');
  print('User name               : ${SysInfo.userName}');
  runApp(RegisterInfoApp());
}

class RegisterInfoApp extends StatelessWidget {
  final DataController dataController = Get.put(DataController());
  final TabsController tabsController = Get.put(TabsController());

  RegisterInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register Info',
      home: HomePage(),
    );
  }
}
