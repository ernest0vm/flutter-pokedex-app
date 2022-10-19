import 'package:pokedex/models/api_error.dart';

class ApiResponse {
  ApiResponse({
    this.statusCode,
    this.hasError = false,
    this.hasData = false,
    this.apiError,
    this.data,
  });

  int? statusCode;
  bool hasError;
  bool hasData;
  ApiError? apiError;
  dynamic data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        statusCode: json['statusCode'],
        hasError: json['hasError'],
        hasData: json['hasData'],
        apiError: ApiError.fromJson(json['apiError']),
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'hasError': hasError,
        'hasData': hasData,
        'apiError': apiError?.toJson(),
        'data': data?.toJson(),
      };
}
