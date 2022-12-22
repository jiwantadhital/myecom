// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_products_bloc.dart';

abstract class AllProductsState extends Equatable {
}

class AllProductsLoading extends AllProductsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AllProductsError extends AllProductsState {
  final String message;
  AllProductsError({
    required this.message,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class AllProductsGot extends AllProductsState {
  final List<ProductModel> productModel;
  AllProductsGot({
    required this.productModel,
  });
  @override
  // TODO: implement props
  List<Object?> get props =>[productModel];
}
