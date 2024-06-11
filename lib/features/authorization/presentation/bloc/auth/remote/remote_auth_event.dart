part of 'remote_auth_bloc.dart';

sealed class RemoteAuthEvent {
  const RemoteAuthEvent();
}

class LoginEvent extends RemoteAuthEvent {
  final String email;
  final String password;
  const LoginEvent(this.email, this.password);
}
