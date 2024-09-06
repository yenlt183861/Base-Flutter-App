
import 'package:base_flutter_app/generated/l10n.dart';

class ErrorFromServer implements Exception {
  final int? errorCode;
  final String? message;
  ErrorFromServer({this.errorCode, this.message});

  factory ErrorFromServer.fromJson(Map<String, dynamic> json) {
    try {
      return ErrorFromServer(
        errorCode: json['error_code'],
        message: json['message'],
      );
    } catch (e) {
      return ErrorFromServer.unknownError(customMessage: e.toString());
    }
  }

  factory ErrorFromServer.unknownError({String? customMessage}) {
    return ErrorFromServer(
      errorCode: -1,
      message: customMessage ?? S.current.unknown,
    );
  }

  factory ErrorFromServer.noInternetConnection({String? customMessage}) {
    return ErrorFromServer(
      errorCode: -2,
      message: customMessage ?? S.current.no_internet_connection,
    );
  }
}
