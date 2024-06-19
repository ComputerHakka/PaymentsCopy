import 'dart:io';
import 'package:dio/dio.dart';
import 'package:personal_payment_app/core/resources/data_state.dart';
import 'package:personal_payment_app/features/user_account/data/data_sources/remote/auth_api_service.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:personal_payment_app/features/user_account/domain/entities/user.dart';
import 'package:personal_payment_app/features/user_account/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthApiService _authApiService;

  UserRepositoryImpl(this._authApiService);

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
      print(e);
      return DataFailed(e);
    }
  }

  @override
  Future<void> changeContacts(ChangeContactsRequest request) {
    // TODO: implement changeContacts
    throw UnimplementedError();
  }

  @override
  Future<void> createUser(UserModel request) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
}
