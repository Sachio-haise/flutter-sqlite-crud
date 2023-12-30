import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shopping_cart/database/product.dart';

class DatabaseService {
  Database? _database;

  Future<Database?> get database async{
    if(_database != null){
      return _database!;
    }
    _database = await _initialize();
    return _database;
  }

  Future<String> get fullPath async{
    const name = 'todo.db';
    final path = await getDatabasesPath();
    return join(path,name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(
        path,
      version: 1,
      onCreate: create,
      singleInstance: true
    );
    return database;
  }

  Future<void> create(Database database, int version) async  {
    if (kDebugMode) {
      print("Creating product table.....");
    }
    await ProductDB().createTable(database);
    if (kDebugMode) {
      print("Product table Created!");
    }
  }

  Future<void> dropTable(tableName) async {
    final database = await DatabaseService().database;
    await database!.execute("DROP TABLE IF EXISTS $tableName");
  }

  Future<void> deleteDB() async{
    if (kDebugMode) {
      print("Deleting Database...");
    }
    final path = await fullPath;
    await deleteDatabase(path);
    if (kDebugMode) {
      print("Database is deleted!");
    }
  }

}