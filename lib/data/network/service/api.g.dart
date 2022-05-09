// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppApi implements AppApi {
  _AppApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.unsplash.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Photo>> getListPhotos(page, perPage) async {
    ArgumentError.checkNotNull(page, 'page');
    ArgumentError.checkNotNull(perPage, 'perPage');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'per_page': perPage
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/photos',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'authenticate': null},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Photo.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
