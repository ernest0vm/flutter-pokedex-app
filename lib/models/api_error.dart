class ApiError {
  ApiError({
    required this.message,
    required this.code,
  });

  String message;
  String code;

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        message: json['message'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'code': code,
      };
}
