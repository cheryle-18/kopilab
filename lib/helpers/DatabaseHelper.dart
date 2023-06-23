import 'package:kopilab/models/cart.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      "$path/kopilab.db",
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE carts (id INTEGER PRIMARY KEY AUTOINCREMENT, menuId INTEGER, name STRING, price INTEGER, qty INTEGER, subtotal INTEGER)'
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insert(Cart cart) async {
    final Database db = await database;
    await db.insert('carts', cart.toMap());
  }

  Future<void> update(int menuId, int price, int qty) async {
    final Database db = await database;
    await db.rawUpdate('''
    UPDATE carts
    SET price = $price, qty = $qty, subtotal = $price * $qty
    WHERE menuId = $menuId
    ''');
  }

  Future<List<Cart>> findAll() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('carts');
    return List.generate(maps.length, (i) {
      return Cart(
        menuId: maps[i]['menuId'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        qty: maps[i]['qty'],
        subtotal: maps[i]['subtotal'],
      );
    });
  }
}
