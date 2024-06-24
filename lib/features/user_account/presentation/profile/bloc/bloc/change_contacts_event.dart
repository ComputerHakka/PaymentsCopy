part of 'change_contacts_bloc.dart';

sealed class ChangeContactsEvent extends Equatable {
  final String? email;
  final String? phone;
  const ChangeContactsEvent({this.email, this.phone});

  @override
  List<Object?> get props => [email, phone];
}

class SendPhoneEvent extends ChangeContactsEvent {
  const SendPhoneEvent({super.phone});
}

class SendEmailEvent extends ChangeContactsEvent {
  const SendEmailEvent({super.email});
}

class ExitPageEvent extends ChangeContactsEvent {
  const ExitPageEvent();
}
