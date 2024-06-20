part of 'remote_registration_bloc.dart';

sealed class RemoteRegistrationState extends Equatable {
  const RemoteRegistrationState();
  
  @override
  List<Object> get props => [];
}

final class RemoteRegistrationInitial extends RemoteRegistrationState {}
