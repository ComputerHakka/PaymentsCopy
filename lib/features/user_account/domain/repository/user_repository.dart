import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> login(AuthRequest request);

  Future<DataState<String>> createUser(UserModel request);

  Future<DataState<String>> changeContacts(
      int userId, ChangeContactsRequest request);

  Future<void> saveUserLocal(UserEntity user);

  Future<void> logout(UserEntity user);

  Future<void> updateUserLocal(UserEntity user);

  Future<DataState<String>> updateUserRemote(
      int userId, ChangeContactsRequest request);

  Future<UserModel?> getUser();
}
