const String actionsTable = """CREATE TABLE actions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);""";

const String agentsTable = """CREATE TABLE agents (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);""";

const String tachesTable = """CREATE TABLE taches (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  action_id INTEGER NOT NULL,
  agent_id INTEGER NOT NULL,
  date TEXT NOT NULL,
  FOREIGN KEY(action_id) REFERENCES actions(id),
  FOREIGN KEY(agent_id) REFERENCES agents(id)
);""";