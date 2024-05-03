import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wework_app/app/core/local_db/table/now_playing_table.dart';
import 'package:wework_app/app/core/local_db/table/top_rated_table.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();

  static Database? _database;

  AppDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/wework2.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> insertTopRated(List<TopRatedTableModel> data) async {
    final db = await instance.database;

    // db.batch().insert(table, values)
    // await db.batch()..insert(TopRatedTableFields.tableName, data)

    data.forEach((element) async {
      await db
          .insert(TopRatedTableFields.tableName, element.toJson())
          .catchError((e) {
        debugPrint("ererer: $e");
      });
    });

    // final id = await db
    //     .insert(TopRatedTableFields.tableName, data.toJson())
    //     .catchError((e) {
    //   print("ererer: $e");
    // });
    // return note.copy(id: id);
  }

  Future<void> insertNowPlaing(List<NowPlayingTableModel> data) async {
    final db = await instance.database;

    // db.batch().insert(table, values)
    // await db.batch()..insert(TopRatedTableFields.tableName, data)

    data.forEach((element) async {
      await db
          .insert(NowPlayingTableFields.tableName, element.toJson())
          .catchError((e) {
        debugPrint("ererer: $e");
      });
    });

    // final id = await db
    //     .insert(TopRatedTableFields.tableName, data.toJson())
    //     .catchError((e) {
    //   print("ererer: $e");
    // });
    // return note.copy(id: id);
  }

  Future<List<TopRatedTableModel>> readAllTopRated() async {
    final db = await instance.database;
    const orderBy = '${TopRatedTableFields.createdTime} DESC';
    final result =
        await db.query(TopRatedTableFields.tableName, orderBy: orderBy);
    return result.map((json) => TopRatedTableModel.fromJson(json)).toList();
  }

  Future<int> deleteAll(String tableName) async {
    final db = await instance.database;

    // return await db.delete(
    //   TopRatedTableFields.tableName,
    //   where: '${TopRatedTableFields.id} = ?',

    //   whereArgs: [id],
    // );

    return await db.rawDelete("DELETE FROM $tableName");
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

Future<void> _createDatabase(Database db, _) async {
  return await db.execute('''
        CREATE TABLE ${TopRatedTableFields.tableName} (
          ${TopRatedTableFields.id} ${TopRatedTableFields.idType},
          ${TopRatedTableFields.number} ${TopRatedTableFields.intType},
          ${TopRatedTableFields.title} ${TopRatedTableFields.textType},
          ${TopRatedTableFields.content} ${TopRatedTableFields.textType},
          ${TopRatedTableFields.image} ${TopRatedTableFields.textType},
          ${TopRatedTableFields.rating} ${TopRatedTableFields.textType},
          ${TopRatedTableFields.voteCount} ${TopRatedTableFields.intType},
          ${TopRatedTableFields.isFavorite} ${TopRatedTableFields.intType},
          ${TopRatedTableFields.createdTime} ${TopRatedTableFields.textType}
        )
      ''');
}
