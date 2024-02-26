import 'package:demo_flutter/model/response_model/search_recipe_list_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  late Database _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'your_database.db');

    // open the database
    _database = await openDatabase(path, version: 1, onCreate: _createTable);
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE RecipeResults (
        id INTEGER PRIMARY KEY,
        title TEXT,
        image TEXT,
        imageType TEXT
      )
    ''');
  }

  Future<void> insertResultsList(List<Results>? results) async {
    if (!_database.isOpen) {
      await initDatabase();
    }

    final batch = _database.batch();

    results?.forEach((result) {
      batch.insert('RecipeResults', result.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });

    await batch.commit();
  }

  Future<List<Results>> retrieveResultsFromSQLite() async {
    if (!_database.isOpen) {
      await initDatabase();
    }

    final List<Map<String, dynamic>> maps = await _database.query('RecipeResults');

    return List.generate(maps.length, (index) {
      return Results.fromJson(maps[index]);
    });
  }

  Future<Database> get database async {
    if (_database.isOpen) {
      return _database;
    } else {
      await initDatabase();
      return _database;
    }
  }
}
