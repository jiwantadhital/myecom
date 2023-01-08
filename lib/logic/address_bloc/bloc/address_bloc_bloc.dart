import 'package:bloc/bloc.dart';
import 'package:ecommerce/local_database/address/controller/address_controller.dart';
import 'package:ecommerce/local_database/address/database/address_database_model.dart';
import 'package:equatable/equatable.dart';

part 'address_bloc_event.dart';
part 'address_bloc_state.dart';

class AddressBlocBloc extends Bloc<AddressBlocEvent, AddressBlocState> {
  AddressController addressController;
  AddressBlocBloc({required this.addressController}) : super(AddressBlocInitial()) {
    on<AddToAddressEvent>((event, emit) async{
      emit(AddressAdding());
      try{
        await addressController.createAddress(event.title, event.address);
        emit(AddressAdded());
      }
      catch(e){
        emit(AddressError(message: e.toString()));
      }
    });
    //for update
    on<UpdateAddressEvent>((event, emit) async{
      emit(AddressUpdating());
      try{
        await addressController.updateAddress(event.title, event.address);
        emit(AddressUpdated());
      }
      catch(e){
        emit(AddressError(message: e.toString()));
      }
    });

    //for load data
    on<LoadAddressEvent>((event, emit) async{
      emit(AddressBlocInitial());
      try{
       await addressController.getAddress();
        emit(AddressLoaded(addressModelDatabase: addressController.address));
      }
      catch(e){
        emit(AddressError(message: e.toString()));
      }
    });
    //for address delete
    on<AddressDeleteEvent>((event, emit) async{
      emit(AddressDeleting());
      try{
        await addressController.deleteAddress(event.id);
        emit(AddressDeleted());
      }
      catch(e){
        emit(AddressError(message: e.toString()));
      }
    });
  }
}
