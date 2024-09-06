import 'dart:convert';
import 'dart:io';


import 'package:base_flutter_app/src/datas/enums/http_request_method.dart';
import 'package:base_flutter_app/src/services/api/dio_provider.dart';
import 'package:base_flutter_app/src/utils/app_log.dart';
import 'package:base_flutter_app/src/utils/barrel_utils.dart';
import 'package:dio/dio.dart';

import 'api_url.dart';
import 'error_from_server.dart';

class APIDataStore {
  Dio dio = DioProvider.instance();

  APIDataStore();

  Future<dynamic> resquestAPI(
    ApiURL apiURL, {
    String? customURL,
    Map<String, dynamic>? params,
    dynamic body,
    FormData? formData,
    bool tryAgain = true,
    Options? options,
  }) async {
    dynamic bodyRequest = '{}';
    if (body != null) {
      bodyRequest = jsonEncode(body);
    }
    if (formData != null) {
      bodyRequest = formData;
    }
    try {
      Response? response;
      switch (apiURL.method) {
        case HttpRequestMethod.get:
          response = await dio.get(
            customURL ?? apiURL.path,
            queryParameters: params,
            options: options,
          );
          break;

        case HttpRequestMethod.post:
          Options? _options;
          if (bodyRequest == null || bodyRequest is String) {
            _options = Options(
              headers: {Headers.contentTypeHeader: ContentType.json.value},
            );
          }
          if (bodyRequest is FormData) {
            _options = Options(
              headers: {
                Headers.acceptHeader: ContentType.json.value,
              },
            );
          }
          response = await dio.post(
            customURL ?? apiURL.path,
            queryParameters: params,
            data: bodyRequest,
            options: options ?? _options,
          );
          break;
        case HttpRequestMethod.put:
          response = await dio.put(
            customURL ?? apiURL.path,
            queryParameters: params,
            data: bodyRequest,
            options: options,
          );
          break;
        case HttpRequestMethod.patch:
          response = await dio.patch(
            customURL ?? apiURL.path,
            queryParameters: params,
            data: bodyRequest,
            options: options,
          );
          break;
        case HttpRequestMethod.delete:
          response = await dio.delete(
            customURL ?? apiURL.path,
            queryParameters: params,
            data: bodyRequest,
            options: options,
          );
          break;

        default:
          showLog('resquestAPI', 'Không có methods được tạo!');
          break;
      }

      int? errorCode = response?.data['error_code'];

      if (errorCode != null && errorCode == 0) {
        return response?.data;
      } else {
        // error code token expire
        final tokenExpireCode = 41;
        if (errorCode == tokenExpireCode) {
          final token = Singleton.instance.tokenLogin ?? await SessionManager.instance.getToken();
          if (token.isNotEmpty) {
            // request api again or navigate to login screen
            // Utils.cleanAllToken();
            // OneContext.instance.navigator
            //     .pushNamedAndRemoveUntil(AppRouter.LOGIN_SCREEN, (route) => false);
          }
        }
        throw ErrorFromServer.fromJson(response?.data);
      }
    } on SocketException catch (_) {
      throw ErrorFromServer.noInternetConnection();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw ErrorFromServer.unknownError(customMessage: 'Connection timeout!');
        case DioExceptionType.sendTimeout:
          throw ErrorFromServer.unknownError(customMessage: 'Sent timeout!');
        case DioExceptionType.receiveTimeout:
          throw ErrorFromServer.unknownError(customMessage: 'Receiving timeout!');
        case DioExceptionType.connectionError:
          throw ErrorFromServer.unknownError(customMessage: 'Connection error!');
        case DioExceptionType.cancel:
          throw ErrorFromServer.unknownError(customMessage: 'The request is cancelled!');
        default:
          throw ErrorFromServer.unknownError();
      }
    } catch (e) {
      throw ErrorFromServer.unknownError(customMessage: e.toString());
    }
  }
}
