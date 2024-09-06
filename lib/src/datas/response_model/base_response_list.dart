class BaseListResponse<T> {
  int errorCode;
  String message;
  List<T>? data;

  BaseListResponse({
    required this.errorCode,
    required this.message,
    required this.data,
  });

  factory BaseListResponse.fromJson(Map<String, dynamic> map, Function fromJsonModel) {
    return BaseListResponse(
      errorCode: map['error_code'],
      message: map['message'],
      data: List<T>.from((map['data'] as List).map((e) => fromJsonModel(e)).toList()),
    );
  }
}
