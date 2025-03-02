import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/pages/taches_page.dart';

class TabsController extends GetxController {
  Widget selectedTab = TachesPage();

  void changeTab(Widget tab) {
    selectedTab = tab;
    update();
  }
}
