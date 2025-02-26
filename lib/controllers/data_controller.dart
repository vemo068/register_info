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

  void insertAgent(Agent agent) async {
    await _dbHelper.insertAgent(agent);
    fetchAgents();
  }

  void insertTache(Tache tache) async {
    await _dbHelper.insertTache(tache);
    fetchTaches();
  }

  void updateAgent(Agent agent) async {
    await _dbHelper.updateAgent(agent);
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