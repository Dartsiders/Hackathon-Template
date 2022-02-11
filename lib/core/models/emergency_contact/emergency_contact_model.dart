import 'package:json_annotation/json_annotation.dart';

part 'emergency_contact_model.g.dart';

@JsonSerializable()
class EmergencyContactModel {
  String? emergencyContactId;
  String? emergencyContactName;
  String? emergencyContactPhoneNumber;
  String? emergencyContactRelationship;
  String? emergencyContactPhotoUrl;
  EmergencyContactModel({
    this.emergencyContactId,
    this.emergencyContactName,
    this.emergencyContactPhoneNumber,
    this.emergencyContactRelationship,
    this.emergencyContactPhotoUrl,
  });



  factory EmergencyContactModel.fromJson(Map<String, dynamic>? json) =>
      _$EmergencyContactModelFromJson(json!);

  Map<String, dynamic> toJson() {
    return _$EmergencyContactModelToJson(this);
  }
}
