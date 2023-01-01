// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_detail_bloc.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();
  
  @override
  List<Object> get props => [];
}

class UserDetailError extends UserDetailState {
  final String message;
  UserDetailError({
    required this.message,
  });
    @override
  List<Object> get props => [message];
}

class UserDetailLoading extends UserDetailState{

    @override
  List<Object> get props => [];
}

class UserDetailGot extends UserDetailState {
  final UserModel userModel;
  UserDetailGot({
    required this.userModel,
  });
    @override
  List<Object> get props => [userModel];
}
