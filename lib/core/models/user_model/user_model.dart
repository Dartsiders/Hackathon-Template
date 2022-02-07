import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? userId;
  String? userName;

  UserModel({this.userId, this.userName});

  factory UserModel.fromJson(Map<String, dynamic>? json) =>
      _$UserModelFromJson(json!);

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}