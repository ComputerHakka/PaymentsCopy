part of 'user_database_bloc.dart';

sealed class UserDatabaseState extends Equatable {
  final UserEntity? user;
  const UserDatabaseState({this.user});

  @override
  List<Object?> get props => [user];
}

final class UserDatabaseLoading extends UserDatabaseState {
  const UserDatabaseLoading();
}

final class UserDatabaseNone extends UserDatabaseState {
  const UserDatabaseNone();
}

final class UserDatabaseLogin extends UserDatabaseState {
  const UserDatabaseLogin({super.user});
}
