// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmergencyModel _$EmergencyModelFromJson(Map<String, dynamic> json) {
  return EmergencyModel(
    emergencyId: json['emergencyId'] as String?,
    emergencyDetail: json['emergencyDetail'] as String?,
    emergencyLocation: json['emergencyLocation'] as String?,
    emergencyTime: json['emergencyTime'] as String?,
    emergencyPhotoUrl: json['emergencyPhotoUrl'] as String?,
    emergencyStatus: json['emergencyStatus'] as String?,
  );
}

Map<String, dynamic> _$EmergencyModelToJson(EmergencyModel instance) =>
    <String, dynamic>{
      'emergencyId': instance.emergencyId,
      'emergencyDetail': instance.emergencyDetail,
      'emergencyLocation': instance.emergencyLocation,
      'emergencyTime': instance.emergencyTime,
      'emergencyPhotoUrl': instance.emergencyPhotoUrl,
      'emergencyStatus': instance.emergencyStatus,
    };
