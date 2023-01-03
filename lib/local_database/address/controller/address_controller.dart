import 'package:ecommerce/local_database/address/database/address_database.dart';
import 'package:ecommerce/local_database/address/database/address_database_model.dart';

class AddressController{
late List<AddressModelDatabase> address;

Future getAddress()async{
  this.address = await AddressDatabase.instance.readAll();
}

Future deleteAddress(int id)async{
  await AddressDatabase.instance.delete(id);
}

Future createAddress(id,title,address)async{
final theAddress = AddressModelDatabase(id: id, title: title, address: address);
await AddressDatabase.instance.create(theAddress);
}

Future updateAddress(id,title,address)async{
final theAddress = AddressModelDatabase(id: id, title: title, address: address);
await AddressDatabase.instance.update(theAddress);
}


}