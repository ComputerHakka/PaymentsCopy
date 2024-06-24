part of 'user_database_bloc.dart';

sealed class UserDatabaseState extends Equatable {
  final UserEntity? user;
  const UserDatabaseState({this.user});

  @override
  List<Object?> get props => [user];
}

final class UserDatabaseLoadingState extends UserDatabaseState {
  const UserDatabaseLoadingState({super.user});
}

final class UserDatabaseNoneState extends UserDatabaseState {
  const UserDatabaseNoneState();
}

final class UserDatabaseLoginState extends UserDatabaseState {
  const UserDatabaseLoginState({super.user});
}
