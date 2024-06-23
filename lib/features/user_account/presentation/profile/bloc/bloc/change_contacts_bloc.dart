import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_contacts_event.dart';
part 'change_contacts_state.dart';

class ChangeContactsBloc
    extends Bloc<ChangeContactsEvent, ChangeContactsState> {
  ChangeContactsBloc() : super(ChangeContactsInitialState()) {
    on<ChangeContactsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
