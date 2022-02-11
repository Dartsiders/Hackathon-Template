import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? userId;
  String? userPhotoUrl;
  String? userName;
  String? userEmail;
  String? userPassword;

  UserModel({
    this.userId,
    this.userPhotoUrl,
    this.userName,
    this.userEmail,
    this.userPassword,
  });

 
  factory UserModel.fromJson(Map<String, dynamic>? json) =>
      _$UserModelFromJson(json!);

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
