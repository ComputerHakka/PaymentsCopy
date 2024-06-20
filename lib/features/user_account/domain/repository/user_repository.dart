import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> login(AuthRequest request);

  Future<DataState<String>> createUser(UserModel request);

  Future<DataState<String>> changeContacts(ChangeContactsRequest request);
}
