import 'package:base_flutter_app/src/configs/config_environment.dart';
import 'package:base_flutter_app/src/utils/app_log.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class DioProvider {
  static const int _timeOut = 100000;
  static DioCacheInterceptor? _dioCacheInterceptor;
  static final options = CacheOptions(
    store: MemCacheStore(),
    cipher: null,
    allowPostMethod: false,
  );

  static DioCacheInterceptor getDioCacheInterceptor() {
    _dioCacheInterceptor ??= DioCacheInterceptor(options: options);
    return _dioCacheInterceptor!;
  }

  static Dio instance() {
    final dio = Dio()
      ..options.baseUrl = ConfigEnvironment.baseUrl
      ..options.connectTimeout = const Duration(milliseconds: _timeOut)
      ..options.receiveTimeout = const Duration(milliseconds: _timeOut)
      ..interceptors.add(HttpLogInterceptor())
      ..interceptors.add(getDioCacheInterceptor());
    return dio;
  }
}

class HttpLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    showLog(
      'REQUEST',
      'uri= ${options.uri}\n'
          'method= ${options.method}\n'
          'queryParams= ${options.queryParameters}\n'
          'headers= ${options.headers}\n'
          'data= ${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    showLog(
      'RESPONSE',
      'uri= ${response.realUri}\n'
          'statusCode= ${response.statusCode}\n'
          'body= ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    showLog(
      'ERROR',
      'statusCode= ${err.response?.statusCode}\n'
          'response= ${err.response}',
    );
    super.onError(err, handler);
  }
}
