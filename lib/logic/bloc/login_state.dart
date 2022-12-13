part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class UnAuthenticated extends LoginState {}

class LoginLoading extends LoginState {}

class AuthError extends LoginState {
  final String error;

   AuthError({required this.error});
 

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
class Authenticated extends LoginState {
  @override
  List<Object?> get props => [];
}