import 'dart:async';

import 'package:floor/floor.dart';
import 'package:personal_payment_app/features/data_storage/data/local/DAO/user_dao.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [UserModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDAO;
}
