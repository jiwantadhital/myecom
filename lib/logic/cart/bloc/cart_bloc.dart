import 'package:bloc/bloc.dart';
import 'package:ecommerce/data_provider/product_provider.dart';
import 'package:ecommerce/local_database/cart/controller/cart_controller.dart';
import 'package:ecommerce/local_database/cart/database/cart_database_model.dart';
import 'package:ecommerce/local_database/cart/database/cart_database_model.dart';
import 'package:ecommerce/local_database/cart/database/cart_database_model.dart';
import 'package:equatable/equatable.dart';

import '../../../local_database/cart/database/cart_database_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartController cartController;
  CartBloc({required this.cartController}) : super(CartInitial()) {
    //create
    on<AddToCartEvent>((event, emit) async{
      emit(CartAdding());
      try{
      await cartController.createCart(event.id, event.count);
       emit(CartAdded());
      }
      catch(e){
        emit(CartError(message: e.toString()));
      }
    });
    //update
     on<UpdateCartEvent>((event, emit) async{
      emit(CartUpdating());
      try{
      await cartController.updateCart(event.id, event.count);
       emit(CartUpdated());
      }
      catch(e){
        emit(CartError(message: e.toString()));
      }
    });
    //load
    on<LoadCartEvent>(((event, emit) async{
       emit(CartInitial());
      try{
     await cartController.getCart();
       emit(CartLoaded(cartModelDatabase: cartController.cart));
      }
      catch(e){
        emit(CartError(message: e.toString()));
      }
    }));
    //delete
    on<CartDeleteEvent>(((event, emit) async{
       emit(CartAdding());
      try{
      await cartController.deleteCart(event.id);
       emit(CartDeleted());
      }
      catch(e){
        emit(CartError(message: e.toString()));
      }
    }));
  }
}
