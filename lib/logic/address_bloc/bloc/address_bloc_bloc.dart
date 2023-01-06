import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'address_bloc_event.dart';
part 'address_bloc_state.dart';

class AddressBlocBloc extends Bloc<AddressBlocEvent, AddressBlocState> {
  AddressBlocBloc() : super(AddressBlocInitial()) {
    on<AddressBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
