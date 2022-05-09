import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@Named('api_key_interceptor')
class ApiKeyInterceptor extends Interceptor {
  @factoryMethod
  ApiKeyInterceptor(this.apiKey);

  final String apiKey;

  @override
  Future onRequest(RequestOptions options) async {
    if (options.headers.containsKey('authenticate')) {
      options.headers.remove('authenticate');
      options.queryParameters['api_key'] = apiKey;
    }

    return options;
  }
}