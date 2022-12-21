import 'package:bloc/bloc.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final ProductRepository productRepository;
  AllProductsBloc({required this.productRepository}) : super(AllProductsLoading()) {
    on<GetProducts>((event, emit) async{
     try{
      emit(AllProductsLoading());
      var allProducts = await productRepository.getProductData();
      emit(AllProductsGot(productModel: allProducts));
     }
     catch(e){
      emit(AllProductsError(message: e.toString()));
     }
    });
  }
}
