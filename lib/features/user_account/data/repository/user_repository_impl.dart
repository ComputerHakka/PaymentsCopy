import 'dart:io';
import 'package:dio/dio.dart';
import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/data_storage/data/local/app_database.dart';
import 'package:personal_payment_app/features/user_account/data/data_sources/remote/auth_api_service.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';
import 'package:personal_payment_app/features/user_account/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthApiService _authApiService;
  final AppDatabase _appDatabase;

  UserRepositoryImpl(this._authApiService, this._appDatabase);

  @override
  Future<DataState<UserEntity>> login(AuthRequest request) async {
    try {
      final httpResponse = await _authApiService.login(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.user);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> changeContacts(
      int userId, ChangeContactsRequest request) async {
    try {
      final httpResponse =
          await _authApiService.changeContacts(userId, request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> createUser(UserModel request) async {
    try {
      final httpResponse = await _authApiService.createUser(request);
      if (httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> logout(UserEntity user) {
    return _appDatabase.userDAO.deleteUser(UserModel.fromEntity(user));
  }

  @override
  Future<void> saveUserLocal(UserEntity user) {
    return _appDatabase.userDAO.saveUser(UserModel.fromEntity(user));
  }

  @override
  Future<UserModel?> getUser() async {
    final users = await _appDatabase.userDAO.getUser();
    return users.isNotEmpty ? users.first : null;
  }
}
