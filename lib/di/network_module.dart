import 'package:dio/dio.dart';
import 'package:flutter_wallpapers/data/network/service/api.dart';
import 'package:flutter_wallpapers/data/network/interceptor/api_key_interceptor.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @Named('api_key')
  String get apiKey => 'Sai9GwaGE-QgaNy1jeDfDWrUyl8XAy2l5Z0Km-1QE8Q';

  @Named('secret_key')
  String get scrKey => 'TcaaJoiDGNY9JwXEAw9g8rjbtajpLfnHsVVBqiC54bc';

  @Named('api_key_interceptor')
  @singleton
  Interceptor getApiKeyInterceptor() => ApiKeyInterceptor(apiKey);

  @Named('base_url')
  String get baseUrl => 'https://api.unsplash.com/';

  @singleton
  Dio getDio(@Named('api_key_interceptor') Interceptor apiKeyInterceptor,
      @Named('logging_interceptor') Interceptor loggingInterceptor) {
    final dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        baseUrl: baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ),
    )..interceptors.add(apiKeyInterceptor);
    dio.interceptors.add(loggingInterceptor);

    return dio;
  }

  @singleton
  AppApi getService(Dio dio) => AppApi(dio);

}