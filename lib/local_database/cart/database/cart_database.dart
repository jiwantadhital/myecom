import 'package:ecommerce/local_database/cart/database/cart_database_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class CartDatabase{
  static final CartDatabase instance = CartDatabase._init();


static Database? _database;
CartDatabase._init();


Future<Database> get database async{
  if(_database !=null) return _database!;
  _database = await _initDB('theCart.db');
  return _database!;
}

Future<Database> _initDB(String filePath) async{
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);
  return await openDatabase(path, version: 1, onCreate: _createDB);
}

Future _createDB(Database db, int version) async{
  final idType = "INTEGER NOT NULL";
  final integerType = "INTEGER NOT NULL";

  await db.execute(
    '''
CREATE TABLE $tableCart(
  ${CartFields.id} $idType,
  ${CartFields.count} $integerType
)
'''
  );
}

Future<CartModelDatabase> create(CartModelDatabase cartModelDatabase) async{
  final db = await instance.database;

  final id = await db.insert(tableCart, cartModelDatabase.toJson());
  return cartModelDatabase.copy(id:id);
}

Future<List<CartModelDatabase>> readAll() async{
  final db = await instance.database;
  final result = await db.query(tableCart);

  return result.map((json) => CartModelDatabase.fromJson(json)).toList();
}

Future<int> update(CartModelDatabase cartModelDatabase) async{
  final db = await instance.database;

  return db.update(tableCart, cartModelDatabase.toJson(),
  where: '${CartFields.id} = ?',
  whereArgs: [cartModelDatabase.id],
  );
}

Future<int> delete(int id) async{
  final db = await instance.database;
  return await db.delete(tableCart,
  where: '${CartFields.id} = ?',
  whereArgs: [id]
  );
}

}