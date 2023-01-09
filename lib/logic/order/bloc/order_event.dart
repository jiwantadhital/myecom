// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
}

class OrderPostEvent extends OrderEvent {
  int user_id;
  String order_code;
  int items;
  double total_price;
  int discount;
  int shipping_cost;
  String order;
  String address;
  int order_status_id;
  String payment_code;
  int created_by;
  OrderPostEvent({
    required this.user_id,
    required this.order_code,
    required this.items,
    required this.total_price,
    required this.discount,
    required this.shipping_cost,
    required this.order,
    required this.address,
    required this.order_status_id,
    required this.payment_code,
    required this.created_by,
  });
  
  @override
  List<Object> get props => [user_id,order,order_code,order_status_id,shipping_cost,payment_code,created_by];
}


class OrderUpdate extends OrderEvent {
  int payment_id;
  OrderUpdate({
    required this.payment_id,
  });
  @override
  List<Object?> get props => [payment_id];

}
