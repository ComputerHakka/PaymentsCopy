part of 'remote_auth_bloc.dart';

sealed class RemoteAuthState extends Equatable {
  final UserEntity? user;
  final DioException? exception;
  const RemoteAuthState({this.user, this.exception});

  @override
  List<Object> get props => [user!];
}

final class RemoteAuthInProccesState extends RemoteAuthState {
  const RemoteAuthInProccesState();
}

final class RemoteAuthSuccessState extends RemoteAuthState {
  const RemoteAuthSuccessState(UserEntity user) : super(user: user);
}

final class RemoteAuthFailedState extends RemoteAuthState {
  const RemoteAuthFailedState(DioException exception)
      : super(exception: exception);
}
