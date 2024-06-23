part of 'change_contacts_bloc.dart';

sealed class ChangeContactsState extends Equatable {
  const ChangeContactsState();

  @override
  List<Object> get props => [];
}

final class ChangeContactsInitialState extends ChangeContactsState {}

final class ChangeContactsLoadingState extends ChangeContactsState {}
