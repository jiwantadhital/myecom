import 'package:ecommerce/local_database/cart/database/cart_database.dart';
import 'package:ecommerce/local_database/cart/database/cart_database_model.dart';

class CartController{
  late List<CartModelDatabase> cart;

  Future getCart()async{
    this.cart = await CartDatabase.instance.readAll();
  }

  Future deleteCart(int id)async{
    await CartDatabase.instance.delete(id);
  }

  Future createCart(id,count,image,title,price)async{
    final cart = CartModelDatabase(id: id, count: count,image: image,price: price,title: title);
    await CartDatabase.instance.create(cart);
  }

  Future updateCart(id,count,image,title,price)async{
    final cart = CartModelDatabase(id: id, count: count,image: image,price: price,title: title);
    await CartDatabase.instance.update(cart);
  }

  increase(int number){
    if(number<20){
    number ++;
    }
  }
  decrease(int number){
    if(number!=1){
    number --;
    }
  }
}
