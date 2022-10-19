class Environment {
  Environment._internal();
  static final Environment _instance = Environment._internal();
  static Environment get instance => _instance;

  late final String _apiBaseUrl;
  late final String _apiVersion;

  void setEnvironment({
    required String apiBaseUrl,
    required String apiVersion,
  }) {
    _apiBaseUrl = apiBaseUrl;
    _apiVersion = apiVersion;
  }

  String get apiBaseUrl => _apiBaseUrl;
  String get apiVersion => _apiVersion;
}
