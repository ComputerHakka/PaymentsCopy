import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/registration.dart';

part 'remote_registration_event.dart';
part 'remote_registration_state.dart';

class RemoteRegistrationBloc
    extends Bloc<RemoteRegistrationEvent, RemoteRegistrationState> {
  final RegistrationUseCase _registrationUseCase;
  RemoteRegistrationBloc(this._registrationUseCase)
      : super(const RemoteRegistrationInitialState()) {
    on<CreateUserEvent>(onCreateUser);
  }

  void onCreateUser(
      CreateUserEvent event, Emitter<RemoteRegistrationState> emit) async {
    emit(const RemoteRegistrationInProccesState());
    final dataState = await _registrationUseCase(
      params: UserModel(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      ),
    );
    if (dataState is DataSuccess) {
      emit(RemoteRegistrationSuccessState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteRegistrationFailedState(dataState.exception!));
    }
  }
}
