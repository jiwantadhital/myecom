// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {

}

class AddToCartEvent extends CartEvent {
int id;
int count;
  AddToCartEvent({
    required this.id,
    required this.count,
  });
  @override
  List<Object> get props => [id, count];
}
class UpdateCartEvent extends CartEvent {
int id;
int count;
  UpdateCartEvent({
    required this.id,
    required this.count,
  });
  @override
  List<Object> get props => [id, count];
}

class LoadCartEvent extends CartEvent{
   @override
  List<Object> get props => [];
}
class CartDeleteEvent extends CartEvent {
  int id;
  CartDeleteEvent({
    required this.id,
  });
   @override
  List<Object> get props => [];
}
