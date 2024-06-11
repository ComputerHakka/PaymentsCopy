import 'package:personal_payment_app/core/constants/constants.dart';
import 'package:personal_payment_app/features/authorization/data/models/user.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.paymentAPIBaseURL)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST('/auth')
  Future<HttpResponse<AuthResponse>> login(@Body() AuthRequest request);
}


  // @POST('/user')
  // Future<void> createUser(@Body() UserModel user);
