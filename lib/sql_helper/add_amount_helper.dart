import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';

class AddExpenseSQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    source_of_income TEXT,
    add_amount TEXT,
    add_amount_date_time TEXT 
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('add_manager.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      print("...creating a table...");
      await createTables(database);
    });
  }

  static Future<int> createItem(String sourceOfIncome, String? addAmount,
      String? addAmountDateTime) async {
    final db = await AddExpenseSQLHelper.db();

    final data = {
      'source_of_income': sourceOfIncome,
      'add_amount': addAmount,
      'add_amount_date_time': addAmountDateTime
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    // final items = await db.query('items', orderBy: 'add_amount_date_time DESC');
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await AddExpenseSQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await AddExpenseSQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String sourceOfIncome,
      String? addAmount, String? addAmountDateTime) async {
    final db = await AddExpenseSQLHelper.db();

    final data = {
      'source_of_income': sourceOfIncome,
      'add_amount': addAmount,
      'add_amount_date_time': addAmountDateTime,
      // 'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await AddExpenseSQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
