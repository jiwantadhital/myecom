import 'package:bloc/bloc.dart';
import 'package:ecommerce/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<LoginRequested>((event, emit) async{
      emit(LoginLoading());
      try{
        var loginData =await authRepository.getAuthenticationData(email: event.email, password: event.password);
          if(loginData.message=="successfull"){
            emit(Authenticated());
          }
          else if(loginData.message=="Invalid login details"){
            emit(AuthError(error: loginData.message.toString()));
            emit(UnAuthenticated());
          }
      }
      catch(e){
         emit(AuthError(error: "Something went wrong"));
        emit(UnAuthenticated());

      }
    });
    on<LoginEmailChanged>((event, emit) {
      if(event.isValidEmail==false){
        return "Email must not be empty";
      }
    });
  }
}
