import 'package:bloc/bloc.dart';
import 'package:ecommerce/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ProductOrder productOrder;
  OrderBloc({required this.productOrder}) : super(OrderInitial()) {
    on<OrderPostEvent>((event, emit) async{
      emit(OrderLoading());
      try{
        var orderData = await productOrder.getOrderData(user_id: event.user_id, order_code: event.order_code, items: event.items, discount: event.discount, shipping_cost: event.shipping_cost, order: event.order, address: event.address, total_price: event.total_price, order_status_id: event.order_status_id, payment_code: event.payment_code, created_by: event.created_by);
        if(orderData.message=="success"){
          emit(OrderDone());
        }
        else if(orderData.message == "failure"){
          emit(OrderError(message: "Failure"));
        }
      }
      catch(e){
        emit(OrderError(message: e.toString()));
      }
    });
  }
}
