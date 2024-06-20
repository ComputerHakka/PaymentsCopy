part of 'user_database_bloc.dart';

sealed class UserDatabaseEvent extends Equatable {
  final UserEntity? user;
  const UserDatabaseEvent({this.user});

  @override
  List<Object?> get props => [user];
}

class GetUserEvent extends UserDatabaseEvent {
  const GetUserEvent();
}

class SaveUserEvent extends UserDatabaseEvent {
  const SaveUserEvent({super.user});
}

class DeleteUserEvent extends UserDatabaseEvent {
  const DeleteUserEvent({super.user});
}
