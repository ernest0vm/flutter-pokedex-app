import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:pokedex/managers/stream_manager.dart';
import 'package:pokedex/models/api_error.dart';
import 'package:pokedex/models/api_response.dart';
import 'package:pokedex/models/environment.dart';

class ApiManager {
  ApiManager._internal();
  static final ApiManager _instance = ApiManager._internal();
  static ApiManager get instance => _instance;

  final String _baseUrl =
      '${Environment.instance.apiBaseUrl}/${Environment.instance.apiVersion}';

  Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptors()],
    retryPolicy: ExpiredTokenRetryPolicy(),
    requestTimeout: const Duration(seconds: 30),
  );

  Future<ApiResponse> getPokemonList(int limit, int offset) async {
    StreamManager.instance.appIsBusy(true);
    try {
      ApiResponse apiResponse =
          await APIResponseBuilder.fromResponseData(await client.get(
        Uri.parse('$_baseUrl/pokemon?limit=$limit&offset=$offset'),
      ));

      if (apiResponse.hasData) {
        StreamManager.instance.appIsBusy(false);
      }

      StreamManager.instance.appIsBusy(false);
      return apiResponse;
    } on PlatformException catch (e) {
      StreamManager.instance.appIsBusy(false);
      return ApiResponse(
        hasError: true,
        apiError: ApiError(
          message: e.message!,
          code: e.code,
        ),
      );
    }
  }

  Future<ApiResponse> getPokemon(String pokeId) async {
    StreamManager.instance.appIsBusy(true);
    try {
      ApiResponse apiResponse =
          await APIResponseBuilder.fromResponseData(await client.get(
        Uri.parse('$_baseUrl/pokemon/$pokeId/'),
      ));

      if (apiResponse.hasData) {
        StreamManager.instance.appIsBusy(false);
      }

      StreamManager.instance.appIsBusy(false);
      return apiResponse;
    } on PlatformException catch (e) {
      StreamManager.instance.appIsBusy(false);
      return ApiResponse(
        hasError: true,
        apiError: ApiError(
          message: e.message!,
          code: e.code,
        ),
      );
    }
  }
}

class APIResponseBuilder {
  static Future<ApiResponse> fromResponseData(dynamic data) async {
    ApiResponse apiResponse = ApiResponse();
    StreamManager.instance.appIsBusy(true);
    apiResponse.statusCode = data.statusCode;

    if (data.statusCode == 200 || data.statusCode == 201) {
      if (data.body != null && data.body.isNotEmpty) {
        apiResponse.data = jsonDecode(data.body);
        apiResponse.hasData = true;
      }
      apiResponse.hasError = false;
    } else if (data.statusCode >= 400) {
      ApiError error = ApiError.fromJson(jsonDecode(data.body));
      apiResponse.apiError = error;
      apiResponse.hasError = true;
    }

    StreamManager.instance.appIsBusy(false);
    return apiResponse;
  }
}

class LoggingInterceptors extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.headers[HttpHeaders.contentTypeHeader] = 'application/json';

      log("==> ${data.method.toString().replaceAll("Method.", "").toUpperCase()} ${(data.url)}");
      log('Headers:');
      data.headers.forEach((k, v) => log('$k: $v'));
      if (data.params.isNotEmpty) {
        log('Params:');
        data.params.forEach((k, v) => log('$k: $v'));
      }
      if (data.body != null && data.body.isNotEmpty) {
        log('Body: ${data.body}');
      }
      log("==> END ${data.method.toString().replaceAll("Method.", "").toUpperCase()}");
    } on Exception catch (e) {
      log(e.toString());
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    log('<== ${data.statusCode} ${data.url}');
    log('Body: ${data.body}');
    log('<== END HTTP');
    return data;
  }
}

class ExpiredTokenRetryPolicy extends RetryPolicy {
  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      log('unauthorized');
      return true;
    }

    if (response.statusCode == 500) {
      if (response.body!.contains('TokenExpiredError')) {
        log('token expired on status code 500');
      }

      return true;
    }

    return false;
  }
}
