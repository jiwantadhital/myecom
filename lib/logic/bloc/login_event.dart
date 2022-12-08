// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEmailChanged extends LoginEvent{
String? email;
bool get isValidEmail => email!.length>3;
LoginEmailChanged({this.email});
}

class LoginPasswordChanged extends LoginEvent{
String? password;
LoginPasswordChanged({this.password});
}
class LoginRequested extends LoginEvent {
  final String email;
  final String password;
  LoginRequested({
    required this.email,
    required this.password,
  });
}
class LoginSubmitted extends LoginEvent{}