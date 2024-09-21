import 'dart:convert';

import 'package:ecr/features/data/datasource/authentication_local_data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'api_constants.dart';
import 'api_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final AuthenticationLocalDataSource _authenticationLocalDataSource;
  final Client _client;

  ApiClient(this._client, this._authenticationLocalDataSource);

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

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      throw UnauthorisedException();
    } else {
      throw ExceptionWithMessage(response.reasonPhrase!);
    }
  }

  dynamic postphoto(String path, {required String filename}) async {
    String? sessionId = await _authenticationLocalDataSource.getSessionId();

    var headers = {"Accept": "application/json"};

    if (sessionId != '') headers.addAll({'Authorization': 'Bearer $sessionId'});

    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiConstants.baseApiUrl}$path'));
    if (kDebugMode) {}
    request.files.add(await http.MultipartFile.fromPath('avatar', filename));

    if (kDebugMode) {}
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (kDebugMode) {}

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
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

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 400) {
      String msg = "unknown_error";
      var resp = jsonDecode(utf8.decode(response.bodyBytes));
      if (resp.containsKey("error")) {
        msg = resp["error"];
      } else if (resp.containsKey("message")) {
        var rsp = resp["message"];

        if (rsp.runtimeType == String) msg = resp["message"];
        if (rsp.runtimeType == List) msg = rsp[0];
      }

      throw ExceptionWithMessage(msg);
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
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

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else if (response.statusCode == 401) {
      throw UnauthorisedException();
    } else if (response.statusCode == 400) {
      String msg = "unknown_error";
      var resp = jsonDecode(utf8.decode(response.bodyBytes));
      if (resp.containsKey("error")) {
        msg = resp["error"];
      } else if (resp.containsKey("message")) {
        msg = resp["message"];
      }
      throw ExceptionWithMessage(msg);
    } else {
      throw Exception(response.reasonPhrase);
    }
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
