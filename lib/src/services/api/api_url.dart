import 'package:base_flutter_app/src/datas/enums/http_request_method.dart';

enum ApiURL { login }

extension ApiURLEx on ApiURL {
  String get path {
    switch (this) {
      case ApiURL.login:
        return '/v1/login';
      default:
        return 'undefine';
    }
  }

  HttpRequestMethod? get method {
    switch (this) {
      // - API Using POST Method
      case ApiURL.login:
        return HttpRequestMethod.post;
      default:
        return null;
    }
  }
}
