import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/user_account/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.paymentAPIBaseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth')
  Future<HttpResponse<AuthResponse>> login(@Body() AuthRequest request);

  @POST('/user')
  Future<HttpResponse<String>> createUser(@Body() UserModel user);

  @PATCH('/user/{id}')
  Future<HttpResponse<String>> changeContacts(
      @Path() int id, @Body() ChangeContactsRequest request);
}
