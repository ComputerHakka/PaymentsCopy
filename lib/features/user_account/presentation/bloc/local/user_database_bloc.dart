import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/delete_user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/get_user.dart';
import 'package:personal_payment_app/features/user_account/domain/usecases/save_user.dart';

part 'user_database_event.dart';
part 'user_database_state.dart';

class UserDatabaseBloc extends Bloc<UserDatabaseEvent, UserDatabaseState> {
  final GetUserUseCase _getUserUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final DeleteUserUseCase _deleteUserUseCase;
  UserDatabaseBloc(
      this._getUserUseCase, this._saveUserUseCase, this._deleteUserUseCase)
      : super(const UserDatabaseLoading()) {
    on<GetUserEvent>(onGetUser);
    on<DeleteUserEvent>(onDeleteUser);
    on<SaveUserEvent>(onSaveUser);
  }

  void onGetUser(GetUserEvent event, Emitter<UserDatabaseState> emit) async {
    final user = await _getUserUseCase();
    if (user == null) {
      emit(const UserDatabaseNone());
    } else {
      emit(UserDatabaseLogin(user: user));
    }
  }

  void onDeleteUser(
      DeleteUserEvent event, Emitter<UserDatabaseState> emit) async {
    await _deleteUserUseCase(params: event.user);
    emit(const UserDatabaseNone());
  }

  void onSaveUser(SaveUserEvent event, Emitter<UserDatabaseState> emit) async {
    await _saveUserUseCase(params: event.user);
    final user = await _getUserUseCase();
    emit(UserDatabaseLogin(user: user));
  }
}
