import 'package:makeup/model/cartProductModel.dart';
import 'package:makeup/screen/widget/constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDataBaseHelper {
  CartDataBaseHelper._();

  static final CartDataBaseHelper db = CartDataBaseHelper._();

  static Database? _database;

  Future<Database?> get databes async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDb();
    }
  }

  initDb() async {
    String path = join(await getDatabasesPath(), "CartProduct.db");

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(''' 
      CREATE TABLE $tableCartProduct (
        $columnName Text NOTT NULL,
        $columnImage TEXT NOT NULL,
        $columnPrice TEXT NOT NULL,
        $columnQuantity INTEGER NOT NULL
      )
       ''');
    });
  }

  insert(CartProductModel model) async {
    var bdClient = await databes;

    await bdClient?.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
