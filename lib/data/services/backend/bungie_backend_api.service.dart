// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'dart:developer';
import 'package:bungie_api/enums/bungie_membership_type.dart';
import 'package:http/http.dart' as http;

import 'package:bungie_api/helpers/bungie_net_token.dart';
import 'package:bungie_api/helpers/http.dart';
import 'package:quria/data/services/auth.service.dart';
import 'package:quria/data/services/storage/storage.service.dart';

class BackendService {
  static const String baseUrl = 'http://localhost:3001';
  static const String apiUrl = baseUrl;
  static final StorageService storageService = StorageService();

  static final BackendService _singleton = BackendService._internal();

  factory BackendService() {
    return _singleton;
  }
  BackendService._internal();

  getProfile(String? membershipId, BungieMembershipType? membershipType,
      [BungieNetToken? token]) async {
    final response = await http.get(
        Uri.parse('/inventory/$membershipType/$membershipId'),
        headers: {"Authorization": 'Bearer ' + token!.accessToken!});
    final responseJson = json.decode(response.body);
    await storageService.setDatabase("manifest", responseJson.manifest);

    return responseJson.response;
  }

  AuthService get auth => AuthService();
}

class Client implements HttpClient {
  BungieNetToken? token;
  bool? autoRefreshToken;
  int? retries = 0;
  Client({this.token, this.autoRefreshToken = true});

  @override
  Future<HttpResponse> request(HttpClientConfig config) async {
    var req = await _request(config);
    return req;
  }

  Future<HttpResponse> _request(HttpClientConfig config) async {
    Map<String, String> headers = {'Accept': 'application/json'};
    if (config.bodyContentType != null) {
      headers['Content-Type'] = config.bodyContentType!;
    }
    if (token != null) {
      headers['Authorization'] = "Bearer ${token!.accessToken}";
    }
    String paramsString = "";
    if (config.params != null) {
      config.params!.forEach((name, value) {
        late String valueStr;
        if (value is String) {
          valueStr = value;
        }
        if (value is num) {
          valueStr = "$value";
        }
        if (value is List) {
          valueStr = value.join(',');
        }
        if (paramsString.isEmpty) {
          paramsString += "?";
        } else {
          paramsString += "&";
        }
        paramsString += "$name=$valueStr";
      });
    }

    final http.Response response;

    if (config.method == 'GET') {
      response = await http.get(
          Uri.parse("${BackendService.apiUrl}${config.url}$paramsString"),
          headers: headers);
    } else {
      String body = config.bodyContentType == 'application/json'
          ? jsonEncode(config.body)
          : config.body;
      response = await http.post(
          Uri.parse("${BackendService.apiUrl}${config.url}$paramsString"),
          headers: headers,
          body: body);
    }

    if (response.statusCode == 401 && autoRefreshToken!) {
      token = await AuthService().refreshToken(token!);
      return _request(config);
    }
    dynamic json = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw response;
    }

    if (json["ErrorCode"] != null && json["ErrorCode"] > 2) {
      throw response;
    }
    return HttpResponse(json, response.statusCode);
  }
}
