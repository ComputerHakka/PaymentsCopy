import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/login.dart';

part 'remote_auth_event.dart';
part 'remote_auth_state.dart';

class RemoteAuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final LoginUseCase _loginUseCase;
  RemoteAuthBloc(this._loginUseCase) : super(const RemoteAuthInProccesState()) {
    on<LoginEvent>(onLogin);
  }

  void onLogin(LoginEvent event, Emitter<RemoteAuthState> emit) async {
    final dataState = await _loginUseCase(
        params: AuthRequest(
      email: event.email,
      password: event.password,
    ));
    if (dataState is DataSuccess) {
      emit(RemoteAuthSuccessState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteAuthFailedState(dataState.exception!));
    }
  }
}
