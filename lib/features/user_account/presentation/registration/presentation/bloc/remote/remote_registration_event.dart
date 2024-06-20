part of 'remote_registration_bloc.dart';

sealed class RemoteRegistrationEvent extends Equatable {
  const RemoteRegistrationEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends RemoteRegistrationEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const CreateUserEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
