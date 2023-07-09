import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paw_patrol/data/local/entities/pet_entity.dart';
import 'package:sqflite/sqflite.dart';

import 'base/base_db_entity.dart';

class DBManager {
  DBManager._();

  static final DBManager db = DBManager._();
  static const String _dbName = "paw_patrol.db";
  static const int _dbVersion = 1;
  final List<BaseDBEntity> _tables = [
    PetEntity.staticObject(),
  ];

  static final DBManager database = DBManager._();
  static Database? _db;

  Future<Database> get _database async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final dbPath = join(documentDirectory.path, _dbName);
    return await openDatabase(
      dbPath,
      version: _dbVersion,
      onCreate: _onCreate,
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) async {
        var batch = db.batch();
        if (oldVersion != newVersion) {
          for (var i = oldVersion; i <= newVersion; i++) {
            if (scriptsMap.containsKey(i) && scriptsMap[i] is Function(Batch)) {
              await scriptsMap[i]!(batch);
            }
          }
        }
      },
    );
  }

  Future _onCreate(Database db, int version) async {
    for (var table in _tables) {
      await db.execute(_getCreateQuery(table));
    }
  }

  String _getCreateQuery(BaseDBEntity entity) {
    var colPart = "";
    final listOfColumns = entity.listOfColumns;
    for (var i = 0; i < listOfColumns.length; i++) {
      var column = listOfColumns[i];
      colPart += "${column.name} ${column.type}";
      if (i != listOfColumns.length - 1) {
        colPart += ",";
      }
    }
    return "CREATE TABLE ${entity.tableName}($colPart)";
  }

  clearAll() async {
    try {
      (await _database).transaction((txn) async {
        var batch = txn.batch();
        for (var table in _tables) {
          batch.delete(table.tableName);
        }
        await batch.commit();
      });
    } catch (error) {
      throw Exception('DbBase.cleanDatabase: $error');
    }
  }

  //region Migration
  static _migrate_v1_to_v2(Batch batch) async {}

  Map<int, Function(Batch)> scriptsMap = {
    1: _migrate_v1_to_v2,
  };

//endregion

//region CRUD
  Future<int> insert(BaseDBEntity model) async {
    return await (await _database).insert(model.tableName, model.toJsonForDB(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> update(BaseDBEntity model) async {
    return await (await _database).update(
      model.tableName,
      model.toJsonForDB(),
      where: '${BaseDBEntity.colId} = ?',
      whereArgs: [model.getId()],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, Object?>>> getAllItems(String tableName) async {
    return await (await _database).query(tableName);
  }

  Future<List<Map<String, Object?>>> getByID(String tableName, int id) async {
    return await (await _database).query(tableName, where: '${BaseDBEntity.colId} = ?', whereArgs: [id]);
  }

//endregion
}
