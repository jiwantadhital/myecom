// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  
  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderDone extends OrderState {
  
}
class OrderError extends OrderState {
  String message;
  OrderError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}
