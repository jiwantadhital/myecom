import 'package:bloc/bloc.dart';
import 'package:ecommerce/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(UnAuthenticated()) {
    on<LoginRequested>((event, emit) {
      emit(LoginLoading());
      try{
        var loginData = authRepository.getAuthenticationData(email: event.email, password: event.password);

      }
      catch(e){

      }
    });
    on<LoginEmailChanged>((event, emit) {
      if(event.isValidEmail==false){
        return "Email must not be empty";
      }
    });
  }
}
