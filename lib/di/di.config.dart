// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/error_handler.dart' as _i7;
import '../data/network/interceptor/logging_interceptor.dart' as _i9;
import '../data/network/service/api.dart' as _i6;
import '../data/network/source/app_data_source.dart' as _i5;
import '../data/network/source/photo_data_source.dart' as _i4;
import '../data/repository/photo_repo.dart' as _i3;
import 'network_module.dart' as _i10;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  gh.factory<_i3.PhotoRepository>(() =>
      _i3.PhotoDefaultRepository(photoDataSource: get<_i4.PhotoDataSource>()));
  gh.factory<String>(() => networkModule.apiKey, instanceName: 'api_key');
  gh.factory<String>(() => networkModule.scrKey, instanceName: 'secret_key');
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'base_url');
  gh.factory<_i5.AppDataSource>(() => _i4.PhotoDataSource(get<_i6.AppApi>()),
      registerFor: {_dev, _prod});
  gh.singleton<_i7.ErrorHandler>(_i7.ErrorHandler());
  gh.singleton<_i8.Interceptor>(networkModule.getApiKeyInterceptor(),
      instanceName: 'api_key_interceptor');
  gh.singleton<_i8.Interceptor>(_i9.LoggingInterceptor(),
      instanceName: 'logging_interceptor');
  gh.singleton<_i8.Dio>(networkModule.getDio(
      get<_i8.Interceptor>(instanceName: 'api_key_interceptor'),
      get<_i8.Interceptor>(instanceName: 'logging_interceptor')));
  gh.singleton<_i6.AppApi>(networkModule.getService(get<_i8.Dio>()));
  return get;
}

class _$NetworkModule extends _i10.NetworkModule {}
