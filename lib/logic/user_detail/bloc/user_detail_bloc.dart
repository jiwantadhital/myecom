import 'package:bloc/bloc.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UserDetailsRepo userDetailsRepo;
  UserDetailBloc({required this.userDetailsRepo}) : super(UserDetailLoading()) {
    on<UserDetailData>((event, emit) async{
     try{
      emit(UserDetailLoading());
      var allUserData = await userDetailsRepo.getUserData();
      emit(UserDetailGot(userModel: allUserData));
     }
     catch(e){
      emit(UserDetailError(message: e.toString()));
     }
    });
  }
}
