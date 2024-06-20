import 'package:floor/floor.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';

@dao
abstract class UserDao {
  @Insert()
  Future<void> saveUser(UserModel user);

  @delete
  Future<void> deleteUser(UserModel user);

  @Query('SELECT * FROM user')
  Future<List<UserModel>> getUser();
}
