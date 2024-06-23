part of 'change_contacts_bloc.dart';

sealed class ChangeContactsEvent extends Equatable {
  const ChangeContactsEvent();

  @override
  List<Object> get props => [];
}

class SendChangeContacts extends ChangeContactsEvent {}
