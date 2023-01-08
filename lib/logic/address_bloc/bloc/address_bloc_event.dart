part of 'address_bloc_bloc.dart';

abstract class AddressBlocEvent extends Equatable {
  const AddressBlocEvent();

  @override
  List<Object> get props => [];
}

class AddToAddressEvent extends AddressBlocEvent {
int? id;
String address;
String title;
  AddToAddressEvent({
     this.id,
    required this.address,
    required this.title,
  });
  @override
  List<Object> get props => [title,address];
}
class UpdateAddressEvent extends AddressBlocEvent {
int? id;
String address;
String title;
  UpdateAddressEvent({
   this.id,
    required this.address,
    required this.title,
  });
  @override
  List<Object> get props => [title,address];
}

class LoadAddressEvent extends AddressBlocEvent{
   @override
  List<Object> get props => [];
}
class AddressDeleteEvent extends AddressBlocEvent {
  int id;
  AddressDeleteEvent({
    required this.id,
  });
   @override
  List<Object> get props => [];
}
