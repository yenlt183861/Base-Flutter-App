class BaseResponse<T> {
  int errorCode;
  String message;
  T? data;

  BaseResponse({
    required this.errorCode,
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> map, Function fromJsonModel) {
    return BaseResponse(
      errorCode: map['error_code'],
      message: map['message'],
      data: fromJsonModel(map['data']),
    );
  }
}
