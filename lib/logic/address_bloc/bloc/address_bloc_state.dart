part of 'address_bloc_bloc.dart';

abstract class AddressBlocState extends Equatable {
  const AddressBlocState();
  
  @override
  List<Object> get props => [];
}

class AddressBlocInitial extends AddressBlocState {}
