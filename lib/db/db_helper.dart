import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:register_info/db/tables.dart';
import 'package:register_info/models/action.dart';
import 'package:register_info/models/agent.dart';
import 'package:register_info/models/tache.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  final String databaseName = "register_info.db";

  // Database connection initialization
  Future<Database> init() async {
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, databaseName);
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables
        await db.execute(actionsTable);
        await db.execute(agentsTable);
        await db.execute(tachesTable);
      },
    );
  }

  //create CRUD Methods for actions table
  Future<int> insertAction(Actione action) async {
    final db = await init();
    return db.insert('actions', action.toJson());
  }

  Future<List<Actione>> fetchActions() async {
    final db = await init();
    final maps = await db.query('actions');
    return List.generate(maps.length, (i) {
      return Actione.fromJson(maps[i]);
    });
  }

  Future<int> updateAction(Actione action) async {
    final db = await init();
    return db.update(
      'actions',
      action.toJson(),
      where: 'id = ?',
      whereArgs: [action.id],
    );
  }

  Future<int> deleteAction(int id) async {
    final db = await init();
    return db.delete(
      'actions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//create CRUD Methods for agents table
  Future<int> insertAgent(Agent agent) async {
    final db = await init();
    return db.insert('agents', agent.toJson());
  }

  Future<List<Agent>> fetchAgents() async {
    final db = await init();
    final maps = await db.query('agents');
    return List.generate(maps.length, (i) {
      return Agent.fromJson(maps[i]);
    });
  }

  Future<int> updateAgent(Agent agent) async {
    final db = await init();
    return db.update(
      'agents',
      agent.toJson(),
      where: 'id = ?',
      whereArgs: [agent.id],
    );
  }

  Future<int> deleteAgent(int id) async {
    final db = await init();
    return db.delete(
      'agents',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//create CRUD Methods for taches table
  Future<int> insertTache(Tache tache) async {
    final db = await init();
    return db.insert('taches', tache.toJson());
  }

  Future<List<Tache>> fetchTaches() async {
    final db = await init();
    final maps = await db.query('taches');
    return List.generate(maps.length, (i) {
      return Tache.fromJson(maps[i]);
    });
  }

  Future<int> updateTache(Tache tache) async {
    final db = await init();
    return db.update(
      'taches',
      tache.toJson(),
      where: 'id = ?',
      whereArgs: [tache.id],
    );
  }

  Future<int> deleteTache(int id) async {
    final db = await init();
    return db.delete(
      'taches',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //get agent by id
  Future<Agent> getAgentById(int id) async {
    final db = await init();
    final maps = await db.query('agents', where: 'id = ?', whereArgs: [id]);
    return Agent.fromJson(maps.first);
  }

  // get action by id
  Future<Actione> getActionById(int id) async {
    final db = await init();
    final maps = await db.query('actions', where: 'id = ?', whereArgs: [id]);
    return Actione.fromJson(maps.first);
  }
}
