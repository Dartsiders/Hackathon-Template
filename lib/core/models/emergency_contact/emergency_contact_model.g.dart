// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyContactModel _$EmergencyContactModelFromJson(
    Map<String, dynamic> json) {
  return EmergencyContactModel(
    emergencyContactId: json['emergencyContactId'] as String?,
    emergencyContactName: json['emergencyContactName'] as String?,
    emergencyContactPhoneNumber: json['emergencyContactPhoneNumber'] as String?,
    emergencyContactRelationship:
        json['emergencyContactRelationship'] as String?,
    emergencyContactPhotoUrl: json['emergencyContactPhotoUrl'] as String?,
  );
}

Map<String, dynamic> _$EmergencyContactModelToJson(
        EmergencyContactModel instance) =>
    <String, dynamic>{
      'emergencyContactId': instance.emergencyContactId,
      'emergencyContactName': instance.emergencyContactName,
      'emergencyContactPhoneNumber': instance.emergencyContactPhoneNumber,
      'emergencyContactRelationship': instance.emergencyContactRelationship,
      'emergencyContactPhotoUrl': instance.emergencyContactPhotoUrl,
    };
