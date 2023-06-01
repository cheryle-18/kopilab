import 'package:sqflite/sqflite.dart';

import '../models/dtrans.dart';
import '../models/htrans.dart';

class DbHelper {
  static late Database _database;
  static DbHelper? _dbHelper;

  DbHelper._internal() {
    _dbHelper = this;
  }

  factory DbHelper() => _dbHelper ?? DbHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _htrans = 'htrans';
  static const String _dtrans = 'dtrans';
  static const String _menu = 'menu';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = await openDatabase(
      "$path/kopilab_db.db",
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE $_htrans(orderId INTEGER PRIMARY KEY, totalItem INTEGER, totalPrice INTEGER, status TEXT, createdAt TEXT, updatedAt TEXT');
        await db.execute(
            'CREATE TABLE $_dtrans(orderId INTEGER PRIMARY KEY, menuId INTEGER, price INTEGER, qty INTEGER, subtotal INTEGER, status TEXT, createdAt TEXT, updatedAt TEXT');
        await db.execute(
            'CREATE TABLE $_menu(menuId INTEGER PRIMARY KEY, name TEXT, description TEXT, price INTEGER, category TEXT, imageUrl TEXT, imageUrl2 TEXT');

        // await db.transaction((txn) async {
        //   await txn.rawInsert(
        //       'INSERT INTO htrans(orderId, totalItem, totalPrice, status, createdAt, updatedAt) VALUES'
        //       '(1, 1, 20000, "Done", "", ""),'
        //       '(2, 2, 50000, "Pending", "", ""),');
        // });
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertHtrans(Htrans htrans) async {
    final Database db = await database;
    await db.insert(_htrans, htrans.toMap());
    print('Htrans inserted');
  }

  Future<void> updateHtrans(Htrans htrans) async {
    final Database db = await database;
    await db.update(_htrans, htrans.toMap());
    print('Htrans updated');
  }

  Future<void> insertDtrans(Dtrans dtrans) async {
    final Database db = await database;
    await db.insert(_dtrans, dtrans.toMap());
    print('Dtrans inserted');
  }

  Future<void> updateDtrans(Dtrans dtrans) async {
    final Database db = await database;
    await db.update(_dtrans, dtrans.toMap());
    print('Dtrans updated');
  }
}
