import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@Named('logging_interceptor')
@Singleton(as: Interceptor)
class LoggingInterceptor implements Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    print('REQUEST[${options.method}] => PATH: ${options.uri.toString()}');
    return options;
  }
  @override
  Future onResponse(Response response) async {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.request?.path}');
    return response;
  }

  @override
  Future onError(DioError err) async {
    logPrint('*** Api Error - Start ***:');

    logPrint('error is instance of : ${err.toString()}');

    logPrint('URI: ${err.request.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response.statusCode?.toString()}');
    }
    logPrint('$err');
    if (err.response != null) {
      // printKV('REDIRECT', err.response.realUri);
      logPrint('BODY:');
      printAll(err.response?.toString());
    }

    logPrint('*** Api Error - End ***:');

    return err;
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    debugPrint(s);
  }

}