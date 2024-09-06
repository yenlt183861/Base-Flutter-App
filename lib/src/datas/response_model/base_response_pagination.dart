class BaseResponsePagination<T> {
  int errorCode;
  String message;
  int? count;
  String? next;
  String? previous;
  List<T>? data;

  BaseResponsePagination({
    required this.errorCode,
    required this.message,
    required this.data,
    this.next,
    this.count,
    this.previous,
  });

  factory BaseResponsePagination.fromJson(Map<String, dynamic> map, Function fromJsonModel) {
    return BaseResponsePagination(
      errorCode: map['error_code'],
      message: map['message'],
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      data: List<T>.from((map['data'] as List).map((e) => fromJsonModel(e)).toList()),
    );
  }
}
