part of 'address_bloc_bloc.dart';

abstract class AddressBlocState extends Equatable {
  const AddressBlocState();
  
  @override
  List<Object> get props => [];
}

class AddressBlocInitial extends AddressBlocState {
  @override
  List<Object> get props => [];
}

class AddressAdding extends AddressBlocState {
  @override
  List<Object> get props => [];
}
class AddressAdded extends AddressBlocState {

  @override
  List<Object> get props => [];
}
class AddressDeleted extends AddressBlocState {
  @override
  List<Object> get props => [];
}

class AddressUpdated extends AddressBlocState { 
  @override
  List<Object> get props => [];
}
class AddressUpdating extends AddressBlocState {   
  @override
  List<Object> get props => [];
}
class AddressDeleting extends AddressBlocState {   
  @override
  List<Object> get props => [];
}
class AddressLoaded extends AddressBlocState {
final List<AddressModelDatabase> addressModelDatabase;
  AddressLoaded({
    required this.addressModelDatabase,
  });
   
  @override
  List<Object> get props => [];
}
class AddressError extends AddressBlocState {
 String? message;
  AddressError({
    this.message,
  });
   
  @override
  List<Object> get props => [];
}
