import 'package:ecommerce/local_database/address/database/address_database_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class AddressDatabase{
static final AddressDatabase instance = AddressDatabase._init();

static Database? _database;
AddressDatabase._init();

Future<Database> get database async{
  if(_database != null) return _database!;
  _database = await _initDB("address.db");
  return _database!;
}

Future<Database> _initDB(String filePath)async{
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, filePath);
  return await openDatabase(path,version: 1, onCreate: _createDB);
}

Future _createDB(Database db, int version)async{
  final idType = "INTEGER PRIMARY KEY";
  final integerType = "INTEGER NOT NULL";
  final textType = "TEXT NOT NULL";
  final doubleType = "DOUBLE NOT NULL";

  await db.execute(
    '''
  CREATE TABLE $tableAddress(
    ${AddressFields.id} $idType,
    ${AddressFields.title} $textType,
    ${AddressFields.address} $textType
  )
    '''
  );
}

Future<AddressModelDatabase> create( AddressModelDatabase addressModelDatabase)async{
  final db = await instance.database;
  final id = await db.insert(tableAddress, addressModelDatabase.toJson());
  return addressModelDatabase.copy(id: id);
}

Future<List<AddressModelDatabase>> readAll()async{
  final db = await instance.database;
  final result = await db.query(tableAddress);
  return result.map((json) => AddressModelDatabase.fromJson(json)).toList();
}

Future<int> update (AddressModelDatabase addressModelDatabase)async{
  final db = await instance.database;

  return db.update(tableAddress, addressModelDatabase.toJson(),
  where: '${AddressFields.id} = ?',
  whereArgs: [addressModelDatabase.id],
  );
}

Future<int> delete(int id)async{
  final db = await instance.database;
  return await db.delete(tableAddress,
  where: '${AddressFields.id} = ?',
  whereArgs: [id]
  );
}

}