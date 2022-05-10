import 'package:dio/dio.dart';

class NetworkManager {
  final Dio dio;

  static String apiKey = 'Sai9GwaGE-QgaNy1jeDfDWrUyl8XAy2l5Z0Km-1QE8Q';

  static String scrKey = 'TcaaJoiDGNY9JwXEAw9g8rjbtajpLfnHsVVBqiC54bc';

  static String baseUrl = 'https://api.unsplash.com/';

  NetworkManager._(this.dio);

  final client = Dio(
    BaseOptions(
        contentType: "application/json",
        baseUrl: baseUrl,
        connectTimeout: 30000),
  );

// AppApi getService(Dio dio) => AppApi(dio);
}
