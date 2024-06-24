part of 'change_contacts_bloc.dart';

sealed class ChangeContactsState extends Equatable {
  final String? message;
  final DioException? exception;
  const ChangeContactsState({this.message, this.exception});

  @override
  List<Object?> get props => [message, exception];
}

final class ChangeContactsInitialState extends ChangeContactsState {
  const ChangeContactsInitialState();
}

final class ChangeContactsLoadingState extends ChangeContactsState {
  const ChangeContactsLoadingState();
}

final class ChangeContactsDoneState extends ChangeContactsState {
  const ChangeContactsDoneState({super.message});
}

final class ChangeContactsFailedState extends ChangeContactsState {
  const ChangeContactsFailedState({super.exception});
}
