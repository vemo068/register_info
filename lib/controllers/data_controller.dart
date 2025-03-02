import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:register_info/db/db_helper.dart';
import 'package:register_info/models/action.dart';
import 'package:register_info/models/agent.dart';
import 'package:register_info/models/tache.dart';

class DataController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Actione> actions = [];
  List<Agent> agents = [];
  List<Tache> taches = [];
  Agent? selectedAgent;
  Tache? selectedTache;
  Actione? selectedAction;

  TextEditingController agentNameController = TextEditingController();
  TextEditingController motifNameController = TextEditingController();

//override oninit
  @override
  void onInit() {
    fetchActions();
    fetchAgents();
    fetchTaches();
    super.onInit();
  }

// all crud functions
  void fetchActions() async {
    actions = await _dbHelper.fetchActions();
    update();
  }

  void fetchAgents() async {
    agents = await _dbHelper.fetchAgents();
    update();
  }

  void fetchTaches() async {
    taches = await _dbHelper.fetchTaches();
    update();
  }

  void insertAgent() async {
    await _dbHelper.insertAgent(Agent(name: agentNameController.text));
    agentNameController.clear();
    fetchAgents();
  }

  void insertTache() async {
    await _dbHelper.insertTache(Tache(
      action_id: selectedAction!.id!,
      agent_id: selectedAgent!.id!,
      date: DateTime.now(),
    ));
    selectedAction = null;
    selectedAgent = null;
    fetchTaches();
  }

  void updateAction() async {
    await _dbHelper.updateAction(Actione(name: motifNameController.text));
    motifNameController.clear();
    fetchActions();
  }

  void deleteAction(int id) async {
    await _dbHelper.deleteAction(id);
    fetchActions();
  }

  void insertAction() async {
    await _dbHelper.insertAction(Actione(name: motifNameController.text));
    motifNameController.clear();
    fetchActions();
  }

  void updateAgent() async {
    await _dbHelper.updateAgent(Agent(name: agentNameController.text));
    agentNameController.clear();
    fetchAgents();
  }

  void updateTache(Tache tache) async {
    await _dbHelper.updateTache(tache);
    fetchTaches();
  }

  void deleteAgent(int id) async {
    await _dbHelper.deleteAgent(id);
    fetchAgents();
  }

  void deleteTache(int id) async {
    await _dbHelper.deleteTache(id);
    fetchTaches();
  }

  String getActionNameByID(int id) {
    return actions.firstWhere((action) => action.id == id).name;
  }

  String getAgentNameByID(int id) {
    return agents.firstWhere((agent) => agent.id == id).name;
  }
}
