import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:register_info/pages/home_page.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const RegisterInfoApp());
}
class RegisterInfoApp extends StatelessWidget {
  const RegisterInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Register Info',
      home: HomePage(),
    );
  }
}
