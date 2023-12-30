import 'package:sqflite/sqflite.dart';
import 'package:shopping_cart/database/database_service.dart';
import 'package:shopping_cart/model/product.dart';

class ProductDB {
   final tableName = 'products';

   Future<void> createTable(Database database) async {
     await database.execute(
       """CREATE TABLE IF NOT EXISTS $tableName (
         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
         name STRING NOT NULL,
         price STRING NOT NULL,
         brand STRING NOT NULL,
         createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
         updatedAt TIMESTAMP
         );
      """
     );
   }

   Future<int> create({required String name,required String price,required String brand}) async {
     final database = await DatabaseService().database;
     final data =  [name,price,brand,DateTime.now().millisecondsSinceEpoch];
     return await database!.rawInsert(
       '''INSERT INTO $tableName (name,price,brand,createdAt) VALUES (?,?,?,?)''',
      data
     );
   }

   Future<List<Map<String,dynamic>>> fetchAll() async {
     final database = await DatabaseService().database;
     final products = await database!.rawQuery(
       '''SELECT * from $tableName ORDER BY updatedAt DESC, createdAt DESC'''
     );
     return products;
   }

   Future<ProductModel> fetchById(int id) async {
     final database = await DatabaseService().database;
     final product = await database!.rawQuery(
       '''SELECT * from $tableName WHERE id = ?''',[id]
     );
     return ProductModel.fromSqfliteDatabase(product.first);
   }

   Future<int> update({int? id, String? name,String? price,String? brand}) async {
     final database = await DatabaseService().database;
     return await database!.update(tableName,
     {
       if (name != null) 'name' : name,
       if (price != null) 'price' : price,
       if (brand != null) 'brand' : brand,
       'updatedAt': DateTime.now().millisecondsSinceEpoch

     },
       where: 'id = ?',
       conflictAlgorithm: ConflictAlgorithm.rollback,
       whereArgs: [id]
     );
   }

   Future<void> delete(int id) async{
     final database = await DatabaseService().database;
     await database!.rawDelete('''DELETE FROM $tableName WHERE id = ?''', [id]);
   }
}