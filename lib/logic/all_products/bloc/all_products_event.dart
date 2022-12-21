part of 'all_products_bloc.dart';

abstract class AllProductsEvent extends Equatable {
  const AllProductsEvent();


}


class GetProducts extends AllProductsEvent{
  @override
  List<Object> get props => [];
}