// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
 
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}
class CartAdding extends CartState {
  @override
  List<Object> get props => [];
}
class CartAdded extends CartState {

  @override
  List<Object> get props => [];
}
class CartDeleted extends CartState {
  @override
  List<Object> get props => [];
}

class CartUpdated extends CartState { 
  @override
  List<Object> get props => [];
}
class CartUpdating extends CartState {   
  @override
  List<Object> get props => [];
}
class CartLoaded extends CartState {
final List<CartModelDatabase> cartModelDatabase;
int total;
int countTotal;
  CartLoaded({
    required this.cartModelDatabase,
    required this.total,
    required this.countTotal,
  });
   
  @override
  List<Object> get props => [];
}
class CartError extends CartState {
 String? message;
  CartError({
    this.message,
  });
   
  @override
  List<Object> get props => [];
}
