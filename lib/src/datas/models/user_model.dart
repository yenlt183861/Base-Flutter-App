// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory UserModel({
    required int id,
    required String fullname,
    required String email,
  }) = _UserModel;

  const UserModel._(); // required for writting method class

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
