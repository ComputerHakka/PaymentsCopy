import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/change_contacts.dart';

part 'change_contacts_event.dart';
part 'change_contacts_state.dart';

class ChangeContactsBloc
    extends Bloc<ChangeContactsEvent, ChangeContactsState> {
  final ChangeContactsUseCase _changeContactsUseCase;
  ChangeContactsBloc(this._changeContactsUseCase)
      : super(const ChangeContactsInitialState()) {
    on<SendPhoneEvent>(onSendPhone);
    on<SendEmailEvent>(onSendEmail);
    on<ExitPageEvent>(onExitPage);
  }

  void onSendPhone(
      SendPhoneEvent event, Emitter<ChangeContactsState> emit) async {
    emit(const ChangeContactsLoadingState());
    final dataState = await _changeContactsUseCase(
      params: ChangeContactsRequest(phone: event.phone),
    );
    if (dataState is DataSuccess) {
      emit(ChangeContactsDoneState(message: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ChangeContactsFailedState(exception: dataState.exception!));
    }
  }

  void onSendEmail(
      SendEmailEvent event, Emitter<ChangeContactsState> emit) async {
    emit(const ChangeContactsLoadingState());
    final dataState = await _changeContactsUseCase(
      params: ChangeContactsRequest(email: event.email),
    );
    if (dataState is DataSuccess) {
      emit(ChangeContactsDoneState(message: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ChangeContactsFailedState(exception: dataState.exception!));
    }
  }

  void onExitPage(ExitPageEvent event, Emitter<ChangeContactsState> emit) {
    emit(const ChangeContactsInitialState());
  }
}
