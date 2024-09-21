import 'dart:convert';

import 'package:ERC/features/data/datasource/authentication_local_data_source.dart';
import 'package:http/http.dart';

import 'api_constants.dart';
import 'api_exceptions.dart';

class ApiClientForSync {
  final AuthenticationLocalDataSource _authenticationLocalDataSource;
  final Client _client;

  ApiClientForSync(this._client, this._authenticationLocalDataSource);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    String sessionId =
        await _authenticationLocalDataSource.getSessionId() ?? "";
    final pth = getPath(path, params); //?format=json

    final response = await _client.get(
      pth,
      headers: {
        'Authorization': 'Bearer $sessionId',
        'Content-Type': 'application/json',
      },
    );

    return response;
  }

  dynamic post(
    String path, {
    Map<dynamic, dynamic>? params,
    bool withToken = true,
  }) async {
    String sessionId =
        await _authenticationLocalDataSource.getSessionId() ?? "";
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    if (sessionId != '' && withToken) {
      userHeader.addAll({
        'Authorization': 'Bearer $sessionId',
      });
    }

    final pth = getPath(path, null);
    final response = await _client.post(
      pth,
      body: jsonEncode(params),
      headers: userHeader,
    );

    return response;
  }

  dynamic changePass(
    String path, {
    Map<dynamic, dynamic>? params,
    bool withToken = true,
  }) async {
    String sessionId =
        await _authenticationLocalDataSource.getSessionId() ?? "";
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };
    if (sessionId != '' && withToken) {
      userHeader.addAll({
        'Authorization': 'Bearer $sessionId',
      });
    }

    final pth = getPath(path, null);
    final response = await _client.post(
      pth,
      body: jsonEncode(params),
      headers: userHeader,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  dynamic put(String path, {Map<dynamic, dynamic>? params}) async {
    String sessionId =
        await _authenticationLocalDataSource.getSessionId() ?? "";
    Map<String, String> userHeader = {
      "Content-type": "application/json",
      "Accept": "application/json"
    };

    if (sessionId != '') {
      userHeader.addAll({'Authorization': 'Bearer $sessionId'});
    }
    final response = await _client.put(
      getPath(path, null),
      body: jsonEncode(params),
      headers: userHeader,
    );

    return response;
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    String sessionId =
        (await _authenticationLocalDataSource.getSessionId()) ?? "";
    final uri = Uri.parse('${ApiConstants.baseApiUrl}$path');
    final response = await _client.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $sessionId',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 204) {
      return {'success': true};
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.baseApiUrl}$path$paramsString');
  }
}
