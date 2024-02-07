import 'dart:io';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sunnah_2024/models/task_model.dart';

class SQLiteDatabase {
  final String _taskTable = "Task";
  final String _categoryTable = "Category";
  late Database _database;

  Future<Database> _openTaskDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "app_database.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(url.join("assets/data/", "Tasks.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      // Varolan db'den verileri alır.
      print("Opening existing database");
      //Database assetDb = await openDatabase(path, readOnly: false);
    }

    // open the database
    return await openDatabase(path, readOnly: false);
  }

  Future<List<TaskModel>> getTasks() async {
    Database database = await _openTaskDatabase();
    var result = await database.query(_taskTable);
    List<TaskModel> tasks = [];
    for (var map in result) {
      tasks.add(TaskModel.fromMap(map));
    }
    return tasks;
  }

  Future<List<TaskModel>> getTasksById(int id) async {
    _database = await _openTaskDatabase();
    var result = await _database.query(_taskTable, where: 'category = ?', whereArgs: [id]);
    List<TaskModel> tasks = [];
    for (var map in result) {
      tasks.add(TaskModel.fromMap(map));
    }
    return tasks;
  }

  Future<void> updateTask(TaskModel task) async {
    _database = await _openTaskDatabase();
    int i = await _database.update(_taskTable, task.toMapWithoutID(), where: 'id = ?', whereArgs: [task.id]);
    print("$i satır güncellendi.");
  }

  Future<double> getPercent() async {
    List<TaskModel> tasks = await getTasks();
    var complete = 0;
    for (var element in tasks) {
      if (element.isComplete == 1) {
        complete++;
      }
    }
    return ((complete / tasks.length) * 100);
  }

  Future<String> getCategoryTitleById(int id) async {
    _database = await _openTaskDatabase();

    var result = await _database.query(_categoryTable, columns: ['title'], where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      return result.first['title'] as String;
    } else {
      // Eğer belirtilen id'ye sahip bir kategori bulunamazsa, null veya varsayılan bir değer döndürebilirsiniz.
      return 'Sünnet';
    }
  }
}
