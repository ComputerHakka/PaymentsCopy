import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remote_registration_event.dart';
part 'remote_registration_state.dart';

class RemoteRegistrationBloc extends Bloc<RemoteRegistrationEvent, RemoteRegistrationState> {
  RemoteRegistrationBloc() : super(RemoteRegistrationInitial()) {
    on<RemoteRegistrationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
