import 'package:ERC/core/api/api_client.dart';
import 'package:ERC/features/data/models/request_token_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<bool> restorePassword(
      String smsCode, String phoneNumber, String newPassword);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient _client;
  AuthenticationRemoteDataSourceImpl(this._client);

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      'api/token/',
      params: requestBody,
    );
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<bool> restorePassword(
      String smsCode, String phoneNumber, String newPassword) async {
    await _client.post(
      'users/change_password/',
      params: {
        "phone_number": phoneNumber,
        "new_password": newPassword,
        "sms_code": smsCode,
      },
    );
    return true;
  }
}
