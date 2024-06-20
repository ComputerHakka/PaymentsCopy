part of 'remote_registration_bloc.dart';

sealed class RemoteRegistrationState extends Equatable {
  final String? message;
  final DioException? exception;
  const RemoteRegistrationState({this.message, this.exception});

  @override
  List<Object?> get props => [message, exception];
}

final class RemoteRegistrationInitialState extends RemoteRegistrationState {
  const RemoteRegistrationInitialState();
}

final class RemoteRegistrationInProccesState extends RemoteRegistrationState {
  const RemoteRegistrationInProccesState();
}

final class RemoteRegistrationSuccessState extends RemoteRegistrationState {
  const RemoteRegistrationSuccessState(String message)
      : super(message: message);
}

final class RemoteRegistrationFailedState extends RemoteRegistrationState {
  const RemoteRegistrationFailedState(DioException exception)
      : super(exception: exception);
}
